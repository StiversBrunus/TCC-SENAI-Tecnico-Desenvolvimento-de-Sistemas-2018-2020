import 'package:fypp/app/model/portfolioPhoto.dart';

class Portfolio {
  final int id;
  final String name;
  final String desc;
  final int photId;
  final List<PortfolioPhoto> photos;

  Portfolio({this.id, this.name, this.desc, this.photId, this.photos});

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    List<PortfolioPhoto> photos = List<PortfolioPhoto>();
    if (json['fotoPortfolios'] != null) {
      json['fotoPortfolios'].forEach((value) {
        PortfolioPhoto photo = PortfolioPhoto.fromJson(value);
        photos.add(photo);
      });
    }

    return Portfolio(
      id: json['id'],
      name: json['nome'],
      desc: json['descricao'],
      photId: json['id_fotografo'],
      photos: photos
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': name,
    'descricao': desc,
    'id_fotografo': photId,
    'fotoPortfolios': photos
  };

}
