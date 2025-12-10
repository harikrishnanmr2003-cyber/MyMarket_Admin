
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text("track your oders",
          style: TextStyle(
            color: Colors.white
          ),),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
            Container(
              width: 200,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Canon EOS 1500D,\n"
                    "Canon Camera",

                style: TextStyle(
                  color: Colors.black
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Discription",style: TextStyle(
                color: Colors.black,
            
              ),),
            ),
            Container(
              width: 200,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Canon EOS 1500D,\n"
                    "Canon Camera,with high defenition lense for greate photography",
                style: TextStyle(
                  color: Colors.black
                ),),
              ),
            ),


            Container(
              width: 150,
              height: 50,
              child: ListTile(
                title: Text("Ddelivery in 4 - dec 2025",
                  style: TextStyle(
                      color: Colors.green
                  ),),
                  trailing: IconButton(onPressed: (){


                  },
                      icon: Icon(Icons.calendar_month,
                      color: Colors.black,
                      ),

                  ),
              )

            ),
            Container(
              width: 100,
              height: 40,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Oder tracking NO: 182495"),
              ),
            ),
            Container(
              width: 150,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.green,
                      child: Center(
                        child: Text("Oder Placed",
                        style: TextStyle(
                          color: Colors.black
                        ),),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: Text("Shipped",
                            style: TextStyle(
                                color: Colors.black
                            ),),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: Text("out for delivery",
                            style: TextStyle(
                                color: Colors.black
                            ),),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: Text("Delivered",
                            style: TextStyle(
                                color: Colors.black
                            ),),
                        )
                    ),
                  )
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 110,
                    height: 35,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("product price :-",
                        style: TextStyle(
                            color: Colors.black
                        ),),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 110,
                    height: 35,
                    //  color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("7999 ",
                        style: TextStyle(
                            color: Colors.black
                        ),),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    height: 35,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("delivery charge",
                        style: TextStyle(
                            color: Colors.black
                        ),),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 110,
                    height: 35,
                    //  color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("10/- ",
                        style: TextStyle(
                            color: Colors.black
                        ),),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 110,
                    height: 35,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("GST 2%",
                        style: TextStyle(
                            color: Colors.black
                        ),),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 110,
                    height: 35,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("gst ",
                        style: TextStyle(
                            color: Colors.black
                        ),),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 110,
                    height: 35,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Total Amount",
                        style: TextStyle(
                            color: Colors.black
                        ),),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 110,
                    height: 35,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("8110/-",
                        style: TextStyle(
                            color: Colors.black
                        ),),
                    ),
                  ),
                )
              ],
            ),



          ],
        ),
      ),
    );
  }
}
