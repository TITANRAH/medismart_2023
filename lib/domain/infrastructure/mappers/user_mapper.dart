
import 'package:medismart_2023/domain/entities/user.dart';
import 'package:medismart_2023/domain/entities/user_home_services.dart';
import 'package:medismart_2023/domain/infrastructure/models/user/user_response.dart';

class UserMapper {
  static User userResponsetoEntity(UserResponse user) => User(
    token: user.token, 
    homeServices: user.userData.homeServices.map((servicio) => UserHomeServices.fromHomeService(servicio)).toList(),
    name: user.userData.name,
 );
}
