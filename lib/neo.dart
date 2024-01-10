import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Neo extends StatefulWidget {
  const Neo({super.key});

  @override
  State<Neo> createState() => _NeoState();
}

class _NeoState extends State<Neo> {
  bool isPressed = true;
  double bl = 30.0;
  Offset distance = Offset(28, 28);


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xffFFA732),
      body:Center(
        child:Column(
          children: [
         Container(


          ),
        SizedBox(height: 200, width: 200),
          ],
        )
        ),
      

    );
  }
}
