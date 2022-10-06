// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:udemy_new/modules/counter/cubit/cubit.dart';
import 'package:udemy_new/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, CounterStates state) {
          if (state is CounterInitialStates) {
            print("initial state");
          }

          if (state is CounterMinusStates) {
            // print("Minus state ${state.counter}");
          }

          if (state is CounterPlusStates) {
            // print("Plus state ${state.counter}");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).minus();
                      },
                      child: Text(
                        '-',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "${CounterCubit.get(context).counter}",
                      style: TextStyle(
                        fontSize: 69,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
