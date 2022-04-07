import 'package:app_sqlite/main.dart';
import 'package:app_sqlite/view/AdicionarCarro.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.lightGreenAccent[700],
        child: ListView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.vertical,
          ),
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Listagem()));
              },
            ),
            ListTile(
                leading: const Icon(
                  Icons.add_circle_sharp,
                  color: Colors.black,
                ),
                title: const Text('Adicionar'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdicionarCarro()));
                })
          ],
        ),
      ),
    );
  }
}
