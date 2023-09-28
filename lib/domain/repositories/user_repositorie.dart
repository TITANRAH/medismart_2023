
import 'package:medismart_2023/domain/entities/user.dart';

// la diferencia es que los repositorios llaman al datasource
// si cambiara el origen de datos cambio datasouyrce pero el repositorio no

abstract class UserRepository {
  Future<User> getUser(String userName, String password);
}
