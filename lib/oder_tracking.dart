
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  Color getStatusColor(String step, String currentStatus) {
    List<String> steps = [
      "Placed",
      "Packed",
      "Shipped",
      "Out for Delivery",
      "Delivered"
    ];

    return steps.indexOf(step) <= steps.indexOf(currentStatus)
        ? Colors.green.shade300
        : Colors.grey.shade300;
  }








  @override
  Widget build(BuildContext context) {

    final track = ModalRoute.of(context)!.settings.arguments as Map;

    String? oderId = track["oderId"];




    return SafeArea(
      child: Scaffold(
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
          child: StreamBuilder(
            stream:  FirebaseFirestore.instance
                .collection("Oders")
                .doc(oderId)
                .snapshots(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                final data = snapshot.data!;
                // final Status = data["status"];
                final Map<String, dynamic>? address =
                data.data() != null && data.data()!.containsKey("address")
                    ? Map<String, dynamic>.from(data["address"])
                    : null;
                Timestamp ts = data["expectedDelivery"];
                DateTime date = ts.toDate();
                String formattedDate = DateFormat('dd MMM yyyy').format(date);
                return ListView(
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
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(data["Image"][0])),
                      ),
                    ),
                    Padding( //product name
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data["Name"],
                        style: TextStyle(
                        color: Colors.black,
                      ),
                      ),
                    ),



                    Container(
                      width: 130,
                      height: 100,
                      child: address == null
                          ? const Text(
                        "Address not available",
                        style: TextStyle(color: Colors.red),
                      )
                          : Text(
                        "${address["House Name"]}, "
                            "${address["city"]}, "
                            "${address["Disctrict"]}, "
                            "${address["state"]}",
                        style: const TextStyle(color: Colors.black),
                      ),

                    ),


                    Container(
                      width: 200,
                      height: 100,
                      child: Padding( // address
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data["paymentMethod"],
                          style: TextStyle(
                              color: Colors.black
                          ),),
                      ),
                    ),


                    Container(
                        width: 150,
                        height: 50,
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Delivery date : $formattedDate",// delivery date
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          trailing: IconButton(onPressed: () {
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

                    Container( // tracking status
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
                                    child: Text(data["status"],
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
                              child:Text("₹${data["price"].toString()}",
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

                                onPressed: () {

                                  showDialog(
                                      context: context, builder: (BuildContext) {
                                    return AlertDialog(
                                      title: Text("Cancel Order"),
                                      content: Text(
                                          "Are you sure you want to delete this order?"),
                                      actions: [
                                        TextButton(
                                          child: Text("No"),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                        TextButton(
                                          child: Text("Yes"),
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection("Oders")
                                                .doc(orderId).delete();
                                            Navigator.pop(context); // close dialog
                                            Navigator.pop(context); // go back
                                          },
                                        ),
                                      ],
                                    );
                                  });



                                }
                            ),
                          ),
                        )
                      ],
                    )


                  ],
                );
              } return CircularProgressIndicator();
            }
          ),
        ),
      ),
    );
  }
}
