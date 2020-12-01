class Bundle {
  final int id;
  final String name;
  final String desc;
  final double price;

  Bundle({
    this.id,
    this.name,
    this.desc,
    this.price,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': name,
    'descricao': desc,
    'valor': price
  };

}
