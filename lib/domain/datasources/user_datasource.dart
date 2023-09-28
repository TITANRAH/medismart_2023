import 'package:dio/dio.dart';
import 'package:medismart_2023/domain/entities/user.dart';
import 'package:medismart_2023/domain/infrastructure/datasources/user_response_datasource.dart';
import 'package:medismart_2023/domain/infrastructure/mappers/user_mapper.dart';
import 'package:medismart_2023/domain/infrastructure/models/user/user_response.dart';

class UserDatasource extends UserResponseDataSource {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api-auth-ms-qa.azurewebsites.net/',
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
  ));

  @override
  Future<User> getUser(String userName, String password) async {
    try {
      final response = await dio.post(
        'api/Login',
        data: {
          "userName": userName,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        final userResponse = UserResponse.fromJson(response.data);
        final User user = UserMapper.userResponsetoEntity(userResponse);
        return user;
      } else {
        throw Error();
      }
    } catch (e) {
      // print("Error en la solicitud HTTP: $e");
      throw e; 
    }
  }
}
