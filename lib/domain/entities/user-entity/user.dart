import 'package:medismart_2023/domain/entities/user-entity/user_home_services.dart';

class User {
  final String? token;
  final int? id;
  final int? userId;
  final List<UserHomeServices>? homeServices;
  final String? name;
  final String? identifier;
  final String? firstLastName;
  final String? secondLastName;
  final String? email;
  final String? phoneNumber;
  final String? mobilePhoneNumber;
  final DateTime? birthDate;
  final String? gender;
  final String? address;
  final String? foresight;
  final int? timeZone;
  final String? allergies;
  final String? diseases;
  final String? medicines;
  final String? surgeries;
  final String? habits;
  final String? status;
  final int? idCliente;

  User({
    this.id,
    this.userId,
    this.identifier,
    this.firstLastName,
    this.secondLastName,
    this.email,
    this.phoneNumber,
    this.mobilePhoneNumber,
    this.birthDate,
    this.gender,
    this.address,
    this.foresight,
    this.timeZone,
    this.allergies,
    this.diseases,
    this.medicines,
    this.surgeries,
    this.habits,
    this.status,
    this.idCliente,
    this.token,
    this.homeServices,
    this.name,
  });
}
