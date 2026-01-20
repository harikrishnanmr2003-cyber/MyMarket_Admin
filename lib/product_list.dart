import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_market/add_product.dart';


class Itemss extends StatefulWidget {
  const Itemss({super.key});

  @override
  State<Itemss> createState() => _ItemssState();
}

class _ItemssState extends State<Itemss> {

  final CollectionReference product = FirebaseFirestore.instance.collection("Products");

  TextEditingController stk = TextEditingController();

  int stock = 1;

  void increaseStock() {
    setState(() {
      stock++;
    });
  }

  void decreaseStock() {
    if (stock > 1) {
      setState(() {
        stock--;
      });
    }
  }





  @override
  Widget build(BuildContext context) {

    // final counter = Provider.of<CounterProvider>(context);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add,
            color: Colors.black,),

            onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (

                  context) {
                return NewProduct();
              }));

        }),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Center(
            child: Text("Products",
              style: TextStyle(
                  color: Colors.white
              ),),
          ),
        ),
        body: StreamBuilder(
          stream: product.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  SizedBox(
                    height: 700,
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, int index) {
                          final snap = snapshot.data!.docs[index];

                          String productId = snap.id;

                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Update Stock"),
                                    content: Column(
                                      children: [
                                        TextField(
                                          controller: stk,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: "Enter Stock",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text("current stock : "),
                                            Text(snap["Stock"])
                                          ],
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          stk.clear();
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          if (stk.text.isEmpty) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text("Please enter stock value")),
                                            );
                                            return;
                                          }

                                          await FirebaseFirestore.instance
                                              .collection("Products")
                                              .doc(productId)
                                              .update({
                                            "Stock": stk.text, // ✅ STRING
                                          });

                                          stk.clear();
                                          Navigator.pop(context);

                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Stock Updated Successfully")),
                                          );
                                        },
                                        child: Text("Update"),
                                      ),

                                    ],
                                  );

                                },
                              );

                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(snap["Image"][0].toString()),
                              ),
                              title: Text(snap["Name"],
                                style: TextStyle(color: Colors.black),),
                              subtitle: Text(snap["discription"],
                                style: TextStyle(
                                    color: Colors.black
                                ),
                              ),
                              trailing: MaterialButton(
                                color: Colors.blue.shade200,
                                  child: Text("Delete",
                                  style: TextStyle(
                                    color: Colors.black
                                  ),),
                                  onPressed: (){
                                  showDialog(context: context, builder: (BuildContext){
                                    return AlertDialog(
                                      title: Icon(Icons.question_mark,
                                      color: Colors.black,
                                      ),
                                      content: Text("Are You Sure you want to Delete the product ?",
                                      style: TextStyle(
                                        color: Colors.red
                                      ),),
                                      actions: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MaterialButton(
                                              color:Colors.blue.shade200,
                                              child: Text("Yes",
                                              style: TextStyle(
                                                color: Colors.black
                                              ),
                                              ),

                                                onPressed: (){
                                                FirebaseFirestore.instance.collection("Products").doc(productId).delete();
                                            }
                                            ),
                                            MaterialButton(
                                                color:Colors.blue.shade200,
                                                child:Text("NO",
                                                style: TextStyle(
                                                  color: Colors.black
                                                ),),
                                                onPressed: (){
                                                  setState(() {

                                                  });

                                            })

                                          ],
                                        )
                                      ],
                                    );
                                  });

                              }),


                            ),
                          );
                        }),
                  )


                ],
              );
            }
            return CircularProgressIndicator();
          }

        ),
      ),
    );

  }
}
