import 'package:conversor_moedas/main.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dolar = 0;
  double euro = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text('\$ Conversor \$'),
          backgroundColor: Colors.amber,
          centerTitle: true),
      body: FutureBuilder(
          future: getDados(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text(
                    'Carregando Dados...',
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'ERROR...',
                      style: TextStyle(color: Colors.red, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  dolar = snapshot.data!['results']['currencies']['USD']['buy'];
                  euro = snapshot.data!["results"]['currencies']['EUR']['buy'];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Icon(
                          Icons.monetization_on,
                          size: 150,
                          color: Colors.amber,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Reais',
                              labelStyle:
                                  TextStyle(color: Colors.amber, fontSize: 20),
                              border: OutlineInputBorder(),
                              prefixText: 'R\$'),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Dolar',
                              labelStyle:
                              TextStyle(color: Colors.amber, fontSize: 20),
                              border: OutlineInputBorder(),
                              prefixText: '\$'),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Euro',
                              labelStyle:
                              TextStyle(color: Colors.amber, fontSize: 20),
                              border: OutlineInputBorder(),
                              prefixText: 'R\$'),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}
