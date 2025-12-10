import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_market/add_product.dart';
import 'package:my_market/admin_login.dart';
import 'package:my_market/botom_navigator.dart';
import 'package:my_market/oder_tracking.dart';
import 'package:my_market/oders_list.dart';


import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Bottom(),
  ));
}

final CollectionReference credential =  FirebaseFirestore.instance.collection("Users");


class MyApp extends StatefulWidget {




  const MyApp({super.key});





  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  List sale = [
    "Total Sales",
    "Oders",
    "Users",
    "Products",

  ];


  List user = [
    "Mark Luther",
    "Alex Joby",
    "Renjith NS",
    "Gauthom Sumeer",
    "Mark Luther",
    "Alex Joby",
    "Renjith NS",
    "Gauthom Sumeer",
    "Mark Luther",
    "Alex Joby",
    "Renjith NS",
    "Gauthom Sumeer",
    "Mark Luther",
    "Alex Joby",
    "Renjith NS",
    "Gauthom Sumeer",

  ];
  List gmail = [
    "MarkLuther123@gmail.com",
    "AlexJoby345@gmail.com",
    "RenjithNS678@gmail.com",
    "GauthomSumeer042@gmail.com",
    "MarkLuther123@gmail.com",
    "AlexJoby345@gmail.com",
    "RenjithNS678@gmail.com",
    "GauthomSumeer042@gmail.com",
    "MarkLuther123@gmail.com",
    "AlexJoby345@gmail.com",
    "RenjithNS678@gmail.com",
    "GauthomSumeer042@gmail.com",
    "MarkLuther123@gmail.com",
    "AlexJoby345@gmail.com",
    "RenjithNS678@gmail.com",
    "GauthomSumeer042@gmail.com",


  ];



  List  values = [
    "Rs - 43,200",
    "500",
    "1000",
    "50",

  ];

  Future Signout()async{


    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Signed out successfuly"),
          backgroundColor: Colors.green,
        )
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text("My Market",
            style: TextStyle(
                color: Colors.white
            ),),
        ),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              Signout();
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Adminlog();
              }
              )
              );
            });

          }, icon: Icon(Icons.logout,color: Colors.white,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: credential.snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Container(
                width: 999,
                height: 600,
                color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                        width: 300,
                        height: 40,
                        // color: Colors.yellow,
                        child: ListTile(
                          leading: Icon(Icons.people,
                            color: Colors.blue,),
                          title: Text("Users",
                            style: TextStyle(color: Colors.black),),
                          trailing: Text("300",
                            style: TextStyle(
                                color: Colors.black
                            ),),
                        )
                    ),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, int index) {
                            final snap =  snapshot.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.grey.shade200,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(snap["Image"]),

                                  ),
                                  title: Text(snap["Name"],
                                    style: TextStyle(color: Colors.black),),
                                  subtitle: Text(snap["gmail"],
                                    style: TextStyle(
                                        color: Colors.black
                                    ),),


                                ),
                              ),
                            );
                          }),
                    )


                  ],
                ),
              );
            } return CircularProgressIndicator();
          }
        ),
      ),


    );
  }
}

