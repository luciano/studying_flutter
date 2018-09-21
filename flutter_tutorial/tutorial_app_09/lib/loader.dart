import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  LoaderState createState() => LoaderState();
}

class LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  // need AnimationController and Animation working with doubles
  AnimationController controller;
  Animation<double> animation;
  Animation<double> animation2;

  // the AnimationController should be assigned in the initState
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    //animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    animation.addListener(() {
      this.setState(() {}); // when the values of the animation changes
    });
    animation.addStatusListener((AnimationStatus status) {
    });


    animation2 = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    animation2.addListener(() {
      this.setState(() {}); // when the values of the animation changes
    });
    animation2.addStatusListener((AnimationStatus status) {
    });

    //controller.forward();
    // animation keep running
    controller.repeat();
  }

  // dispose controller - free resources
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.white,
          height: 3.0,
          width: 100.0 * animation.value, // range for 0 to 1
        ),
        Padding(padding: EdgeInsets.only(bottom: 5.0)),
        Container(
          color: Colors.white,
          height: 3.0,
          width: 75.0 * animation.value,
        ),
        Padding(padding: EdgeInsets.only(bottom: 5.0)),
        Container(
          color: Colors.white,
          height: 3.0,
          width: 50.0 * animation.value,
        ),
        Padding(padding: EdgeInsets.only(bottom: 10.0)),
        Container(
          color: Colors.white,
          height: 3.0,
          width: 50.0 * animation2.value, // range for 0 to 1
        ),
        Padding(padding: EdgeInsets.only(bottom: 5.0)),
        Container(
          color: Colors.white,
          height: 3.0,
          width: 75.0 * animation2.value, // range for 0 to 1
        ),
        Padding(padding: EdgeInsets.only(bottom: 5.0)),
        Container(
          color: Colors.white,
          height: 3.0,
          width: 100.0 * animation2.value,
        ),
      ],
    );
  }
}