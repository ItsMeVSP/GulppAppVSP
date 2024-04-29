// Sign Up Page
import 'package:flutter/material.dart' show Border, BorderRadius, BoxDecoration, BuildContext, ButtonStyle, Color, ColorScheme, Colors, Column, Container, EdgeInsets, ElevatedButton, FontWeight, Icon, IconButton, Icons, Image, InputBorder, InputDecoration, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, MaterialStatePropertyAll, Navigator, Padding, Radius, RoundedRectangleBorder, Row, Scaffold, SizedBox, State, StatefulWidget, StatelessWidget, Text, TextButton, TextField, TextOverflow, TextStyle, ThemeData, Widget;
import 'package:flutter/services.dart';
import 'package:gulpp_demo/main.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:Color.fromRGBO(45, 157, 100, 1),
      )
    );
    return MaterialApp(
      title: 'Gulpp Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 41, 115, 52)),
        useMaterial3: true,
      ),
      home: const Signup(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Signup extends StatefulWidget {
  const Signup({super.key, required this.title});
  final String title;
  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
  bool viewpwd=false;
  bool remempwd=false;

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 237, 237),
      body:Column(
        children: [


          // Logo
          Padding(
            padding:const EdgeInsets.fromLTRB(50, 100, 0,0),
            child:SizedBox(
              width: 250,
              height: 185,
              child: Image.asset('assets/cyclist.png',width: 249,height: 183,),
            ),
          ),


          // Login Container
          Padding(
            padding: const EdgeInsets.fromLTRB(40,0,0,30),
            child: Container(
              width: 298,
              height: 320,
              decoration:  BoxDecoration(borderRadius:const BorderRadius.all(Radius.circular(20.0)),color:const Color.fromRGBO(0, 255, 87, 0.04),border:Border.all(color: const Color.fromRGBO(218, 218, 218, 0.44),width: 1.0,)),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [

                  // Login Greet
                  const Padding(padding: EdgeInsets.fromLTRB(0,0, 0, 0),
                    child:Column(
                      children: [

                        Text("Let's get started",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),

                        Text("Create an account",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                        ),

                    ],
                    ),
                  ),

                  // UserName, Password, Confirm Password
                  Column(
                    children: [
                      // UserName
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30,20, 10),
                        child: Container(
                          width: 243,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: const Color.fromRGBO(154, 154, 154, 1),
                              width:2.0,
                            )
                          ),
                          child:TextField(
                            decoration: InputDecoration(
                              labelText: "User Name:",
                              prefixIcon: Image.asset("assets/personicon.png",width: 11.2,height: 16,color:const Color.fromRGBO(158, 158, 158, 0.8)),
                              border: InputBorder.none,
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Color.fromRGBO(154, 154, 154, 1),
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                            ),
                          ),
                        ),
                      ),
                      // Password
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 243,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: const Color.fromRGBO(154, 154, 154, 1),
                              width:2.0,
                            )
                          ),
                          child:TextField(
                            decoration: InputDecoration(
                              labelText: "Password:",
                              prefixIcon: Image.asset("assets/pwdicon.png",width: 11.2,height: 16,color:const Color.fromRGBO(158, 158, 158, 0.8)),
                              suffixIcon: IconButton(
                                icon: viewpwd?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                                onPressed:(){
                                  setState(() 
                                    {
                                      viewpwd=!viewpwd;
                                    }
                                  );
                                },
                                color: const Color.fromRGBO(154, 154, 154, 1),
                                padding: const EdgeInsets.fromLTRB(0,-10, 0, 0),
                              ),
                              border: InputBorder.none,
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Color.fromRGBO(154, 154, 154, 1),
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(5, 10, 0, -30),
                            ),
                          ),
                        ),
                      ),
                      // Confirm Password
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 243,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: const Color.fromRGBO(154, 154, 154, 1),
                              width:2.0,
                            )
                          ),
                          child:TextField(
                            decoration: InputDecoration(
                              labelText: "Confirm Password:",
                              prefixIcon: Image.asset("assets/pwdicon.png",width: 11.2,height: 16,color:const Color.fromRGBO(158, 158, 158, 0.8)),
                              suffixIcon: IconButton(
                                icon: viewpwd?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                                onPressed:(){
                                  setState(()
                                    {
                                        viewpwd=!viewpwd;
                                    }
                                  );
                                },
                                color: const Color.fromRGBO(154, 154, 154, 1),
                                padding: const EdgeInsets.fromLTRB(0,-10, 0, 0),
                              ),
                              border: InputBorder.none,
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Color.fromRGBO(154, 154, 154, 1),
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(5, 10, 0, -30),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                  // SignUp Button
                  Column(
                    children: [
                      
                      SizedBox(
                        width: 243,
                        height: 31,
                        child: TextButton(
                          onPressed: _incrementCounter, 
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(45, 157, 100, 1)),
                            shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0.0,horizontal: 24.0),),
                          ), 
                          child:const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text("Sign Up",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize:15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                  // Already have an account, Login
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10,0, 0),
                    child:Row(
                      children: [
                        // Already have an account
                        const Text("Already have an account?",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        //Login Button
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                          child:ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              elevation: MaterialStateProperty.all(0),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => const MyApp())),);
                            },
                            child:const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
  
                      ],
                    ),
                  ),


                ],
              ),
            )
          ),



        ],
      ),
    );
  }
}


dummybool() {
}

