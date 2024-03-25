// import 'package:agric/pages/explore_page.dart';
// import 'package:agric/pages/home_page.dart';
// import 'package:agric/pages/login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
//
// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         minimum: EdgeInsets.all(20),
//         child: Center(
//           child: Column(
//             children: [
//               Spacer(),
//               Image.asset('assets/welcome.png', width: 380,),
//               Spacer(),
//               Text("Welcome to Kilimo App", style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 25),
//                 child: Text("Get agricultural products from the comfort of your home. You are just a few clicks away from your favourite products"),
//               ),
//               FilledButton.tonalIcon(onPressed: (){
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginPage()));
//               }, icon: Icon(IconlyLight.login), label: Text("Continue with Google"),)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

import 'login.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kilimo App'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'assets/welcome.jpeg',
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Welcome Kilimo App!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget dolor eu turpis fermentum ultricies. Nulla facilisi. Proin vel justo sed sem aliquet vulputate. Cras convallis purus ut ex ultrices, vel laoreet nunc vestibulum.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const Login()));
                },
                child: Text('Get Started'),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/farm.jpeg',
                height: 200,
                fit: BoxFit.cover,

              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

