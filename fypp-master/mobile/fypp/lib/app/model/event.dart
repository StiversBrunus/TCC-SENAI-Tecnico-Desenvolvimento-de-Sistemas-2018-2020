import 'package:fypp/app/model/address.dart';

class Event {
  final int id;
  final String date;
  final String initialTime;
  final String finalTime;
  final Map<String, dynamic> address;
  final int photographerId;
  final int userId;
  final int categoryId;
  final int bundleId;

  Event({
    this.id,
    this.date,
    this.initialTime,
    this.finalTime,
    this.address,
    this.photographerId,
    this.userId,
    this.categoryId,
    this.bundleId
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'data': date,
    'horario_inicio': initialTime,
    'horario_fim': finalTime,
    'enderecos': address,
    'id_fotografo': photographerId,
    'id_cliente': userId,
    'id_especialidade': categoryId,
    'id_pacote': bundleId
  };

}
