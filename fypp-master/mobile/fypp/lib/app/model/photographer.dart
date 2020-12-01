import 'package:fypp/app/model/address.dart';
import 'package:fypp/app/model/category.dart';
import 'package:fypp/app/model/portfolio.dart';

class Photographer {
  final int id;
  final String name;
  final String birthDate;
  final String cpf;
  final String phone;
  final String cep;
  final Map<String, dynamic> address;
  final String experience;
  final String role;
  final String email;
  final String password;
  final List categories;
  final List<Portfolio> portfolios;
  final String token;
  final String profilePic;

  Photographer(
      {this.id,
      this.name,
      this.cpf,
      this.birthDate,
      this.phone,
      this.cep,
      this.address,
      this.experience,
      this.role,
      this.email,
      this.password,
      this.categories,
      this.portfolios,
      this.token,
      this.profilePic});

  factory Photographer.fromJson(Map<String, dynamic> json) {
    List<Category> categories = List<Category>();
    if (json['especialidades'] != null) {
      json['especialidades'].forEach((value) {
        Category category = Category.fromJson(value);
        categories.add(category);
      });
    }

    List<Portfolio> portfolios = List<Portfolio>();
    if (json['portfolios'] != null) {
      json['portfolios'].forEach((value) {
        Portfolio portfolio = Portfolio.fromJson(value);
        portfolios.add(portfolio);
      });
    }

    return Photographer(
      id: json['id'],
      name: json['nome'],
      birthDate: json['data_nascimento'],
      cpf: json['cpf'],
      phone: json['telefone'],
      cep: json['cep'],
      address: json['enderecos'],
      experience: json['experiencia'],
      role: json['role'],
      email: json['email'],
      password: json['senha'],
      token: json['token'],
      profilePic: json['fotoPerfil'],
      categories: categories,
      portfolios: portfolios
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': name,
        'cpf': cpf,
        'data_nascimento': birthDate,
        'telefone': phone,
        'cep': cep,
        'enderecos': address,
        'experiencia': experience,
        'role': 'ADMIN',
        'email': email,
        'senha': password,
        'fotoPerfil': profilePic,
        'especialidades': categories,
        'portfolios': portfolios,
        'token': token
      };
}
