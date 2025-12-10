import 'package:flutter/material.dart';
import 'package:my_market/main.dart';
import 'package:my_market/oders_list.dart';
import 'package:my_market/product_list.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {

  int selectesd = 0;
  List page = [

    MyApp(),
    Itemss(),
    Oderr()





  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade200,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          currentIndex: 0,
          onTap: (index){
            setState(() {
              selectesd = index;
            });
          },


          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.book,
                  color: Colors.black,),
                label: "DashBord"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.gif_box,color: Colors.black,),
                label: "Products"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.backpack,
                    color: Colors.black
                ),
                label: "Oders"
            ),




          ]),
      body:page [selectesd],
      backgroundColor: Colors.orange.shade100,

    );
  }
}
