import 'package:medismart_2023/domain/datasources/especialities_datasource.dart';
import 'package:medismart_2023/domain/entities/especialitie/especialitie.dart';
import 'package:medismart_2023/domain/repositories/especialities_repository.dart';

class EspecialicitieRepositoryImpl extends EspecialitiesRepository {
  final EspecialitiesResp dataSource;

  EspecialicitieRepositoryImpl(this.dataSource);

  @override
  Future<List<Especialitie>> getEspecialities(
      int idUsuario, int idCliente, String tipo) {
    return dataSource.getEspecialities(idUsuario, idCliente, tipo);
  }
}
