// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
   double? result;
   bool isMale;
   int? age;

  BmiResultScreen({
   @required this.result,
   @required this.age,
   required this.isMale
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);

          },
          icon: Icon(
              Icons.keyboard_arrow_left
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          'Bmi result'
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,

          children: [

            Text(
              'Gender : ${isMale ? 'male' :'female'}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "result : $result",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Age : $age",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
