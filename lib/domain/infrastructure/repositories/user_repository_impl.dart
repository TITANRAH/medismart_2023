
import 'package:medismart_2023/domain/datasources/user_datasource.dart';
import 'package:medismart_2023/domain/entities/user-entity/user.dart';
import 'package:medismart_2023/domain/repositories/user_repositorie.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<User> getUser(String userName ,String password) {
    return dataSource.getUser(userName, password);
  }

}
