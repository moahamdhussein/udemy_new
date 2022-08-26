
import 'package:udemy_new/layout/news_app/cubit.dart';
import 'package:udemy_new/layout/news_app/states.dart';
import 'package:udemy_new/layout/todoApp/home_layout.dart';
import 'package:udemy_new/shared/blocObserver.dart';
import 'package:udemy_new/shared/network/local/cache_helper.dart';
import 'package:udemy_new/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';



void main() async
{

  // بيتاكد ان كل حاجة في الميثود خلصت بعد كدا ي run app
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  BlocOverrides.runZoned(() {
    DioHelper.init();
    runApp(MyApp());
    },

    blocObserver: MyBlocObserver(),
  );

}


class MyApp extends StatelessWidget
{

  MyApp();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
    //
      create: (BuildContext context ) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener:(context , state){},
        builder: (context , state) {

          return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          primarySwatch: Colors.lime,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.black,
          splashColor: Colors.cyanAccent,

          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            titleSpacing: 20.0,
          color: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,

          ),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,

          ),
          iconTheme: IconThemeData(
          color: Colors.black
          )

          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 100.0,
          selectedItemColor: Colors.deepOrangeAccent,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          ),
          textTheme: TextTheme(
          bodyText1: TextStyle(
          fontSize: 18 ,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          )

          )
          ),
          darkTheme: ThemeData(

          primarySwatch: Colors.lime,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.black,
          splashColor: Colors.cyanAccent,

          ),
          scaffoldBackgroundColor: HexColor('333739'),
          appBarTheme: AppBarTheme(
            titleSpacing: 20.0,
          color: HexColor('333739'),
          elevation: 0.0,
          titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,

          ),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,

          ),
          iconTheme: IconThemeData(
          color: Colors.white
          )

          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 100.0,
          selectedItemColor: Colors.deepOrangeAccent,
          unselectedItemColor: Colors.grey,
          backgroundColor: HexColor('333739'),

          ),
          textTheme: TextTheme(
          bodyText1: TextStyle(
          fontSize: 18 ,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          )

          ),

          ),
          themeMode: (CacheHelper.getBooleanDarkMode(key: 'isDark')==true) ?ThemeMode.dark :ThemeMode.light,
          home:Directionality(
          textDirection: TextDirection.ltr,
          child: HomeLayout()),
          );
        }
      ),
    );

  }

}

