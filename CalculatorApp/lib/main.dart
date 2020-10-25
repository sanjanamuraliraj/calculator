
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/CalcButton.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFF283637),
        body: SingleChildScrollView(
                  child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,30.0, 12.0, 12.0),
                    child: Text(
                      _history,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF545F61),
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,25.0, 12.0, 0.0),
                    child: Text(
                      _expression,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                SizedBox(
                  height: 110
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: 'AC',
                      fillColor: 0xFF6C807F,
                      textSize: 19,
                      callback: allClear,
                    ),
                    CalcButton(
                      text: 'C',
                      fillColor: 0xFF6C807F,
                      callback: clear,
                    ),
                    CalcButton(
                      text: '%',
                      fillColor: 0xFFB3E5FC,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '/',
                      fillColor: 0xFFB3E5FC,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '7',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '8',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '9',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '*',
                      fillColor: 0xFF81D4FA,
                      textColor: 0xFFFFFFFF,
                      textSize: 24,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '4',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '5',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '6',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '-',
                      fillColor: 0xFF4FC3F7,
                      textColor: 0xFFFFFFFF,
                      textSize: 38,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '1',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '2',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '3',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '+',
                      fillColor: 0xFF29B6F6,
                      textColor: 0xFFFFFFFF,
                      textSize: 30,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '.',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '0',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '00',
                      callback: numClick,
                      textSize: 24,
                    ),
                    CalcButton(
                      text: '=',
                      fillColor: 0xFF03A9F4,
                      textColor: 0xFFFFFFFF,
                      callback: evaluate,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

