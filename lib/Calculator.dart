import 'package:calculator_project/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(MaterialApp(
    home: Calulat(),
  ));
}

class Calulat extends StatefulWidget {
  @override
  State<Calulat> createState() => _CalulatState();
}

class _CalulatState extends State<Calulat> {

  var userQuestion= '';
  var userAnswer= '';

final myTextStyle = TextStyle(fontSize: 30,color: Colors.deepPurple[900]);
  final List<String> buttons = [
    'C', 'DEL', '%', '/',
    '9', '8', '7', 'x',
    '6', '5', '4', '-',
    '3', '2', '1', '+',
    '0', '.', 'ANS', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(userQuestion,style: TextStyle(fontSize: 20,color: Colors.white),)),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(userAnswer,style: TextStyle(fontSize: 20,color: Colors.white))),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext contex, int index) {
                      //clear button
                      if(index == 0){
                        return Mybutton(
                          buttonTapped: (){
                           setState(() {
                             userQuestion ='';
                           });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );
                      }
                      //delete button
                      else if(index == 1){
                        return Mybutton(
                          buttonTapped: (){
                            setState(() {
                              userQuestion = userQuestion.substring(0,userQuestion.length-1);
                            });
                          },
                          buttonText: buttons[index],
                          color:  Colors.red,
                          textColor: Colors.white,
                        );
                      }
                      //equal button
                      else if(index == buttons.length-1){
                        return Mybutton(
                          buttonTapped: (){
                            setState(() {
                              equalPressed();

                            });
                          },
                          buttonText: buttons[index],
                          color:  Colors.deepPurple,
                          textColor: Colors.white,
                        );
                      }

                      //rest of the button

                      else{
                        return Mybutton(
                          buttonTapped: (){
                            setState(() {
                              userQuestion +=buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                        color: isOperator(buttons[index])? Colors.yellow[900]: Colors.deepPurple[50],
                          textColor: isOperator(buttons[index])? Colors.white: Colors.black,
                        );
                      }
                    })),
          ),
        ],
      ),
    );
  }
  bool isOperator(String x){
    if (x == '%'|| x=='/' || x=='x' || x=='-' || x=='+' || x=='='){
      return true;
    }return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();

  }
}
