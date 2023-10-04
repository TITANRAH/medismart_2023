import 'package:medismart_2023/config/utils/utils.dart';
import 'package:medismart_2023/domain/datasources/user_datasource.dart';
import 'package:medismart_2023/domain/entities/user-entity/user.dart';
import 'package:medismart_2023/domain/entities/user-entity/user_home_services.dart';
import 'package:medismart_2023/domain/infrastructure/repositories/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class UserActive extends _$UserActive {
  final impl = UserRepositoryImpl(UserDatasource());

  @override
  User build() {
    return User();
  }

  Future<void> getUser(String userName, String password) async {
    final user = await impl.getUser(userName, password);
    print('USER DESDE PROVIDER ${user.homeServices}');
    state = user;
    print('USER DESDE PROVIDER $state');
  }

   returnUser() {
    return state;
  }
}

@Riverpod(keepAlive: true)
Future<List<UserHomeServices>> services(ServicesRef ref) async {
  final user = ref.watch(userActiveProvider);
  final List<UserHomeServices> servicesList = [];
  if (user.homeServices == null) return [];

  for (var s in serviceOrder) {
    for (var h in user.homeServices!) {
      if (s == h.cod) servicesList.add(h);
    }
  }

  return servicesList;
}

@riverpod
class IsLoading extends _$IsLoading {
  @override
  build() {
    return false;
  }

  void isTrue() {
    state = true;
  }

  void isFalse() {
    state = false;
  }

 
}
