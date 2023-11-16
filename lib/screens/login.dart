import 'package:brig_project/screens/home.dart';
import 'package:flutter/material.dart';
//import 'widgets/headerBar.dart';
import 'package:url_launcher/url_launcher.dart';


launchURLApp() async {
  var url = Uri.parse("https://www.geneva.edu/student-life/services/security/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  image: AssetImage("images/backgroundColor.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
             Positioned(
              top:10,
              left: 10,
              child: Image.asset(
                "images/tornadoTransparent.png", 
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
             const SizedBox(
              
              width: 250,
             child: TextField(
             obscureText: true,
             decoration: InputDecoration(
             border: OutlineInputBorder(),
             labelText: 'Student ID:',
                  ),
                 ),     
               ),
                 const SizedBox(height:20),
                const SizedBox(
              width: 250,
             child: TextField(
             obscureText: true,
             decoration: InputDecoration(
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
               onPressed: ()
                {
               Navigator.push(
                   context, 
                 MaterialPageRoute(builder: (context) => const HomePage())
               );
                },
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

  // look at current time, output value

  DateTime currentTime() {
    return DateTime.now();
  }

}

      


    
