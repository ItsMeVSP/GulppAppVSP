// Login Page
// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_core/firebase_core.dart' show Firebase, FirebaseApp;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gulpp_demo/shop.dart';
import 'signup.dart';
// import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

//Run Main App
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//For StatelessWidgets
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(
  //       statusBarColor:Color.fromRGBO(45, 157, 100, 1),
  //     )
  //   );
  // return MaterialApp(
  //   title: 'Gulpp Demo',
  //   theme: ThemeData(
  //     colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 41, 115, 52)),
  //     useMaterial3: true,
  //     ),
  //   //Connect StatefulWidget in home 
  //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
  //   // For Navigating from one page to another
  //   debugShowCheckedModeBanner: false,  
  //   );
  // }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  User? user;

  @override
  void initState(){
    super.initState();
    user=FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build (BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:Color.fromRGBO(45, 157, 100, 1),
      )
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gulpp Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 41, 115, 52)),
        useMaterial3: true,
      ),
      home: user != null ? const shopApp():const MyHomePage(title: "Gulpp Demo"),
    );
  }

}

// For StatefulWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  
  // Create State of StatefulWidget
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State of StatefulWidget- Hre we build the app page
class _MyHomePageState extends State<MyHomePage> {
  
  // Firebase initialization
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp =await Firebase.initializeApp();
    return firebaseApp;
  }
  
  // Connect Login Screen here
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(), 
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return const LoginPage();
          }
          return const Text("Unable to Connect you. Sorry");
        },
      ),
    );
  }
}

// Login Page Widget
class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  
  @override
  State<LoginPage> createState() =>_LoginPageState();

}

class _LoginPageState extends State<LoginPage>{

  bool viewpwd=false;
  bool remempwd=false;

  // TextField Controller
  TextEditingController emailtext= TextEditingController();
  TextEditingController pwdtext= TextEditingController();

  static Future<User?>loginUsingEmailPassword({required String email, required String password, required BuildContext context})async{
    FirebaseAuth auth=FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential=await auth.signInWithEmailAndPassword(email: email, password: password);
      user=userCredential.user;
    }on FirebaseAuthException catch(e){
      print(e);
    }
    return user;
  }

  // Build App here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 237, 237),
      body:SingleChildScrollView(
        child: Column(
          children: [
        
        
        
            // Place Logo here
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
                    
        
                    // Login greet
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0,0, 0, 0),
                      child:Column(
                        children: [
        
                          Text("Welcome Back",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
        
                          Text("Login to your Existing Account",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
        
                        ],
                      ),
                    ),
        
        
        
                    // UserName, Password
                    Column(
                      children: [
                        // UserName
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30,20, 10),
                          child: Container(
                            width: 243,
                            height: 37,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),border: Border.all(color: const Color.fromRGBO(154, 154, 154, 1),width:2.0,)),
                            child:TextField(
                              controller: emailtext,
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
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),border: Border.all(color: const Color.fromRGBO(154, 154, 154, 1),width:2.0,)),
                            child:TextField(
                              controller: pwdtext,
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
        
                      ],
                    ),
        
        
        
                    // Remember Me, Forgot Password
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
        
        
        
                          Padding(
                            padding: const EdgeInsets.fromLTRB(28,0,0,0),
                            child:Row(
                              children: [
                                
                                // Remember me
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
        
                                    Checkbox(
                                      value: remempwd,
                                      onChanged: dummybool(),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
        
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0,0,40,0),
                                      child:Text("Remember Me",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
        
                                  ],
                            
                                ),
        
                                // Forgot Password
                                const Row(
                                  children: [
        
                                    Text("Forgot Password ?",
                                      style:TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 9,
                                        color: Colors.black,
                                      ),
                                    ),
        
                                  ],
                                ),
        
        
                              ],
                            ),
                          ),
        
        
        
                        ],
                      ),
                    ),
        
        
        
                    // Login Button
                    Column(
                      children: [
        
        
        
                        SizedBox(
                          width: 243,
                          height: 31,
                          child: TextButton(
                            onPressed:()async{
                              User? user=await  loginUsingEmailPassword(email: emailtext.text, password: pwdtext.text, context: context);
                              print(user);
                              if(user!=null){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const shopApp()));
                              }
                              // showDialog(
                              //   context: context,
                              //   barrierDismissible: false,
                              //   builder: (BuildContext context){
                              //     return const AlertDialog(
                              //       content: RouteInfo(),
                              //       contentPadding: EdgeInsets.all(0),
                              //     ); 
                              //   },
                              // );
                            },  
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(45, 157, 100, 1)),
                              shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0.0,horizontal: 24.0),),
                            ), 
                            child:const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text("Login",
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
        
        
        
                    // Don't have an account, SignUp                  
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10,0, 0),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
        
        
                          // Don't have an account
                          const Text("Don't have an account?",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          
                          
                          // SignUp
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                            child:ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: ((context) => const SignupPage(title: 'SignUp',))),);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              child:const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
        
        
                                  Text(
                                    "Sign Up",
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
      ),
    );
  }
}

dummybool() {
}