import 'package:flutter/material.dart';
import 'package:socialite/FeedModal.dart';
import 'package:socialite/ProfileModal.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<FeedModal> feedList = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Feed', style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.blue),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.message, color: Colors.blue),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.blue),
              onPressed: () {},
            ),
            Container(
              width: 25,
              height: 25,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.thefamouspeople.com/profiles/images/suga-1.jpg'),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(

            child: ListView.builder(
                itemCount: feedList.length,
                itemBuilder: (BuildContext context, int position) {
                  var feed = feedList[position];
                  print(feed);
                  return Card(margin: EdgeInsets.fromLTRB(8, 4, 8, 4),child: ListTile(leading:Image.network(feed.feedImage),title: Text(feed.userName)));
                })
            // profileModal.profilePic != ''
            //     ? Container(
            //   height: 200,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       image: DecorationImage(
            //           image: NetworkImage(profileModal.profilePic), fit: BoxFit.cover)),
            // )
            //     : Container(),
            // SizedBox(height: 10),
            // Text(profileModal.userName, style: TextStyle(color: Colors.black),)
            ),

          ],
        ));
  }
}

