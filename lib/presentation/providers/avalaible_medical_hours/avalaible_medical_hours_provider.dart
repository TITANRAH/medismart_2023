import 'package:medismart_2023/domain/datasources/avalaible_medical_hours_datasource.dart';
import 'package:medismart_2023/domain/entities/avalaible-medical-hours-entity/avalaible_medical_hours_entity.dart';
import 'package:medismart_2023/domain/infrastructure/repositories/avalaible_medical_hours_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'avalaible_medical_hours_provider.g.dart';

@riverpod
class AvalaibleMedicalHours extends _$AvalaibleMedicalHours {
  final impl = AvalaibleMedicalHoursRepositoryImpl(AvalaibleMedicalHoursDatasource());
  String fechaSelect = '';
  int _startIndex = 0; // Inicializa el valor inicial de startIndex
  int _endIndex = 3; // Inicializa el valor inicial de endIndex
  dynamic intemCount;

  List<AvalaibleMedicalHoursEntity> hoursItemCount = [];

  @override
  List<AvalaibleMedicalHoursEntity> build() {
    return [];
  }

  void onSelectionChanged(
    DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs,
    int idMedico,
    int idConvenio,
    int idPaciente,
  ) {
    fechaSelect = dateRangePickerSelectionChangedArgs.value.toString().split(' ')[0];

    print('enabledDatesBySelectedHour $fechaSelect');

    getAvalaibleHours(fechaSelect, idMedico, idConvenio, idPaciente);
  }

  Future<void> getAvalaibleHours(
    String fecha,
    int idMedico,
    int idConvenio,
    int idPaciente,
  ) async {
    print('fecha desde provider getAvalaibleHours $fecha');
    print('idMedico getAvalaibleHours $idMedico');
    print('idPaciente getAvalaibleHours $idPaciente');
    final availablesHours = await impl.getAvalaibleMedicalHours(
      fecha,
      idMedico,
      true,
      false,
      idConvenio,
      idPaciente,
      0,
    );

    if (availablesHours.isNotEmpty) {
      state = hoursSelectedDate(availablesHours.toSet().toList(), fecha);
    } else {
      state = [];
    }

    print('state de Avalaibles provider ${state.length} ');
  }

  hoursSelectedDate(List<AvalaibleMedicalHoursEntity> hours, String fechaSelected) {
    print('fechaSelected $fechaSelected');
    print('lista de horas ${hours[0].fechaHora}');

    List<AvalaibleMedicalHoursEntity> hoursDate = hours.where((h) => h.fechaHora.toString().split(' ')[0] == fechaSelected).toList();

    print('horas para esa la fecha $fechaSelected ${hoursDate.length}');

    return hoursDate;
  }

  getStartEnd() {
    return _endIndex - _startIndex + 1;
  }

// void showPrevious() {
//       print('previus');

//       if (_startIndex >= 4) {
//         _startIndex = _startIndex - 4;
//         _endIndex = _endIndex - 4;

//       }
//       print('startIndex $_startIndex');
//       print('endIndex $_endIndex');
//     }

//     void showNext() {
//       if (_endIndex + 4 < state.length) {
//         print('next');
//         _startIndex = _startIndex + 4;
//         _endIndex = _endIndex + 4;
//       }

//       print('startIndex $_startIndex');
//       print('endIndex $_endIndex');
//     }

  // Métodos para obtener los valores actuales de inicio y final
  int getStart() => _startIndex;
  int getEnd() => _endIndex;

  // Método para incrementar el valor de inicio
  void incrementStart(int value) {
    print('i s');
    _startIndex += value;
  }

  // Método para decrementar el valor de inicio
  void decrementStart(int value) {
    print('d s');
    _startIndex -= value;
  }

  // Método para incrementar el valor de final
  void incrementEnd(int value) {
    print('i e');
    _endIndex += value;
  }

  // Método para decrementar el valor de final
  void decrementEnd(int value) {
    print('d e');
    _endIndex -= value;
  }

  itemCount(int count) {
    intemCount = count;
  }

  itemCountReturn() {
    return intemCount;
  }
}
