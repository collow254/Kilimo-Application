import 'dart:ui';

import 'package:agric/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../data/channels.dart';
import 'package:badges/badges.dart' as badges;



class MainPage extends StatelessWidget {
  const MainPage({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: false,
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi Collins", style: Theme.of(context).textTheme.titleMedium),
              Text("Welcome Back", style: Theme.of(context).textTheme.bodySmall)
            ]
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(onPressed: (){},
                icon: badges.Badge(
                    badgeContent: const Text(
                      '3',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12),
                    ),
                    badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.green
                    ),
                    position: badges.BadgePosition.topEnd(top: -15, end: -12),
                    child: Icon(IconlyBroken.notification))),
          )
        ],
      ),

      body: GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: channels.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.8,
          ),

          itemBuilder: (context, index){
            final channel = channels[index];
            return Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: (
                    DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(channel.image)
                    )
                ),
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(


                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.4)
                      ),
                      child: TextButton(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomePage()));
                      }, child:  Text(channel.name,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),))

                  ),

                ),
              ),
            );

          }),
    );
  }
}
