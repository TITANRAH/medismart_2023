class AvalaibleMedicalHoursEntity {
  final int idMedico;
  final String nombreMedico;
  final int idHora;
  final int idBloqueHora;
  final String nombrePaciente;
  final String estadoAtencion;
  final String especialidad;
  final int valorAtencion;
  final int zonaHoraria;
  final String horaDesde;
  final String horaHasta;
  final int idMedicoHora;
  final String horaDesdeText;
  final String fechaText;
  final DateTime fechaHora;
  final String titulo;
  final String prefijoProfesional;
  final bool profesionalesAsociados;

  AvalaibleMedicalHoursEntity({
    required this.idMedico,
    required this.nombreMedico,
    required this.idHora,
    required this.idBloqueHora,
    required this.nombrePaciente,
    required this.estadoAtencion,
    required this.especialidad,
    required this.valorAtencion,
    required this.zonaHoraria,
    required this.horaDesde,
    required this.horaHasta,
    required this.idMedicoHora,
    required this.horaDesdeText,
    required this.fechaText,
    required this.fechaHora,
    required this.titulo,
    required this.prefijoProfesional,
    required this.profesionalesAsociados,
  });
}
