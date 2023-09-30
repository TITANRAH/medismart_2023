import 'package:medismart_2023/domain/infrastructure/repositories/medical_directory_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/datasources/medical_directory_datasource.dart';
import '../../../domain/entities/medical-directory/medical-directory.dart';

part 'medical_directory_provider.g.dart';

@riverpod
class MedicalDirectoryDoctors extends _$MedicalDirectoryDoctors {
  final impl = MedicalDirectoryRepositoryImpl(MedicalDirectoryDatasource());
  @override
  List<MedicalDirectory> build() {
    return [];
  }

  Future<void> getMedicalDirectory(idUsuario, idCliente, tipo) async {
    final directory =
        await impl.getMedicalDirectory(idUsuario, idCliente, tipo);

    if (directory.isNotEmpty) {
      state = directory.toSet().toList();
    } else {
      state = [];
    }

    print(state);
  }
}
