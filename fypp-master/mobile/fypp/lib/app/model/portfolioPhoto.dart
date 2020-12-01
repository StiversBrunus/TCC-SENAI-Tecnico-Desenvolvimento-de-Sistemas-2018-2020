class PortfolioPhoto {
  final int id;
  final String name;
  final String desc;
  final String url;

  PortfolioPhoto({this.id, this.name, this.desc, this.url});

  factory PortfolioPhoto.fromJson(Map<String, dynamic> json) {
    return PortfolioPhoto(
      id: json['id'],
      name: json['nome'],
      desc: json['descricao'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': name,
    'descricao': desc,
    'url': url
  };

}
