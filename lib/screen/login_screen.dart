import 'package:design_app/component/curve-clips.dart';
import 'package:design_app/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.grey[200],
      child: Material(
        color: Colors.grey[200],
        child: Column(
          children: [
            ClipPath(
              clipper: CurveClips(),
              child: Image(
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.cover,
                image: const AssetImage('assets/images/login_background.jpg'),
              ),
            ),
            const Text(
              'FoundFinder',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    (Icons.email),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    (Icons.lock),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4),
              decoration: BoxDecoration(
                color: Colors.blueAccent,

                borderRadius: BorderRadius.circular(20)
              ),
              child: MaterialButton(
                height: 50,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home_screen(),));
                },
                child:const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login),
                    Text(
                      '    Login',style :TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
            ),
           Expanded(
             child: Align(
               alignment: Alignment.bottomCenter,
               //alignment: FractionalOffset.bottomCenter,
               child: Container(
                 color: Colors.blueAccent,
                  width: double.infinity,
                  height: 80,
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Don\'t Have An Account ',style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
             ),
           ),
          ],
        ),
      ),
    );
  }
}
