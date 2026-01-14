import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class Oderr extends StatefulWidget {
  const Oderr({super.key});

  @override
  State<Oderr> createState() => _OderrState();
}

class _OderrState extends State<Oderr> {

  final CollectionReference product = FirebaseFirestore.instance.collection("Products");

  final CollectionReference oder = FirebaseFirestore.instance.collection("Oders");
  // final String uid = FirebaseAuth.instance.currentUser!.uid;






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text("Oders",
            style: TextStyle(
                color: Colors.white
            ),),
        ),
      ),
      body: StreamBuilder(
        stream: oder.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                Container(
                    width: 300,
                    height: 40,
                    // color: Colors.yellow,
                    child: ListTile(
                      leading: Icon(Icons.gif_box,
                        color: Colors.blue,),
                      title: Text("New Oders",
                        style: TextStyle(color: Colors.black),),
                      trailing: Icon(Icons.arrow_downward_rounded),
                    )
                ),
                SizedBox(
                  height: 730,
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, int index) {
                        final snap = snapshot.data!.docs[index];
                        Timestamp ts = snap["expectedDelivery"];
                        DateTime date = ts.toDate();
                        String formattedDate = DateFormat('dd MMM yyyy').format(date);

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                             Navigator.pushNamed((context), "items",
                             arguments: {
                               "Name" : snap["Name"],
                               'Image' : snap["Image"][0].toString(),
                               "price" : snap["price"],
                               "Id" : snap.id

                                 }
                              );
                            },
                            child: Container(
                              color: Colors.grey.shade200,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snap["Image"][0]),
                                ),
                                title: Text(snap["Name"],
                                  style: TextStyle(color: Colors.black),),
                                subtitle: Text("Expected Delivery date : $formattedDate",
                                  style: TextStyle(
                                      color: Colors.green
                                  ),
                                ),
                                trailing: Text(snap["price"].toString(),
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          } return CircularProgressIndicator();
        }
      ),

    );
  }
}
