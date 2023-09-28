class HomeService {
    final String cod;
    final String texto;
    final String subTexto;
    final String? tipoServicio;

    HomeService({
        required this.cod,
        required this.texto,
        required this.subTexto,
        required this.tipoServicio,
    });

    factory HomeService.fromJson(Map<String, dynamic> json) => HomeService(
        cod: json["cod"],
        texto: json["texto"],
        subTexto: json["subTexto"],
        tipoServicio: json["tipoServicio"],
    );

    Map<String, dynamic> toJson() => {
        "cod": cod,
        "texto": texto,
        "subTexto": subTexto,
        "tipoServicio": tipoServicio,
    };

    
}
