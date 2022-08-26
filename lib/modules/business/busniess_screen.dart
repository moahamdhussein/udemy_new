import 'package:udemy_new/layout/news_app/cubit.dart';
import 'package:udemy_new/layout/news_app/states.dart';
import 'package:udemy_new/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     return BlocConsumer<NewsCubit , NewsStates>(
       listener: (context , state){},
       builder: (context , state){
         var list = NewsCubit.get(context).business;

         return condition(list , context);
       },
     );

  }
}