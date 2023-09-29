import 'package:medismart_2023/domain/infrastructure/models/user/user_home_services_response.dart';

class UserData {
    final int userId;
    final int personId;
    final String identifier;
    final int id;
    final String name;
    final String firstLastName;
    final String secondLastName;
    final String email;
    final String phoneNumber;
    final String mobilePhoneNumber;
    final DateTime birthDate;
    final String gender;
    final String address;
    final String foresight;
    final int timeZone;
    final String allergies;
    final String diseases;
    final String medicines;
    final String surgeries;
    final String habits;
    final String status;
    final int idCliente;
    final List<HomeService> homeServices;

    UserData( {
        required this.userId,
        required this.personId,
        required this.identifier,
        required this.id,
        required this.name,
        required this.firstLastName,
        required this.secondLastName,
        required this.email,
        required this.phoneNumber,
        required this.mobilePhoneNumber,
        required this.birthDate,
        required this.gender,
        required this.address,
        required this.foresight,
        required this.timeZone,
        required this.allergies,
        required this.diseases,
        required this.medicines,
        required this.surgeries,
        required this.habits,
        required this.status,
        required this.idCliente,
        required this.homeServices,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json["userId"],
        personId: json["personId"],
        identifier: json["identifier"] ?? '',
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        firstLastName: json["firstLastName"] ?? '',
        secondLastName: json["secondLastName"] ?? '',
        email: json["email"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        mobilePhoneNumber: json["mobilePhoneNumber"] ?? '',
        birthDate: DateTime.parse(json["birthDate"]),
        gender: json["gender"] ?? '',
        address: json["address"] ?? '',
        foresight: json["foresight"] ?? '',
        timeZone: json["timeZone"],
        allergies: json["allergies"] ?? '',
        diseases: json["diseases"] ?? '',
        medicines: json["medicines"] ?? '',
        surgeries: json["surgeries"] ?? '',
        habits: json["habits"] ?? '',
        status: json["status"] ?? '',
        idCliente: json["idCliente"] ?? 0,
        homeServices: List<HomeService>.from(json["homeServices"].map((x) => HomeService.fromJson(x))), 
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "personId": personId,
        "identifier": identifier,
        "id": id,
        "name": name,
        "firstLastName": firstLastName,
        "secondLastName": secondLastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "mobilePhoneNumber": mobilePhoneNumber,
        "birthDate": birthDate.toIso8601String(),
        "gender": gender,
        "address": address,
        "foresight": foresight,
        "timeZone": timeZone,
        "allergies": allergies,
        "diseases": diseases,
        "medicines": medicines,
        "surgeries": surgeries,
        "habits": habits,
        "status": status,
        "idCliente": idCliente,
        "homeServices": List<dynamic>.from(homeServices.map((x) => x.toJson())),
    };
}

