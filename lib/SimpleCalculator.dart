import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation="0";
  String result="0";
  String expression="";
  double equationFontSize=38.0;
  double resultFontSize=48.0;
  buttonPressed(String buttonText){
    setState(() {
     if(buttonText=="C"){
       equation="0";
       result="0";
       equationFontSize=38.0;
       resultFontSize=48.0;
     }
     else if(buttonText=="⌫"){
      equationFontSize=48.0;
      resultFontSize=38.0;
       equation=equation.substring(0,equation.length-1);
       if(equation==""){
         equation="0";
       }
     }
     else if(buttonText=="="){
        equationFontSize=48.0;
        resultFontSize=38.0;
        expression=equation;
        expression=expression.replaceAll('x','*');
        expression=expression.replaceAll('÷','/');
        try{
            Parser p=new Parser();
            Expression exp=p.parse(expression);
            ContextModel cm=ContextModel();
            result='${exp.evaluate(EvaluationType.REAL,cm)}';
        }
        catch(e){
            result="Error";
        }
     }
     else{
       if(equation=="0"){
         equation=buttonText;
       }
       else{
         equationFontSize=48.0;
         resultFontSize=38.0;
         equation=equation+buttonText;
       }
     }
  }
  );
}
  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * buttonHeight * 0.1,
      decoration: BoxDecoration(
        color: buttonColor,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(0.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: TextButton(
          onPressed: ()=>buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Simple Calculator',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 27),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1, Colors.redAccent),
                      buildButton("⌫", 1, Colors.blue),
                      buildButton("÷", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, Colors.black54),
                      buildButton("8", 1, Colors.black54),
                      buildButton("9", 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, Colors.black54),
                      buildButton("5", 1, Colors.black54),
                      buildButton("6", 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, Colors.black54),
                      buildButton("2", 1, Colors.black54),
                      buildButton("3", 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      buildButton(".", 1, Colors.black54),
                      buildButton("0", 1, Colors.black54),
                      buildButton("00", 1, Colors.black54),
                    ]),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          buildButton("x", 1, Colors.blue)
                          ]
                      ),
                      TableRow(
                        children: [
                          buildButton("-", 1, Colors.blue)
                          ]
                      ),
                      TableRow(
                        children: [
                          buildButton("+", 1, Colors.blue)
                          ]
                      ),
                      TableRow(
                        children: [
                          buildButton("=", 2, Colors.redAccent)
                          ]
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
