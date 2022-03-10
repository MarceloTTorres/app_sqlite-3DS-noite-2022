class Carro{
  final int? id;
  final String marca;
  final String modelo;
  final String ano;
  final String placa;
  final String cor;

  //método construtor
  Carro({
    this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.placa,
    required this.cor,
  });

  //metodo para converter de Dart para JSON
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'marca': marca,
      'modelo': modelo,
      'ano': ano,
      'placa': placa,
      'cor': cor,
    };
  }

  //metodo para converter de JSON para Dart
  factory Carro.fromJson(Map<String, dynamic> json){
    return Carro(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      ano: json['ano'],
      placa: json['placa'],
      cor: json['cor'],
    );
  }
}