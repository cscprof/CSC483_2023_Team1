//import 'dart:js';
import 'package:brig_project/screens/home.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'widgets/headerBar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase/users.dart';



launchURLApp() async {
  var url = Uri.parse("https://www.geneva.edu/student-life/services/security/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage ({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
TextEditingController userController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  bool night = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title:"Login Page",
        home:Scaffold(
          body: Stack(
          children:[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/backgroundColor.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top:10,
              left: 10,
              child: Image.asset(
                "assets/images/tornadoTransparent.png", 
                width: 800, 
                height: 800, 
              ),
            ),
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  top:10,
                  left: 10,
                  child: Image.asset(
                    "images/geneva_logo.png", 
                  ),
                ),
                const Text( 
                  'Sign In With Geneva Student ID:',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight:FontWeight.bold,
                    decorationColor:(Color(0xff2D2D2D)),  
                  ),
                ),
                const SizedBox(height:20),
                SizedBox(
                  width: 250,
                  child: TextFormField(         
                    controller: userController,     
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Student ID:',
                    ),
                  ),     
                ),
                const SizedBox(height:20),
                SizedBox(
                  width: 250,
                  child: TextFormField(           
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'PIN:',
                    ),
                  ),
                ),
                const SizedBox(height:50),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffCB9700)),
                  ),
                  child: const Text('Sign In'),
                  onPressed: () async {
                    // user: haylee, password: phaylee 
                    if (await isLoginCorrect(userController.text, passwordController.text))            
                    {  
                    // ignore: use_build_context_synchronously
                    // add currentUser here -- Ryan
                      currentUser = UserClass(userController.text, passwordController.text);
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const HomePage())
                      );
                    }
                    else
                    {
                    const Text('Incorrect Username or Password');
                    }
                  }
                ),    
                const SizedBox(height:50),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffCB9700)),
                  ),
                  child: const Text('Lost ID Card?'), 
                  onPressed: ()
                  {
                    launchURLApp();
                  },
                ),
              ],  
            ),
          )
        ]
      ),
      )
    );
  }   
}