// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class shopApp extends StatelessWidget {
  const shopApp({super.key}); 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(45, 157, 100, 1)
      
    ),
  );
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
      ),
        home: const ShopHomePage(title: 'Flutter Demo Home Page'),  
        debugShowCheckedModeBanner: false,
      );
  } 
}

class ShopHomePage extends StatefulWidget{
  const ShopHomePage({super.key, required this.title});
  final String title;
  @override
  State<ShopHomePage>createState()=> _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  bool isVisible = false;

  //bottom navigator
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
      height:50,
      width:360,
      color: const Color.fromRGBO(231,231,231,1),
      child: Row(children: [
        const Padding(padding: EdgeInsets.fromLTRB(40,20,40,0),),
        Image.asset("assets/homepage.png",width: 40,height: 30,color: Colors.black,),
        const SizedBox(width: 196.0,),
        Image.asset("assets/profile.png",width: 40,height: 30,color: Colors.black,),
      ],

      ),
      ),
      //Home page
      backgroundColor: Colors.white,
      body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Column(
      children: [
        Container( // Container for the "Home" text with green background
              padding: const EdgeInsets.fromLTRB(155,5,155,5,),
              width: 420,
              height: 43,
              color: Color.fromARGB(255, 237, 95, 157),
              child: const Center(
                child:Text("HOME",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // Set the text color to white
                ),
              ),
              ),
            ),

            //location and profile 
            const Padding(
              padding: EdgeInsets.fromLTRB(20,20,20,25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu,size: 30,),
                  Center(
                    child: Text("Location",
                    style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage("assets/apple.png",),
              )
            ],
          ),
        ),

        //search icon
        Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,15),
          child: Container(
            width: 350,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 203, 17,1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left:20,bottom: 10,top: 10),
                      ),
                    ),
                  ),
                  Icon(Icons.search),
                  SizedBox(width: 10,),
                ],
              ),
            ),
          ),

          //shop heading and forward arrow
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:EdgeInsets.fromLTRB(20,20,0,25),
                child:Text("Shops:",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  ),
                )
              ),

              //shop list
              Padding(
                padding: const EdgeInsets.fromLTRB(25,0,25,20),
                child: Container(
                  width: 300,
                  height: 36,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),border: Border.all(color: const Color.fromRGBO(154, 154, 154, 1),width: 2.0)),
                  child: 
                  Row(
                    children: [
                      const Expanded(
                        child: Text("Smith Field Bakers",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        icon:const Icon(Icons.arrow_forward_ios), 
                        onPressed: (){
                          setState(() {
                            isVisible = !isVisible;
                          }
                        );
                      },
                    ),
                  ],
                )
              ),
            ),
          ],
        ),

        //shop card
        if (isVisible)
        Center(
          child: Container(
            width: 306,
            height: 351,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              border: Border.all(
                color: Colors.grey,
                width: 0,
              ),
              color: const Color.fromRGBO(255,252,241,1),
            ),
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/shop1.jpg",
                  width: 302,
                  height: 173,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,20,0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Smith Field Bakery",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.location_on, size: 10, color: Colors.black),
                        SizedBox(width: 10),
                        Text(
                          "Location",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Deliver 10 Bottles",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Pending Amount",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),


                    Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,10),
                        child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("₹",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 82,
                          height: 24,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(const Color.fromRGBO(255, 203, 17, 1)),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.fromLTRB(0,0,0,0)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: const BorderSide(color: Colors.black,width: 0.0),
                                ),
                              ),
                            ),
                            child: const Text("Update",
                            style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),
),
);
  }
}