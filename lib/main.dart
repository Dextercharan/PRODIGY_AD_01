import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: HomePage(title: 'Calculator',),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = '0';
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'X' ||
        buttonText == '/') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == ".") {
      if (_output.contains('.')) {
        print('Already contains a decimal');
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'X') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = '';
    }else {
        _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildbutton(String buttonText){
    return (Expanded(
      child: SizedBox(
        height: 70.0,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: OutlinedButton(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () => buttonPressed(buttonText),
          ),
        ),
      ),
    )

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black12,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(output,
                style: TextStyle(fontSize: 50
                  ,fontWeight: FontWeight.bold),),
            ),
            Expanded(
                child: Divider()
            ),
            new Column(
            children: [
              new Row(
                children: [
                  buildbutton('7'),
                  buildbutton('8'),
                  buildbutton('9'),
                  buildbutton('X')
                ],
              ),
              new Row(
                children: [
                  buildbutton('4'),
                  buildbutton('5'),
                  buildbutton('6'),
                  buildbutton('/')
                ],
              ),
              new Row(
                children: [
                  buildbutton('1'),
                  buildbutton('2'),
                  buildbutton('3'),
                  buildbutton('+')
                ],
              ),
              new Row(
                children: [
                  buildbutton('.'),
                  buildbutton('0'),
                  buildbutton('00'),
                  buildbutton('-')
                ],
              ),
              new Row(
                children: [
                  buildbutton('CLEAR'),
                  buildbutton('=')
                ],
              )
            ],
            )
          ],
        ),
      ),
    );
  }
}

