


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart ' as firebase_storage;

class NewProduct extends StatefulWidget {
  const NewProduct({super.key});

  @override
  State<NewProduct> createState() => _NewProductState();
}
  final CollectionReference product = FirebaseFirestore.instance.collection("Products");

class _NewProductState extends State<NewProduct> {

  String? SelectedSize ;
   List<String> Size = [

    "S",
    "M",
    "L",
    "Xl",

  ];
  List  image = [];

  Future imageUplode(File path)async{
    final  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
    DateTime now = DateTime.now();
    String timestamp = now.microsecondsSinceEpoch.toString();
    firebase_storage.Reference reference = storage.ref().child('images/$timestamp');
    firebase_storage.UploadTask task = reference.putFile(path);
    await task;
    String url = await reference.getDownloadURL();
    setState(() {
      image=[url];
    });
  }



  TextEditingController name = TextEditingController();
  TextEditingController disc = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController catgry = TextEditingController();
  TextEditingController stk = TextEditingController();
 //TextEditingController cnt = TextEditingController();





  Future Adddata()async{
    final Data = {
      "Name" : name.text,
      "discription" : disc.text,
      "price" : price.text,
      "Size" : SelectedSize,
      "catogary" : catgry.text,
      "Image" : image,
      "Stock" : stk.text,



    };
    await product.add(Data);

  }






 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text("New Product",
          style: TextStyle(
            color: Colors.white
          ),),
        ),
      ),
      body: SizedBox(
        height: 600,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
              width: 200,
              height: 40,
              color: Colors.grey.shade200,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("Upload image",
                 style: TextStyle(
                   color: Colors.black
                 ),),
               ),
                     ),
           ),




                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()async{
                      final pikeedimage = await ImagePicker().pickImage(
                          source: ImageSource.gallery);
                      if(pikeedimage==null){
                        return;
                      }
                      else{
                        File path = File(pikeedimage.path);
                        image = await imageUplode(path);
                        setState(() {

                        });
                      }

                    },
                    child: Container(
                      color: Colors.grey.shade400,
                      width: 100,
                      height: 100,
                      child: image !=null?
                      Image(image: NetworkImage(image!.toString())):
                      Text('no image'),
                    ),
                  ),
                ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 40,
                //color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Product Name",
                    style: TextStyle(
                    color: Colors.black
                  ),),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 40,
                color: Colors.grey.shade200,
                child:  TextField(
                  controller: name,

                  decoration: InputDecoration(


                    hintText: "Product name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 40,
                //color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Product discription",
                    style: TextStyle(
                        color: Colors.black
                    ),),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 90,
                color: Colors.grey.shade200,
                child:  TextField(
                  controller: disc,

                  decoration: InputDecoration(


                    hintText: "Product discription",

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 40,
                //color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Catogary",
                    style: TextStyle(
                        color: Colors.black
                    ),),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 40,
                color: Colors.grey.shade200,
                child:  TextField(
                  controller: catgry,

                  decoration: InputDecoration(


                    hintText: "Product catogary",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),



            Container(
              height: 60,
              width: 100,

              child: ListTile(
                title: Text("size",style: TextStyle(
                  color: Colors.black
                ),),
                subtitle: Text("out of stock",
                style: TextStyle(
                  color: Colors.red
                ),),
              ),
            ),
       Container(
         width: 200,
         height: 100,
         child:DropdownButtonFormField<String>(
           decoration: InputDecoration(
             labelText: "Select Shoe Size",
             border: OutlineInputBorder(),
           ),
           value: SelectedSize,
           items: Size.map((e) {
             return DropdownMenuItem(
               value: e,
               child: Text(e),
             );
           }).toList(),
           onChanged: (value) {
             setState(() {
               SelectedSize = value!;
             });
           },

         )
       ),

       Container(
         height: 100,
         width: 200,
         child:  Row(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 width: 150,
                 height: 40,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text("Product Price",
                     style: TextStyle(
                         color: Colors.black
                     ),),
                 ),
               ),
             ),
             Container(
                 width: 50,
                 height: 40,
                 color: Colors.grey.shade200,
                 child: TextField(
                   controller: price,


                 )
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 width: 100,
                 height: 40,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text("Stock",
                     style: TextStyle(
                         color: Colors.black
                     ),),
                 ),
               ),
             ),
             Container(
                 width: 50,
                 height: 40,
                 color: Colors.grey.shade200,
                 child: TextField(
                   controller: stk,


                 )
             ),

           ],
         ),

       ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  child: Center(
                    child: Text("Add Product",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  ),
                  color: Colors.indigo,
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                            content: Text("product Added Successfully",
                            style: TextStyle(
                              color: Colors.white
                            ),)
                        )
                    );
                    
                    setState(() {
                      Adddata();
                    });
                  }),
            )




        ]
        ),
      ) ,
    );
  }
}
