import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin
{

  var lastPosition = 0.0;
  var random = Random();
  
AnimationController animationController;

  double getRandomNumber(){
     lastPosition = random.nextDouble();
     return lastPosition;
  }

  @override
  void initState(){
    super.initState();

    spinTheBottle();
  }

  spinTheBottle (){
     animationController = AnimationController( 
      vsync:this, duration:Duration(seconds: 1)
    );
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container( 
          height: MediaQuery.of(context).size.height,
          child: Image.asset("assets/floor4.jpg",
          fit:BoxFit.fill
          ),
        ),
         Center(
           child: Container( 
            child: RotationTransition(
              turns: Tween( 
                begin:lastPosition ,
                end: getRandomNumber()).animate(CurvedAnimation(
                  parent: animationController,
                  curve: Curves.linear
                )),
                          child: GestureDetector(
                            onTap: (){
                              if(animationController.isCompleted){
                                setState(() {
                                  spinTheBottle();
                                });
                              }
                            },
                                child: Image.asset("assets/bottle.png",
              width:250,
              height: 250,
              ),
                          ),
            ),
        ),
         )
      ],),
    );
  }
}
