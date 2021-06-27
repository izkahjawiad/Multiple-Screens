import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Scroll extends StatefulWidget {
  @override
  _ScrollState createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {

  int _currentIndex = 0;
  final List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Text("Ecom App UI",
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.black))),
          actions: [
            IconButton(
              color: Colors.black,
              icon: Icon(
                Icons.notifications,
              ),
              onPressed: () {
                    // do something
              },
            )
          ],
        ),
      body: SingleChildScrollView(
              child: Column(children: [
          Container(
            padding: EdgeInsets.only(
              left:2,
              right:2,
              top:5
            ),
            child: ListTile(
              leading: Text("Items", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              trailing: InkWell(child: Text("View More", style: TextStyle(color: Colors.purple, fontSize: 17)),),
            ),
          ),
          CarouselSlider(items: [
            sliderItems("Macbook Pro", "macbook.png"),
            sliderItems("Note 20 Ultra", "note20.jpeg"),
            sliderItems("Gaming PC", "gamingpc.jpg"),
            sliderItems("IPhone 12", "mob.jpg"),
          ],
          options: CarouselOptions(
                  //height: 360,
                  //enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 1.25,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //viewportFraction: 0.8,
                ),
            ),
            Container(
            padding: EdgeInsets.only(
              left:2,
              right:2,
              
            ),
            child: ListTile(
              leading: Text("More Categories", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),

          //HORIZONTAL
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
              child: Row(children: [
              horzItems("Clothes", "5", Icons.favorite_outline),
              horzItems("Electronics", "20", Icons.power),
              horzItems("Household", "9", Icons.house),
              horzItems("Appliances", "5", Icons.electric_moped),
              horzItems("Others", "15", Icons.arrow_forward),
              SizedBox(width:20),
            ]),
          ),

          Container(
            padding: EdgeInsets.only(
              left:2,
              right:2,
              
            ),
            child: ListTile(
              leading: Text("Popular Items", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              trailing: InkWell(child: Text("View More", style: TextStyle(color: Colors.purple, fontSize: 17)),),
            ),
          ),

          //ITEMS IN GRID

          Container(
            margin: EdgeInsets.all(13),
            child: GridView.count(
              childAspectRatio: 0.9,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                techItems("Macbook Pro", "macpro.jpg"),
                techItems("Note 20 Ultra", "note20.jpeg"),
                techItems("Gaming PC", "gamingpc.jpg"),
                techItems("IPhone 12", "mob.jpg"),
                techItems("Macbook Air", "macbook.png"),
                techItems("Backlit", "backlit.jpg"),
                techItems("Mercedes", "merc.jpg"),
                techItems("Royal Field", "royal.jpg"),
                techItems("HeadPhone", "head.jpg"),
                techItems("Gaming PC", "gamingpc.jpg"),
                techItems("Roadster", "road.jpg"),
              ]),
          ),
          
          //Bootom navigation

          
          
          
        ],),
      ),

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
        selectedItemColor: Colors.purple,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(right:30),
              child: Icon(Icons.home,
              color: Colors.purple,),
            ),
            label: '',
            
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(right:60),
              child: Icon(Icons.favorite_rounded,
              color: Colors.grey,),
            ),
            label: '',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined,
            color: Colors.grey,),
            label: '',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
            color: Colors.grey,),
            label: '',
          ),
        ],),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left:15),
          child: new FloatingActionButton(
            backgroundColor: Colors.purple,
          
          onPressed:(){ },
          tooltip: 'Increment',
          child: new Icon(Icons.search),
      ),
        ), 
    );
  }
}

Widget horzItems(String name, String numb, IconData icon){
  return Container(
          width: 210,
          margin: EdgeInsets.only(
            left:15,
            top:5,
            bottom: 5
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2.0, 2.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  color: Colors.grey[300]
                ),
              ]),
          child: Row(children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Icon(icon, size: 30, color: Colors.purple,),),
            Container(
              margin: EdgeInsets.only(
                top:10,
                bottom: 10,

                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(name,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text("$numb Items")
              ],),
            )
          ],)
        );

}


Widget sliderItems(String name, String img){
  return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2.0, 2.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  color: Colors.grey[300]
                ),
              ]),
          margin: EdgeInsets.only(
            left: 10,
            right:10,
            bottom: 10,
          ),
          child: Column(children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/$img")),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(name, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28
                  ),),
                ),
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(left:3,bottom: 15),
                    child: RatingBar.builder(
                        itemSize: 15,
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.only(left:0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                  ),
                    Container(
                      margin: EdgeInsets.only(left:2,bottom: 13),
                      child: Text("5.0 (23 Reviews)"))
                ])
              ],
            ),
          ],));
}


Widget techItems(String name, String img){
  return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2.0, 2.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  color: Colors.grey[300]
                ),
              ]),
          margin: EdgeInsets.only(
            left: 0,
            right:0,
            bottom: 0,
          ),
          child: Column(children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/$img")),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top:5,
                    bottom: 3,
                    left:8
                  ),
                  child: Text(name, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23
                  ),),
                ),
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(left:5,bottom: 0),
                    child: RatingBar.builder(
                        itemSize: 10,
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.only(left:0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                  ),
                    Container(
                      margin: EdgeInsets.only(left:2,right: 2),
                      child: Text("5.0 (23 Reviews)"))
                ])
              ],
            ),
          ],));
}



