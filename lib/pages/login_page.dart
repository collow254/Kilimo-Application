import 'package:agric/pages/main_page.dart';
import 'package:agric/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Image.asset('assets/welcome.png', width: 380,),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(child: TextField(
                  decoration: InputDecoration(
                      hintText: "Username",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(99))
                      ),

                  ),
                )),
              ],
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(99))
                    ),

                  ),
                )
                ),
              ],
            ),

          ),
          FilledButton.icon(
            onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const MainPage()));
          }, icon: Icon(IconlyLight.login), label: Text("Login"),),
          FilledButton.icon(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const RegisterPage()));
          }, icon: Icon(IconlyLight.addUser), label: Text("Register"),)
        ],
      ),

    );
  }
}
