
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {

  DateTime today = DateTime.now();
  void Selectedday(DateTime day,DateTime focusday){
    setState(() {
      today = day;
    });
  }



  @override
  Widget build(BuildContext context) {

    final track = ModalRoute.of(context)!.settings.arguments as Map;
    var odername = track["Name"];
    var productimage = track["Image"];
    var productprice = track["price"];

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
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: Colors.grey,
            // ),
            Container(
              width: 200,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                 productimage[0].toString(),

                style: TextStyle(
                  color: Colors.black
                ),),
              ),
            ),
            Padding(                                                 //product name
              padding: const EdgeInsets.all(8.0),
              child: Text("Discription",style: TextStyle(
                color: Colors.black,
            
              ),),
            ),
            Container(
              width: 200,
              height: 100,
              child: Padding(                                            // address
                padding: const EdgeInsets.all(8.0),
                child: Text(odername,
                style: TextStyle(
                  color: Colors.black
                ),),
              ),
            ),

            Container(
              width: 130,
              height: 70,
              color: Colors.grey,                                //payment
            ),


            Container(
              width: 150,
              height: 50,
              child: ListTile(
                title:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " delivery date: ${today.day}-${today.month}-${today.year}",      // delivery date
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                  trailing: IconButton(onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            child: AlertDialog(
                              content: SizedBox(
                                height: 400,
                                width: 300,
                                child: TableCalendar(
                                  focusedDay: today,
                                  firstDay: DateTime.utc(2024, 1, 1),
                                  lastDay: DateTime.utc(2040, 12, 31),
                                  selectedDayPredicate: (day) =>
                                      isSameDay(today, day),
                                  onDaySelected: (selectedDay, focusedDay) {
                                    setState(() {
                                      today = selectedDay;
                                    });
                                    Navigator.pop(context); // close dialog
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                  },
                      icon: Icon(Icons.calendar_month,
                      color: Colors.black,
                      ),

                  ),
              )
            ),

            Container(                                                                     // tracking status
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
                      color: Colors.green.shade300,
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
                          child: Text("Packed",
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
                          child: Text("Shiped",
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
                        width: 140,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: Text("Out for Delivery",
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
                      child: Text( productprice,  // price
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Card(
                  elevation: 15,
                  shadowColor: Colors.black,
                  child: Container(
                    width: 200,
                    height: 80,
                    color: Colors.grey.shade200,
                    child: Text("total amount "),
                  ),
                ),

                Card(
                  elevation: 15,
                  shadowColor: Colors.black,
                  child: Container(
                    color: Colors.grey.shade200,
                    width: 100,
                    height: 80,
                    child: MaterialButton(
                      color: Colors.blue.shade200,
                      child: Text("Cancel oder",
                      style: TextStyle(
                        color: Colors.black
                      ),),

                        onPressed: (){}
                    ),
                  ),
                )
              ],
            )







          ],
        ),
      ),
    );
  }
}
