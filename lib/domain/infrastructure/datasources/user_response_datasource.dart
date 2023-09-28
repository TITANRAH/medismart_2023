
import 'package:medismart_2023/domain/entities/user-entity/user.dart';

abstract class UserResponseDataSource {
  Future<User> getUser(String userName, String password);
}
