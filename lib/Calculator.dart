import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Text("$result", 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50),)
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btnB("7"),
              btnB("8"),
              btnB("9"),
              btnO("/"),
            ]),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btnB("4"),
              btnB("5"),
              btnB("6"),
              btnO("*"),
            ]),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btnB("1"),
              btnB("2"),
              btnB("3"),
              btnO("-"),
            ]),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btnG("0"),
              btnE("="),
              btnC("C"),
              btnO("+"),
            ]),
          SizedBox(height: 30),

        ],),
    );
  }


//WIDGETS

Widget btnG(String inp){
  return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width:70,height:70),
      child: ElevatedButton(
      onPressed: (){
        setState((){
          result = result + inp;
        });
      }, 
      child: Text("$inp"),
      style: ElevatedButton.styleFrom(
                  primary: Colors.grey[500],
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  )),
                  ),
  );
}

Widget btnC(String inp){
  return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width:70,height:70),
      child: ElevatedButton(
      onPressed: (){
        setState((){
          result = " ";
        });
      }, 
      child: Text("$inp"),
      style: ElevatedButton.styleFrom(
                  primary: Colors.grey[500],
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  )),
                  ),
  );
}

Widget btnE(String inp){
  return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width:70,height:70),
      child: ElevatedButton(
      onPressed: (){
        Parser p = Parser();
        Expression exp = p.parse(result);
        ContextModel sm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, sm);

        setState(() {
          result = eval.toString();
        });
      }, 
      child: Text("$inp"),
      style: ElevatedButton.styleFrom(
                  primary: Colors.grey[500],
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  )),
                  ),
  );
}


Widget btnB(String inp){
  return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width:70,height:70),
      child: ElevatedButton(onPressed: (){
        setState((){
          result = result + inp;
        });
      }, 
      child: Text("$inp"),
      style: ElevatedButton.styleFrom(
                  primary: Colors.grey[850],
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  )),
                  ),
  );
}

Widget btnO(String inp){
  return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width:70,height:70),
      child: ElevatedButton(
      onPressed: (){
        setState((){
          result = result + inp;
        });
      }, 
      child: Text("$inp"),
      style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  )),
                  ),
  );
}

}