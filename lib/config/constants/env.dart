enum Environment { qa, dev, prod }

abstract class Environments {
  static late String baseApiUrl;
  static late String servicios;
  static late String endPointLogin;
  static late dynamic idConvenio;
  static late String urlServicios;
  static late String urlLogin;
  static late String usuario;
  static late String password;
  static late String geolocationBaseUrl;
  static late String keyApiGeo;
  static late String endPointGeo;
  static late String envText;
  static late String videocall;
  static late String urlBaseForgot;
  static late String urlBaseForgotHttps;
  static late String urlBaseSerie;
  static late String apiKeySerie;
  static late String urlApiPharmacies;
  static late String urlApiGoogle;
  static late String apiKeyGoogle;
  static late String urlSaveAddress;

  static late Environment environment;
  static Environment get enviornment => environment;
  static setupEnv(Environment env) {
    // https://maps.googleapis.com/maps/api/place/autocomplete/json
    environment = env;
    // USUARIO QA
    // 26863913-6
    // 268639

    // https: //manager.inexoos.com/identificacion/serie?run=16296327&dv=9&serie=105392798&api_key=XnfoZ5r0ohMr6D5EvhGlDI8ILOjUwvUx0cAJs3IR
    switch (env) {
      case Environment.qa:
        videocall = 'https://qa.videocall.medismart.live/';
        // usuario = '15759019-7';
        // password = 'Bm123456';
        usuario = '17869526-6';
        password = '178695';
        baseApiUrl = 'https://api-directory-ms-qa.azurewebsites.net/';
        urlServicios = 'https://services.medismart.live/';
        urlLogin = "https://api-auth-ms-qa.azurewebsites.net/";
        idConvenio = 26;
        geolocationBaseUrl = 'https://api.bigdatacloud.net/';
        endPointGeo = '/data/reverse-geocode-with-timezone';
        keyApiGeo = '875e06efb1c446d89eb05bfaca2ca3ec';
        envText = 'qa';
        urlBaseForgot = 'https://qa.medical.medismart.live/';
        urlBaseSerie = 'manager.inexoos.com';
        apiKeySerie = 'XnfoZ5r0ohMr6D5EvhGlDI8ILOjUwvUx0cAJs3IR';
        urlApiPharmacies = 'https://integrations-ms-dev.azurewebsites.net/';
        urlApiGoogle = 'https://maps.googleapis.com/';
        apiKeyGoogle = 'AIzaSyAcYKsylRzBmSoyUDu1kYI4Njg-NnZg-kw';
        urlSaveAddress = 'https://desa.services.medismart.live/';

        break;
      case Environment.dev:
        videocall = 'https://qa.videocall.medismart.live/';
        usuario = '16724918-3';
        password = '167249';
        // usuario = '15759019-7';
        // password = 'Bm123456';
        // usuario = '11540818-6';
        // password = 'Mm123456';
        baseApiUrl = 'https://api-directory-ms-dev.azurewebsites.net/';
        urlServicios = 'https://services.medismart.live/';
        urlLogin = "https://api-auth-ms-dev.azurewebsites.net/";
        idConvenio = 26;
        geolocationBaseUrl = 'https://api.bigdatacloud.net/';
        endPointGeo = '/data/reverse-geocode-with-timezone';
        keyApiGeo = '875e06efb1c446d89eb05bfaca2ca3ec';
        envText = 'dev';
        urlBaseForgot = 'https://dev.medical.medismart.live/';
        urlBaseSerie = 'manager.inexoos.com';
        apiKeySerie = 'XnfoZ5r0ohMr6D5EvhGlDI8ILOjUwvUx0cAJs3IR';
        urlApiPharmacies = 'https://integrations-ms-dev.azurewebsites.net/';
        urlApiGoogle = 'https://maps.googleapis.com/';
        apiKeyGoogle = 'AIzaSyAcYKsylRzBmSoyUDu1kYI4Njg-NnZg-kw';
        urlSaveAddress = 'https://desa.services.medismart.live/';

        break;
      case Environment.prod:
        videocall = 'https://videocall.medismart.live/';
        usuario = '';
        password = '';
        baseApiUrl = 'https://api-directory-ms-prod.azurewebsites.net/';
        urlServicios = 'https://services.medismart.live/';
        urlLogin = "https://api-auth-ms-prod.azurewebsites.net/";
        idConvenio = 26;
        geolocationBaseUrl = 'api.bigdatacloud.net/';
        endPointGeo = '/data/reverse-geocode-with-timezone';
        keyApiGeo = '875e06efb1c446d89eb05bfaca2ca3ec';
        envText = 'prod';
        urlBaseForgot = 'https://medical.medismart.live/';
        urlBaseSerie = 'manager.inexoos.com';
        apiKeySerie = 'XnfoZ5r0ohMr6D5EvhGlDI8ILOjUwvUx0cAJs3IR';
        urlApiPharmacies = 'https://integrations-ms-dev.azurewebsites.net/';
        urlApiGoogle = 'https://maps.googleapis.com/';
        apiKeyGoogle = 'AIzaSyAcYKsylRzBmSoyUDu1kYI4Njg-NnZg-kw';
        urlSaveAddress = 'https://desa.services.medismart.live/';

        break;
    }
  }
}
