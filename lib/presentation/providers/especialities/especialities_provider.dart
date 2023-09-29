import 'package:medismart_2023/domain/datasources/especialities_datasource.dart';
import 'package:medismart_2023/domain/infrastructure/repositories/especialities_respository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/especialitie/especialitie.dart';

part 'especialities_provider.g.dart';

@Riverpod(keepAlive: true)
class Especialities extends _$Especialities {
  int currentPage = 0;
  final impl = EspecialicitieRepositoryImpl(EspecialitiesResp());

  @override
  List<Especialitie> build() {
    return [];
  }

  Future<void> getEspecialities(idUsuario, idCliente, tipo) async {
    final especialities =
        await impl.getEspecialities(idUsuario, idCliente, tipo);
    if (especialities.isEmpty) {
      state = [];
    }

    state = especialities;

    print(state);
  }
}
