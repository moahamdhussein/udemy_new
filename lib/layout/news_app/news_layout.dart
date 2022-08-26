
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_new/layout/news_app/states.dart';

import '../../search/search_screen.dart';
import '../../shared/components/components.dart';
import 'cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News App "),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: ()
                {
                  navigateTo(
                      context,
                      SearchScreen(),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: () {

                },
              ),

            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.blueAccent,
            height: 60,
            buttonBackgroundColor: Colors.deepOrange,
            color: cubit.isDark == true ? HexColor('333739') : Colors.white,
            animationDuration: Duration(milliseconds: 600),
            animationCurve: Curves.easeOutBack,
            // currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottmNavBar(index);
            },
            items: cubit.bottomItem,
          ),
        );
      },
    );
  }
}
