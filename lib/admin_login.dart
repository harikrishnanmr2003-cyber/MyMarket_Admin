import 'package:flutter/material.dart';
import 'package:my_market/main.dart';

class Adminlog extends StatefulWidget {
  const Adminlog({super.key});

  @override
  State<Adminlog> createState() => _AdminlogState();
}

class _AdminlogState extends State<Adminlog> {

  TextEditingController admin = TextEditingController();
  TextEditingController pass = TextEditingController();

 Future Signup()async{

     if(admin.text == Admin && pass.text == password){
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
               content: Text("Login successful"),
             backgroundColor: Colors.green,
           )
       );
       Navigator.push(context, MaterialPageRoute(builder: (context){
         return MyApp();
       }));

     }
     else{
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text("You are not an Admin"),
             backgroundColor: Colors.red,
           )
       );
     }

 }

  String Admin = "hxrikrishnan0437@gmail.com";
  String password = "MyownApp@0437";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 600,
          width: 600,
          color: Colors.grey.shade200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                     child: Icon(Icons.person,color: Colors.black,),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: 70,
                      height: 50,
                      child: Center(
                        child: Text("Admin",
                        style: TextStyle(
                          color: Colors.indigo
                        ),),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Icon(Icons.person,
                              color: Colors.blueAccent.shade700,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //color: Colors.blueGrey.shade800,
                          width: 200,

                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade200,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                          ),
                          child: TextField(
                            controller: admin,
                            decoration: InputDecoration(
                                hintText: "Username"
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Icon(Icons.lock,
                              color: Colors.blueAccent.shade700,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //color: Colors.blueGrey.shade800,
                          width: 200,

                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade200,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                          ),
                          child: TextField(
                            controller: pass,
                            decoration: InputDecoration(
                                hintText: "Password"
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Center(
                  child: MaterialButton(
                    color: Colors.blue.shade200,
                      child: Text("Log In",
                      style: TextStyle(
                        color: Colors.black
                      ),),
                      onPressed: (){
                      setState(() {
                        Signup();
                      });

                  }),
                )


              ],
            ),
          ),
        ),
      ),

    );
  }
}
