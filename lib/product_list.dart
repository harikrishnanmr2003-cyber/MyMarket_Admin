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

    return Scaffold(
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
                        final productId = product.id;

                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context, builder: (BuildContext) =>
                                AlertDialog(
                                  backgroundColor: Colors.grey.shade200,
                                  icon: Icon(Icons.warning),
                                  title: Text("Product info"),
                                  content: Container(
                                    height: 60,
                                    width: 170,
                                    color: Colors.grey.shade200,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width:100,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("Product Name -:"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(snap["Name"]),
                                              )
                                            ],
                                          ),
                                        ),


                                      ],
                                    )
                                  ),
                                  actions: [

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: stk,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "Update Stock",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),



                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection("Products")
                                                .doc(productId)
                                                .update({
                                              "Stock": int.parse(stk.text),
                                            });

                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text("Stock Updated")),
                                            );
                                          },
                                          child: Text("Update Stock"),
                                        )

                                      ),
                                    ),


                                  ],

                                )
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

                                          }
                                          ),
                                          MaterialButton(
                                              color:Colors.blue.shade200,
                                              child:Text("NO",
                                              style: TextStyle(
                                                color: Colors.black
                                              ),),
                                              onPressed: (){

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
    );

  }
}
