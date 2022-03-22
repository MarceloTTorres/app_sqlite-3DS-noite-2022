import 'package:app_sqlite/model/Carro.dart';
import 'package:app_sqlite/provider/CarroProvider.dart';
import 'package:app_sqlite/themes.dart';
import 'package:app_sqlite/view/MenuLateral.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(EasyDynamicThemeWidget(
    child: Principal(),
  ));
}

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightGreenAccent[700],
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: Listagem(),
    );
  }
}

class Listagem extends StatefulWidget {
  const Listagem({Key? key}) : super(key: key);

  @override
  State<Listagem> createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  //lista de carros
  var listaCarros = []; //vai receber o select do banco de dados
  late List<Map<String, dynamic>> temp; //lista de dados temporária

  CarroProvider carros = CarroProvider(); //vai ler o BD

  //faz um select all no BD
  void _carregaDados() async {
    temp = await carros.selectAll();
    //para cada carro (JSON) no BD
    temp.forEach((element) {
      //transforma o JSON em um objeto do tipo Carro
      Carro c = Carro.fromJson(element);
      setState(() {
        listaCarros.add(c);
      });
    });
  }

  //carrega dados na inicialização
  @override
  void initState() {
    super.initState();
    _carregaDados();
    //esconde o teclado ao atualizar a tela
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuLateral()));
            }),
        title: const Text('Listagem de Carros'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: listaCarros.length > 0
            ? ListView.builder(
                itemCount: listaCarros.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  final carro = listaCarros[index];
                  return Dismissible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: carro.marca,
                              subtitle: Text(
                                "Modelo: ${carro.modelo} - Ano: ${carro.ano}\n"
                                "Placa: ${carro.placa} - Valor: ${carro.valor}",
                              ),
                              leading: const Icon(Icons.directions_car),
                            )
                          ]),
                    ),
                    key: Key(carro.id.toString()),
                    background: _direitaBackground(), //arrasta para esquerda
                    secondaryBackground:
                        _esquerdaBackground(), //arrasta para direita
                    confirmDismiss: (DismissDirection direcao) async {
                      if (direcao == DismissDirection.startToEnd) {
                        //arrasta da esquerda para direita
                        //abre a tela para atualizar dados do carro
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AlteraCarro(carro: carro)));
                      } else {
                        //arrasta da direita para esquerda
                        //deleta o carro do BD
                        CarroProvider car = CarroProvider();
                        car.delete(carro.id);
                        //atualiza a lista de carros
                        _carregaDados();
                      }
                    },
                  );
                },
              )
            : const Center(
                child: Text(
                  "Nenhum carro cadastrado",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.brightness_6_outlined),
        backgroundColor: Colors.lightGreenAccent[700],
        onPressed: () {
          EasyDynamicTheme.of(context).changeTheme();
        },
      ),
    );
  }
}

//background da esquerda
Widget _esquerdaBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              "Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
    alignment: Alignment.centerLeft,
  );
}

//background da direita
Widget _direitaBackground() {
  return Container(
    color: Colors.blue,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            "Alterar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    alignment: Alignment.centerLeft,
  );
}
