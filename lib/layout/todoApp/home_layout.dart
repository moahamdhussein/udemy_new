// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:udemy_new/shared/components/components.dart';
import 'package:udemy_new/shared/cubit/cubit.dart';
import 'package:udemy_new/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget
{


  late Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (BuildContext context , AppStates state){
          if (state is AppInsertDatabaseState){
            Navigator.pop(context);
            titleController.clear();
            timeController.clear();
          }
        },
        builder: (BuildContext context , AppStates state){

          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'cubit.titles[cubit.currentIndex]'
              ) ,
            ),
            body: state is AppGetDatabaseLoadingState ? Center(child: CircularProgressIndicator()) :cubit.screens[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(

              onPressed: ()
              {
                if (cubit.isButtomSheetShow)
                {
                  if(formKey.currentState!.validate())
                  {
                    cubit.insertDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text,
                        context: context,
                    );
                  }
                } else
                {
                  scaffoldKey.currentState!.showBottomSheet(
                        (context)=> Container(
                      color: Colors.blue ,
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                          [
                            defaultFormField(
                                controller: titleController,
                                type: TextInputType.text,
                                validate: (String value)
                                {
                                  if(value.isEmpty){
                                    return 'title must not be empty';
                                  }
                                  return null;
                                },
                                onTab: (){},
                                onSubmit: (String value){},
                                onChange: (String value){},
                                label: 'Tasks Title',
                                prefix: Icons.title
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                              controller: timeController,
                              type: TextInputType.datetime,
                              onTab: ()
                              {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  timeController.text = value!.format(context).toString();
                                });
                              },
                              validate: (String value)
                              {
                                if(value.isEmpty){
                                  return 'time must not be empty';
                                }
                                return null;
                              },
                              onSubmit: (String value){},
                              onChange: (String value){},
                              label: 'Tasks time',
                              prefix: Icons.watch_later_outlined,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                              controller: dateController,
                              type: TextInputType.datetime,
                              onTab: ()
                              {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2030-12-30')
                                ).then((value)
                                {

                                  dateController.text =DateFormat.yMMMd().format(value!);

                                });
                              },
                              validate: (String value)
                              {
                                if(value.isEmpty){
                                  return 'date must not be empty';
                                }
                                return null;
                              },
                              onSubmit: (String value){},
                              onChange: (String value){},
                              label: 'Tasks date',
                              prefix: Icons.calendar_today_rounded,
                            ),

                          ],
                        ),
                      ),
                    ),
                    elevation: 15.0,
                  ).closed.then((value) {
                    cubit.changeBottomShown(
                        isShow: false,
                        icon: Icons.edit
                    );
                  });
                  cubit.changeBottomShown(
                      isShow: true,
                      icon:  Icons.add);
                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: "Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: "Done",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: "Archived",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

