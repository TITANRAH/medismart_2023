
import 'package:medismart_2023/domain/entities/especialitie/especialitie.dart';

abstract class EspecialitiesResponseDataSource {
  Future<List<Especialitie>> getEspecialities(int idUsuario, int idCliente, String tipo);
}
