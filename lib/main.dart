import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainPage(title: 'Currency Converter'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController textController = TextEditingController();

  String text = '';
  String? errorText;

  double euroMoneda = 4.95;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.network(
                  'http://vremeanoua.ro/wp-content/uploads/2017/07/atentie-la-bani-bancnote-de-100-lei-falsificate-461784.jpg'),
              Padding(
                padding: const EdgeInsetsDirectional.all(20.0),
                child: TextField(
                  autofocus: true,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: textController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.money,
                    ),
                    errorText: errorText,
                    hintText: 'Enter the amount in EUR',
                    suffix: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          text = '';
                        });
                        textController.clear();
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text("Da cu banu'"),
                onPressed: () {
                  final String value = textController.text;
                  final double? doubleValue = double.tryParse(value);
                  setState(() {
                    if (doubleValue == null) {
                      errorText = 'Please enter a valid number';
                      text = '';
                    } else {
                      errorText = null;
                      final double rezultat = doubleValue * euroMoneda;
                      text = '${rezultat.toStringAsFixed(2)} RONI';
                    }
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
              const SizedBox(height: 10),
              Text(
                text,
                style: const TextStyle(fontSize: 24.3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
