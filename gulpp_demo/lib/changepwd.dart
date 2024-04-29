// Change Your Password Popup Page
import 'package:flutter/material.dart' show Border, BorderRadius, BoxDecoration, BuildContext, ButtonStyle, Color, Colors, Column, Container, EdgeInsets, FontWeight, InputBorder, InputDecoration, MainAxisAlignment, MainAxisSize, MaterialStatePropertyAll, Navigator, Padding, Radius, Row, State, StatefulWidget, Text, TextButton, TextField, TextOverflow, TextStyle, Widget;

// StatefulWidget
class RouteInfo extends StatefulWidget{
  const RouteInfo({super.key});

  @override
  State<RouteInfo> createState() => _RouteMap();
}

// State of StatefulWidget
class _RouteMap extends State<RouteInfo>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317,
      height: 247,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0),),
        border:Border.all(
          color: const Color.fromARGB(111, 73, 222, 9),
          width: 1.0
          ),
        color: Colors.white,
      ),
      margin: const EdgeInsets.fromLTRB(0,0,0,0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [


          // Enter your Password Heading
          const Padding(
            padding: EdgeInsets.fromLTRB(30,20,30,0),
            child: Column(
                children: [
                  
                  Text("Enter Your Password",
                    style: TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),



          Column(
            children: [

              // Current Password
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,30,0),
                child: Container(
                  width: 243,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: const Color.fromRGBO(154, 154, 154, 1),
                      width: 2.0,
                    )
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: "Current Password:",
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Color.fromRGBO(154,154,154,1),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(15,10,0,10),
                    ),
                  ),
                ),
              ),

              // New Password
              Padding(
                padding: const EdgeInsets.fromLTRB(29,10,29,3),
                child: Container(
                  width: 243,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: const Color.fromRGBO(154,154,154,1),
                      width:2.0,
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: "New Password",
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Color.fromRGBO(154,154,154,1),
                      ),
                      contentPadding:EdgeInsets.fromLTRB(15,10,0,10),
                    ),
                  ),
                ),
              ),

              // cancel and Confirm Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cancel Button
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,20,30,0),
                      child: TextButton(
                        onPressed:() => Navigator.of(context).pop(),
                        style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(158,217,255,1),),
                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 7.0,horizontal: 28.0),),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontFamily: "poppins",
                            fontSize:11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                    // Confirm Button
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0,20,20,0),
                      child: TextButton(
                        onPressed:null,
                        style: ButtonStyle(
                          elevation: MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(158,217,255,1),),
                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 7.0,horizontal: 28.0),),
                        ),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            fontFamily: "poppins",
                            fontSize:11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ],
                ),
              ), 


            ],
          ),



        ],
      ),
    );
  }
}