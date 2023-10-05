const String atencionInmediata = './assets/svg/atencion-inmediata.svg';
const String suscripcion = './assets/svg/atencion-agendable.svg';
const String wikidoc = './assets/svg/biblioteca.svg';
const String examenesPrev = './assets/svg/examenes-preventivos.svg';
const String atencionOnDemand = './assets/svg/atencion-agendable.svg';
const String examenesDom = './assets/svg/examenes.svg';
const String farmacia = './assets/svg/farmacia.svg';
const String wellness = './assets/svg/icono-wellness.svg';

/// esta lista define el orden en el que se despliegan los botones del home
List<String> serviceOrder = [
  'ATEN_MG',
  'ATEN_OD',
  'ATEN_SUS',
  'VET',
  'ORIEN_ENF',
  'PORTAL_EXAM',
  'PORTAL_FARM',
  'WIKIDOC',
];

Map<String, String> iconsServices = {
  "ATEN_MG": atencionInmediata,
  "ATEN_SUS": suscripcion,
  "ATEN_OD": atencionOnDemand,
  "PORTAL_EXAM": examenesPrev,
  "VET": wellness,
  "ORIEN_ENF": examenesDom,
  "PORTAL_FARM": farmacia,
  "WIKIDOC": wikidoc,
};
Map<String, String> servicesRoutes = {
  "ATEN_MG": 'atenttion-immediate',
  "ATEN_SUS": '/schedule',
  "WIKIDOC": 'wikidoc',
  "PORTAL_EXAM": 'home-exams',
  "ATEN_OD": '/schedule',
  "ORIEN_ENF": 'preventive-exams',
  "PORTAL_FARM": 'pharmacy',
  "VET": '/schedule',
};

String formatDosDigitos(int numero) {
  // Esta función agrega un cero adelante si el número es menor que 10
  return numero.toString().padLeft(2, '0');
}

String formatedFechaForAvalaiblesHoursInit(String fechaSeleccion) {
  late String fechaFormateada = '';
  late List<String> partes = [];
  Map<String, String> meses = {
    "ENE.": "01",
    "FEB.": "02",
    "MAR.": "03",
    "ABR.": "04",
    "MAY.": "05",
    "JUN.": "06",
    "JUL.": "07",
    "AGO.": "08",
    "SEP.": "09",
    "OCT.": "10",
    "NOV.": "11",
    "DIC.": "12",
  };

  partes = fechaSeleccion.split(' ');
  String dia = partes[0];
  String mesAbreviado = partes[1];
  String anio = partes[2];
  String mes = meses[mesAbreviado] ?? '';

  fechaFormateada = "$anio-$mes-$dia";

  return fechaFormateada;
}


String formatedFechaForMedicalHours(String fechaSeleccion) {
  late String fechaFormateada = '';
  late List<String> partes = [];
  Map<String, String> meses = {
    "ENE.": "01",
    "FEB.": "02",
    "MAR.": "03",
    "ABR.": "04",
    "MAY.": "05",
    "JUN.": "06",
    "JUL.": "07",
    "AGO.": "08",
    "SEP.": "09",
    "OCT.": "10",
    "NOV.": "11",
    "DIC.": "12",
  };

  partes = fechaSeleccion.split(' ');
  String dia = partes[0];
  String mesAbreviado = partes[1];
  String anio = partes[2];
  String mes = meses[mesAbreviado] ?? '';

  fechaFormateada = "$anio$mes$dia";

  return fechaFormateada;
}

