import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conversor de Moedas',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Coin Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController valor = TextEditingController();
    late double euro;
    late double dolar;
    late double libra;
    late double peso;
    late String ope;
    final valorField = TextField(
      controller: valor,
      obscureText: false,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Valor",
          border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
    );

    double converteEuro() {
      var valorInformado = double.parse(valor.text);
      euro = valorInformado * 0.19;
      return euro;
    }

    double converteDolar() {
      var valorInformado = double.parse(valor.text);
      dolar = valorInformado * 0.20;
      return dolar;
    }

    double converteLibra() {
      var valorInformado = double.parse(valor.text);
      libra = valorInformado * 0.16;
      return libra;
    }

    double convertePeso() {
      var valorInformado = double.parse(valor.text);
      peso = valorInformado * 22.75;
      return peso;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          valorField,
          const SizedBox(
            height: 30,
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.euro),
              title: const Text('Euro'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeladeEuro(converteEuro(), 'Euro'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.money),
              title: const Text('Dólar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeladeEuro(converteDolar(), 'Dolar'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.mode_night),
              title: const Text('Libra'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeladeEuro(converteLibra(), 'Libra'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.data_usage_rounded),
              title: const Text('Peso'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeladeEuro(convertePeso(), 'Peso'),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class TeladeEuro extends StatelessWidget {
  final double _valorConvertido;
  final String _ope;
  const TeladeEuro(this._valorConvertido, this._ope, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela de Conversão"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            'Valor convertido de Real para $_ope é $_valorConvertido',
            style: const TextStyle(fontSize: 32, color: Colors.black),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Voltar para a tela inicial',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
