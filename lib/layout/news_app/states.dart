abstract class NewsStates {}

class NewsIntialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessLoading extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  late final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoading extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  late final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoading extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  late final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetSearchLoading extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  late final String error;

  NewsGetSearchErrorState(this.error);
}

class NewsChangeAppModeThemToDark extends NewsStates {}

class NewsChangeAppModeThemToLight extends NewsStates {}

class NewsSwitch extends NewsStates {}
