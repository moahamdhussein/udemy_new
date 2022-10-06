import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_new/layout/news_app/states.dart';
import 'package:udemy_new/modules/business/busniess_screen.dart';
import 'package:udemy_new/modules/science/science_screen.dart';
import 'package:udemy_new/modules/settings_screen/settings_screen.dart';
import 'package:udemy_new/modules/sports/sprots_screen.dart';
import 'package:udemy_new/shared/network/local/cache_helper.dart';
import 'package:udemy_new/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomItem = [
    Icon(
      Icons.business,
    ),
    Icon(
      Icons.sports,
    ),
    Icon(
      Icons.science,
    ),
    Icon(
      Icons.settings,
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen(),
  ];

  void changeBottmNavBar(int index) {
    emit(NewsBottomNavState());
    currentIndex = index;
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoading());
    DioHelper.getDtat(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '788669a2636e4ad180009c2a18c3f7be'
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoading());

    if (sports.length == 0) {
      DioHelper.getDtat(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '788669a2636e4ad180009c2a18c3f7be'
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoading());
    DioHelper.getDtat(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '788669a2636e4ad180009c2a18c3f7be'
      },
    ).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String values) {
    emit(NewsGetSearchLoading());

    DioHelper.getDtat(
      url: 'v2/everything',
      query: {
        'q': '$values',
        'apiKey': '788669a2636e4ad180009c2a18c3f7be',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  bool? isDark = CacheHelper.getBooleanDarkMode(key: 'isDark');

  void changeAppModeToDark() {
    isDark = true;
    CacheHelper.putData(key: 'isDark', value: isDark!)
        .then((value) => emit(NewsChangeAppModeThemToDark()));
  }

  void changeAppModeToLight() {
    isDark = false;
    CacheHelper.putData(key: 'isDark', value: isDark!)
        .then((value) => emit(NewsChangeAppModeThemToLight()));
  }

  bool isEnglish = true;

  void changeLanguage() {
    isEnglish = !isEnglish;
    print(isEnglish);
    emit(NewsSwitch());
  }
}
