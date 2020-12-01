class Address {
  final int id;
  final String country;
  final String state;
  final String city;
  final String neigh;
  final String street;
  final String number;
  final String cep;

  Address({
    this.id,
    this.country,
    this.state,
    this.city,
    this.neigh,
    this.street,
    this.number,
    this.cep,
  });

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      id: json['id'],
      cep: json['cep'],
      city: json['cidade'],
      state: json['estado'],
      street: json['rua'],
      number: json['numero'],
      neigh: json['bairo'],
      country: json['pais']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'pais': 'br',
    'estado': state,
    'cidade': city,
    'rua': street,
    'numero': number,
    'bairo': neigh,
    'cep': cep
  };


}
