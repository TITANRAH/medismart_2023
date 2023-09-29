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
  "ATEN_OD": 'schedule-od',
  "ORIEN_ENF": 'preventive-exams',
  "PORTAL_FARM": 'pharmacy',
  "VET": 'schedule-vet',
};
