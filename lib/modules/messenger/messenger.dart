// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messenger_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.fcai19-5.fna.fbcdn.net/v/t1.6435-9/243949318_1774706859393648_7838385039191473053_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHh7j7zraZO5D7pyrUZBXre0mXUgrl6DhrSZdSCuXoOGlN15-MHvTAtHGDKq13kOWdkJNh3vbkt8skUnthSLMwQ&_nc_ohc=B7v15dj0VggAX-7vJY5&_nc_ht=scontent.fcai19-5.fna&oh=c523c7bd56854fdad10dbce666dd6c10&oe=619D3332'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "chats",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              onPressed: () {}),
          IconButton(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // for search bar
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('search'),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // list view for story items
              Container(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  itemCount: 50,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // list view for chats
              ListView.separated(
                  physics:
                      NeverScrollableScrollPhysics(), // to make list view do not scroll
                  shrinkWrap: true,
                  itemBuilder: (context, index) => builChatItem(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.0,
                      ),
                  itemCount: 150),
            ],
          ),
        ),
      ),
    );
  }

  Widget builChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 28.0,
                backgroundImage: NetworkImage(
                    'https://scontent.fcai19-5.fna.fbcdn.net/v/t1.6435-9/243949318_1774706859393648_7838385039191473053_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHh7j7zraZO5D7pyrUZBXre0mXUgrl6DhrSZdSCuXoOGlN15-MHvTAtHGDKq13kOWdkJNh3vbkt8skUnthSLMwQ&_nc_ohc=B7v15dj0VggAX-7vJY5&_nc_ht=scontent.fcai19-5.fna&oh=c523c7bd56854fdad10dbce666dd6c10&oe=619D3332'),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'لا تسوي نفسك مثقف يا ال طعمية',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'صباح الورد شعرك طبيعي ولل فرد ',
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      '22/10/2003',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget buildStoryItem() => Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 28.0,
                  backgroundImage: NetworkImage(
                      'https://scontent.fcai19-5.fna.fbcdn.net/v/t1.6435-9/243949318_1774706859393648_7838385039191473053_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHh7j7zraZO5D7pyrUZBXre0mXUgrl6DhrSZdSCuXoOGlN15-MHvTAtHGDKq13kOWdkJNh3vbkt8skUnthSLMwQ&_nc_ohc=B7v15dj0VggAX-7vJY5&_nc_ht=scontent.fcai19-5.fna&oh=c523c7bd56854fdad10dbce666dd6c10&oe=619D3332'),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 3.0,
                    end: 3.0,
                  ),
                  child: CircleAvatar(
                    radius: 7.0,
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'mohamed hussein ',
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
