import 'package:medismart_2023/domain/entities/user-entity/user_home_services.dart';


class User {
  final String? token;
  final List<UserHomeServices>? homeServices;
  final String? name;

  User( {
    this.token,
    this.homeServices, 
    this.name,
  });
}
