import 'package:medismart_2023/domain/infrastructure/repositories/medical_directory_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/datasources/medical_directory_datasource.dart';
import '../../../domain/entities/medical-directory/medical_directory.dart';

part 'medical_directory_provider.g.dart';

@Riverpod(keepAlive: true)
class MedicalDirectoryDoctors extends _$MedicalDirectoryDoctors {
  final impl = MedicalDirectoryRepositoryImpl(MedicalDirectoryDatasource());
  late String currentValueEspecialitie = 'Selecciona una especialidad';
  bool isLoading = false;
  bool isLoadingTipoO = false;
  bool isLoadingTipoS = false;
  bool isLoadingTipoV = false;

  @override
  List<MedicalDirectory> build() {
    return [];
  }

  Future<void> getMedicalDirectory(idUsuario, idCliente, tipo) async {
    if (tipo == 'O') {
      isLoadingTipoO = true;
    } else if (tipo == 'S') {
      isLoadingTipoS = true;
    } else if (tipo == 'V') {
      isLoadingTipoV = true;
    }

    isLoading = true;
    final directory = await impl.getMedicalDirectory(idUsuario, idCliente, tipo);

    if (directory.isNotEmpty) {
      isLoadingTipoO = false;
      isLoadingTipoS = false;
      isLoadingTipoV = false;
      isLoading = false;
      state = directory.toSet().toList();
    } else {
      isLoading = false;
      isLoadingTipoO = false;
      isLoadingTipoS = false;
      isLoadingTipoV = false;
      state = [];
    }

    print(state);
  }

  String getCurrentEspecialitie(String currentValue) {
    currentValueEspecialitie = currentValue;

    return currentValueEspecialitie;
  }

  filteredDoctors(String currentValue, int codeEspecialitie, int userId, String typeService, int idClient
      // llamar al tipo de servicio
      ) {
    // Aplica el filtrado a la lista de médicos
    List<MedicalDirectory> filteredDirectoryDoctors = state.where((doc) {
      return doc.codigoEspecialidad == codeEspecialitie;
    }).toList();

    if (filteredDirectoryDoctors.isNotEmpty) {
      return state = filteredDirectoryDoctors;
    } else {
      state = [];
      Future.delayed(
          const Duration(seconds: 2),
          () => {
                // PARAMETRIZAR ME TRAERA SIEMPRE LOS DE O
                // ARREGLAR TEXTO
                getMedicalDirectory(userId, idClient, typeService)
              });
    }
  }

  filteredUniqueDoc(int idDoctor) {
    final doctor = state.firstWhere((doc) => doc.idMedico == idDoctor);

    return doctor;
  }
}
