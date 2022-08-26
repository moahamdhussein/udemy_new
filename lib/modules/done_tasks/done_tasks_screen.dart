import 'package:udemy_new/shared/components/components.dart';
import 'package:udemy_new/shared/cubit/cubit.dart';
import 'package:udemy_new/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return BlocConsumer<AppCubit ,AppStates>(
      listener: (context , state) {},
      builder: (context , state)
      {
        var tasks  = AppCubit.get(context).donetasks;
        if (tasks.length == 0) {
          return Center(child: Text(
            'no done tasks',
            style: TextStyle(
              fontSize: 30 ,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          );
        }
        else {
          return ListView.separated(
              itemBuilder: (context,index) => buildTaskItem(tasks[index] ,context),
              separatorBuilder: (context,index) => Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20.0,
                ),
                child: Container
                  (
                  width: double.infinity,
                  height: 1,
                  color: Colors.deepOrange,
                ),
              ),
              itemCount: tasks.length
          );
        }
      },
    );
  }
}
