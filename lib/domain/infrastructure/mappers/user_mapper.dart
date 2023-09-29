
import 'package:medismart_2023/domain/entities/user-entity/user.dart';
import 'package:medismart_2023/domain/entities/user-entity/user_home_services.dart';
import 'package:medismart_2023/domain/infrastructure/models/user/user_response.dart';

class UserMapper {
  static User userResponsetoEntity(UserResponse user) => User(
    token: user.token, 
    homeServices: user.userData.homeServices.map((servicio) => UserHomeServices.fromHomeService(servicio)).toList(),
    name: user.userData.name,
    id: user.userData.id,
    userId: user.userData.userId,
    identifier: user.userData.identifier,
    timeZone: user.userData.timeZone,
    address: user.userData.address,
    allergies: user.userData.allergies,
    birthDate: user.userData.birthDate,
    diseases: user.userData.diseases,
    email: user.userData.email,
    firstLastName: user.userData.firstLastName,
    foresight: user.userData.foresight,
    gender: user.userData.gender,
    habits: user.userData.habits,
    idCliente: user.userData.idCliente,
    medicines: user.userData.medicines,
    mobilePhoneNumber:  user.userData.mobilePhoneNumber,
    phoneNumber:  user.userData.phoneNumber,
    secondLastName:  user.userData.secondLastName,
    status:  user.userData.status,
    surgeries:  user.userData.surgeries
 );
}
