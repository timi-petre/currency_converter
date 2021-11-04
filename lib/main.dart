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
  final textController = TextEditingController();

  double euroMoneda = 4.50;

  String text = '';
  String? erorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                  'http://vremeanoua.ro/wp-content/uploads/2017/07/atentie-la-bani-bancnote-de-100-lei-falsificate-461784.jpg'),
              Padding(
                padding: const EdgeInsetsDirectional.all(20.0),
                child: TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  autofocus: true,
                  controller: textController,
                  decoration: InputDecoration(
                    errorText: erorText,
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
                child: const Text('Da-i cu banu\''),
                onPressed: () {
                  final String value = textController.text;
                  final double? doubleValue = double.tryParse(value);
                  final double test = doubleValue! * euroMoneda;
                  setState(() {
                    if (doubleValue == 0) {
                      erorText = 'Please enter a number!';
                      text = 'Eroare';
                    } else {
                      erorText = '';
                      text = ('${test.toStringAsFixed(2)} RON');
                    }
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
              const SizedBox(height: 10),
              Text(
                (text),
                style: const TextStyle(fontSize: 24.3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
