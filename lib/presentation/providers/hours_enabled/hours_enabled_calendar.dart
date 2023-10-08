import 'package:medismart_2023/presentation/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hours_enabled_calendar.g.dart';

@riverpod
class HoursEnabledCalendar extends _$HoursEnabledCalendar {
  List hours = [];
  int startIndex = 0;
  int endIndex = 3; // El índice final inicial es 3 para mostrar las primeras 4 horas

  @override
  build() {
    return ref.watch(avalaibleMedicalHoursProvider);
  }

  getHoursEnabledCalendar() {
    hours = ref.watch(avalaibleMedicalHoursProvider);

    print('desde provider de horas $hours');

    return hours;
  }

  visibleHours() {
    final availableHours = getHoursEnabledCalendar();

    // Verifica si availableHours está vacío
    if (availableHours.isEmpty) {
      return [];
    }

    // Asegúrate de que startIndex esté dentro del rango válido
    startIndex = startIndex.clamp(0, availableHours.length - 1).toInt();
    // Calcula el endIndex basado en el startIndex
    final endIndex = (startIndex + 3).clamp(0, availableHours.length - 1).toInt();

    // Retorna un subconjunto de las horas basado en los índices startIndex y endIndex
    return availableHours.sublist(startIndex, endIndex + 1);
  }

  void showNext() {
    final availableHours = getHoursEnabledCalendar();
    if (availableHours.isNotEmpty && startIndex + 4 < availableHours.length) {
      startIndex += 4;
    } else {
      // Evita que los índices se desborden y ajusta el índice inicial para mostrar las últimas horas disponibles
      startIndex = availableHours.length - 4;
    }
  }

  void showPrevious() {
    if (startIndex - 4 >= 0) {
      startIndex -= 4;
    } else {
      // Evita que los índices sean negativos y ajusta el índice inicial para mostrar las primeras horas disponibles
      startIndex = 0;
    }
  }
}
