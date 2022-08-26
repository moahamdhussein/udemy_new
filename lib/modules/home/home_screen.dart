// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black87,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            onPressed: () {
              print("say hi");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print(20 * 10);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.access_time,
            ),
            onPressed: () {
              print(TimeOfDay.now());
            },
          ),
        ],
      ),
      body: Column(
          children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(20)

              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  image: NetworkImage(
                      'https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_FMjpg_UX1000_.jpg'),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.45),

                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ) ,
                  child: Text(
                    'GOT',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
