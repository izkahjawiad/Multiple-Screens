import 'package:flutter/material.dart';
import 'package:multiple_screens/Calculator.dart';
import 'package:multiple_screens/Scroll.dart';
import 'package:multiple_screens/Todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: MyMain(),)
    );
  }
}

class MyMain extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.cover,
                  )
                ),
              child: Column(children: [
                //Front Image
                  Container(
                    margin: EdgeInsets.all(40),
                    height: 300,
                    width: 300,
                    child: Image.asset("assets/ecommerce.png"),
                  ),
                //Heading
                Container(
                  padding: EdgeInsets.only(bottom: 10, top: 10, left: 30, right: 30),
                  child: Text("Multiple Apps and Screen",style: TextStyle(fontFamily: "Simple", fontSize: 35, fontWeight: FontWeight.bold)),
                  decoration: BoxDecoration(
                    color: Color(0xffd8d0f7),
                    borderRadius: BorderRadius.circular(50),
                    
                  ),
                ),
                //Button for Page 1
                Container(
                  margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Calculator App: ", style:TextStyle(fontFamily: "Simple_B", fontSize: 25)),
                      SizedBox(width:10),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => Calculator()));
                        },
                        child: Text("Click Here", style:TextStyle(fontFamily: "Simple", fontSize: 25)),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          primary:Color(0xff876af7),
                          
                        )
                        
                      ),
                    ],
                  ),
                ),
                //Button for Page 2
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ToDo App: ", style:TextStyle(fontFamily: "Simple_B", fontSize: 25)),
                      SizedBox(width: 35,),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => Todo()));
                        },
                        child: Text("Click Here", style:TextStyle(fontFamily: "Simple", fontSize: 25)),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          primary:Color(0xff876af7),
                          
                        )
                        
                      ),
                    ],
                  ),
                ),
                //Button for Page 3
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Scroll Screen: ", style:TextStyle(fontFamily: "Simple_B", fontSize: 25)),
                      SizedBox(width: 20,),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => Scroll()));
                        },
                        child: Text("Click Here", style:TextStyle(fontFamily: "Simple", fontSize: 25)),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          primary:Color(0xff876af7),
                          
                        )
                        
                      ),
                    ],
                  ),
                ),
                
                ]
              ),
            ),
          ),
        );
  }
}