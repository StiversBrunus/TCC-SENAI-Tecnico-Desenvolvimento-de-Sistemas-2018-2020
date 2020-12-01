class User {
  final int id;
  final String name;
  final String phone;
  final String cep;
  final Map<String, dynamic> address;
  final String email;
  final String password;
  final String role;
  final String profilePic;
  final String token;

  User({
    this.id,
    this.name,
    this.phone,
    this.cep,
    this.address,
    this.email,
    this.password,
    this.role,
    this.profilePic,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['nome'],
      phone: json['telefone'],
      cep: json['cep'],
      address: json['enderecos'],
      email: json['email'],
      password: json['senha'],
      role: json['role'],
      profilePic: json['fotoPerfil'],
      token: json['token']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': name,
    'telefone': phone,
    'cep': cep,
    'enderecos': address,
    'email': email,
    'senha': password,
    'token': token,
    'role': 'ADMIN',
    'fotoPerfil': profilePic
  };

}
