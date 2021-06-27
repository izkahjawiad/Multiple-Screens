import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  String formattedDate = DateFormat.yMMMMd('en_US').format(DateTime.now());

  var output = "";
  List<dynamic> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[400],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.only(top: 90),
                      child: Text(
                        "Hello,",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontFamily: "Josefin"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        "Izkah...",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 90,
                            fontFamily: "Hillaw"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        formattedDate,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: "Josefin"),
                      ),
                    )
                  ]),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, top: 80),
                    height: 120,
                    width: 120,
                    child: Image.asset("assets/todo.png"))
              ]),
              Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lst.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 55,
                            margin: EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(1.0, 1.0),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0,
                                      color: Colors.grey[500]),
                                ]),
                            child: ListTile(
                              title: Text(
                                "${lst[index]}",
                                style: TextStyle(
                                    fontFamily: "Janda",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Container(
                                width: 60,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      "Update Task",
                                                      style: TextStyle(
                                                          fontFamily: "Janda",
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    content: TextField(
                                                        onChanged: (value) {
                                                      output = value;
                                                    }),
                                                    actions: [
                                                      Container(
                                                        margin: EdgeInsets.only(right:20,bottom:10),
                                                          child: ElevatedButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  lst.replaceRange(
                                                                      index,
                                                                      index + 1,
                                                                      {output});
                                                                });
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Container(
                                                                child: Text(
                                                                  "Update",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "Janda",
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              )))
                                                    ],
                                                  );
                                                });
                                          });
                                        },
                                        child: Icon(Icons.edit)),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            lst.removeAt(index);
                                          });
                                        },
                                        child: Icon(Icons.delete)),
                                  ],
                                ),
                              ),
                            ));
                      }),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Add Task",
                      style: TextStyle(
                          fontFamily: "Janda",
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    content: TextField(onChanged: (value) {
                      output = value;
                    }),
                    actions: [
                      Container(
                        margin: EdgeInsets.only(right:20,bottom:10),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  lst.add(output);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    fontFamily: "Janda",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )))
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
          mini: true,
        ));
  }
}
