import 'dart:ffi';
import 'dart:ui';

import 'package:udemy_new/shared/components/components.dart';
import 'package:udemy_new/shared/components/constants.dart';
import 'package:udemy_new/shared/cubit/cubit.dart';
import 'package:udemy_new/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newtasks;

        if (tasks.length == 0) {
          return Center(
            child: Text(
              'no new tasks',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          );
        } else {
          return ListView.separated(
              itemBuilder: (context, index) =>
                  buildTaskItem(tasks[index], context),
              separatorBuilder: (context, index) => mySeparator(),
              itemCount: tasks.length);
        }
      },
    );
  }
}
