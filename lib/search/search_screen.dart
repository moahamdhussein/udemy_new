import 'package:udemy_new/layout/news_app/cubit.dart';
import 'package:udemy_new/layout/news_app/states.dart';
import 'package:udemy_new/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit , NewsStates>
      (
      listener: (context , state){},
      builder: (context , state){
        List<dynamic> list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Search Screen',
              style:TextStyle(
                color: Colors.blueAccent,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  colors: Colors.white,
                  type: TextInputType.text,
                  onSubmit: ( value){},
                  onTab: (value){},
                  onChange: (String value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value)
                  {

                    if(value.isEmpty)
                    {
                      return 'search must not be empty' ;
                    }
                    return null;

                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(child:
              condition(list, context  , isSearch: true)
              ),

            ],
          ) ,
        );
      },
    );
  }
}
