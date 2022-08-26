// ignore_for_file: prefer_const_constructors, invalid_required_named_param, void_checks


import 'dart:ui';

import 'package:udemy_new/layout/news_app/cubit.dart';
import 'package:udemy_new/modules/web_view/web_view_screen.dart';
import 'package:udemy_new/shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 10,
  double height = 40,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  Function? onTab,
  Color? colors,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable =true,
}) =>
    TextFormField(
      controller: controller,
      style: TextStyle(color: colors),
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (String value)  => onSubmit!(value),
      onChanged: (String value) => onChange!(value),
      validator: (String? value) => validate(value) ,
      onTap: () =>  onTab!(),
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
            prefix
        ),


        suffixIcon: suffix !=null ? IconButton(
          onPressed:(){
            suffixPressed!();
          } ,
          icon:
          Icon(
              suffix
          ),
        ) : null,

        border: OutlineInputBorder(),
      ),
    );
Widget buildTaskItem(Map model , context) =>Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row
      (
      children:
      [
        CircleAvatar(
          radius: 40.0,
          child: Text(
            '${model['time']}'
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize:  MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${model['date']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateData(
                status: "done",
                id: model['id'],
              );
            },
            icon: Icon
              (
              Icons.check_box,
              color: Colors.green,
            )
        ),
        IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateData(
                status: "archived",
                id: model['id'],
              );
            },
            icon:
            Icon
              (
              Icons.archive,
              color: Colors.black45,
            )
        ),

      ],

    ),

  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id: model['id']);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
           ' deleted item where title is : ${model['title']}',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 15,
            ),
          ),
        )
    );
  },
  background: Container(color: Colors.indigoAccent),
  
);

 checkUrl( url ){
  if( url != null){
    return url;
  }
  return 'https://lightwidget.com/wp-content/uploads/local-file-not-found-480x488.png';

}

Widget buildArticleItem(article , context) => InkWell(
  onTap: (){
    navigateTo(
      context,
      WebViewScreen(article['url']),
    );
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          width: 120,
  
          height: 120,
  
          decoration: BoxDecoration(
  
              borderRadius: BorderRadius.circular(10.0),
  
              image: DecorationImage(
  
                image: NetworkImage(
  
                 '${checkUrl(article['urlToImage'])}'
  
                ),
  
                fit: BoxFit.cover,
  
              )),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        Expanded(
  
          child: Container(
  
            height: 120,
  
            child: Column(
  
  
  
              crossAxisAlignment: CrossAxisAlignment.start ,
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              children: [
  
                Expanded(
  
                  child: Text(
  
                    "${article['title']}",
  
                    style:Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 3,
  
                    overflow: TextOverflow.ellipsis,
  
                  ),
  
  
  
                ),
  
                Text(
  
                  "${article['publishedAt']}",
  
                  style: TextStyle(color: Colors.grey),
  
                )
  
              ],
  
            ),
  
          ),
  
        )
  
      ],
  
    ),
  
  ),
);

Widget mySeparator() => Container(
  width: double.infinity,
  height: 1,
  color: Colors.blueAccent,
);
Widget condition(var list , context , {isSearch = false}){
  if(list.isEmpty)
  {
    return isSearch ? Container(child: Center(child: Text('please write something to search ' , style:  TextStyle(fontSize: 21 , color: Colors.white),),),) : Center(child: CircularProgressIndicator());
  }
  else {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context , index)
        {
          return buildArticleItem(list[index],context);
        },
        separatorBuilder: (context , index)
        {
          return mySeparator();
        },
        itemCount:list.length);
  }
}
void navigateTo(context , widget){
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}


