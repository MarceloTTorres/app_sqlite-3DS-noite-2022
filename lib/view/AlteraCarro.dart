import 'package:app_sqlite/model/Carro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlteraCarro extends StatefulWidget {
  late final Carro carro;
  AlteraCarro(this.carro);

  @override
  State<AlteraCarro> createState() => _AlteraCarroState();
}

class _AlteraCarroState extends State<AlteraCarro> {
  //campos que controlam os textos
  TextEditingController marcaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController anoController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  TextEditingController corController = TextEditingController();

  @override
  void initState() {
    super.initState();
    marcaController.text = widget.carro.marca;
    modeloController.text = widget.carro.modelo;
    anoController.text = widget.carro.ano;
    placaController.text = widget.carro.placa;
    corController.text = widget.carro.cor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const Text("Marca",
              style: TextStyle(
                fontSize: 20,
              )),
          TextFormField(
            keyboardType: TextInputType.name,
            controller: marcaController,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    ));
  }
}
