import 'package:udemy_new/layout/news_app/cubit.dart';
import 'package:udemy_new/layout/news_app/states.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class SettingScreen extends StatelessWidget {


  bool isSwitched = false;
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state){},
      builder: (context , state) {
        var cubit =  NewsCubit.get(context);

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Welcome',
                        textStyle: TextStyle(
                            fontSize: 35 ,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey

                        )
                    ),
                    TyperAnimatedText('In My',
                        textStyle: TextStyle(
                            fontSize: 35 ,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan

                        )
                    ),
                    TyperAnimatedText('First',
                        textStyle: TextStyle(
                            fontSize: 35 ,
                            fontWeight: FontWeight.bold,
                            color: Colors.green

                        )
                    ),
                    TyperAnimatedText('Project',
                        textStyle: TextStyle(
                            fontSize: 35 ,
                            fontWeight: FontWeight.bold,
                            color: Colors.green

                        )
                    ),
                    TyperAnimatedText('Welcome in my first Project',
                        textStyle: TextStyle(
                            fontSize: 26 ,
                            fontWeight: FontWeight.bold,
                            color: Colors.green

                        )
                    ),
                  ],
                  totalRepeatCount: 1,
                  repeatForever: false,
                  pause: Duration(milliseconds: 600),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedToggleSwitch<bool>.dual(
                      current: cubit.isDark == false ? false : true,
                      first: false,
                      second: true,
                      dif: 50.0,
                      borderColor: Colors.tealAccent,
                      borderWidth: 5.0,
                      height: 55,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                      onChanged: (value){
                        if(value == false){
                          cubit.changeAppModeToLight();
                        }else if(value == true){
                          cubit.changeAppModeToDark();
                        }
                      },
                      colorBuilder: (b) => b ? Colors.red : Colors.green,
                      iconBuilder: (value) => value
                          ? Icon(Icons.dark_mode)
                          : Icon(Icons.light_mode),
                      textBuilder: (value) => value
                          ? Center(child: Text(
                          'Dark Mode',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: cubit.isDark == true ?Colors.white :Colors.black87
                        ),
                      )
                      )
                          : Center(child: Text(
                        'Light Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: cubit.isDark == true ?Colors.white :Colors.black87
                          ),

                      )
                      ),
                    ),


                 ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedToggleSwitch<bool>.dual(
                      current: cubit.isEnglish ,
                      first: false,
                      second: true,
                      dif: 50.0,
                      borderColor: Colors.tealAccent,
                      borderWidth: 5.0,
                      height: 55,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                      onChanged: (value){
                        cubit.changeLanguage();
                      },
                      colorBuilder: (b) => b ? Colors.red : Colors.green,
                      iconBuilder: (value) => value
                          ? Icon(Icons.dark_mode)
                          : Icon(Icons.light_mode),
                      textBuilder: (value) => value
                          ? Center(child: Text(
                        'English',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: cubit.isDark == true ?Colors.white :Colors.black87
                        ),
                      )
                      )
                          : Center(child: Text(
                        'العربية',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: cubit.isDark == true ?Colors.white :Colors.black87
                        ),

                      )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

