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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),

                      hintText: "search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                      color: Colors.blue.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Add Product",
                          style: TextStyle(
                              color: Colors.black
                          ),),
                      ),
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (

                            context) {
                          return NewProduct();
                        }));
                      }),
                ),
                SizedBox(
                  height: 650,
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Product Name -:"),
                                            Text(snap["Name"])
                                          ],
                                        ),
                                        TextField(
                                          controller: stk,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: "Update Stock",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),

                                      ],
                                    )
                                  ),
                                  actions: [



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
                              ),),


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
