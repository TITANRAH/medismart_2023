import 'package:medismart_2023/domain/infrastructure/models/user/user_home_services_response.dart';

class UserHomeServices {
  final String cod;
  final String texto;
  final String subTexto;
  final String? tipoServicio;

  UserHomeServices({
    required this.cod,
    required this.texto,
    required this.subTexto,
     this.tipoServicio,
  });


  factory UserHomeServices.fromHomeService(HomeService homeService) {
    return UserHomeServices(
      cod: homeService.cod,
      texto: homeService.texto,
      subTexto: homeService.subTexto,
      tipoServicio: homeService.subTexto
    );
  }
}
