import 'package:flutter/material.dart';
import 'package:socialite/DataList.dart';
import 'package:socialite/Feed.dart';
import 'package:socialite/FeedScreen.dart';
import 'package:flutter/services.dart';
import 'package:socialite/StatusUpdateBox.dart';
import 'dart:convert';
import 'StoryModal.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  static const platform = const MethodChannel("test_activity");
  int counter = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Socialite', style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.blue),
        actions: <Widget>[
       Stack(
          children: <Widget>[
          IconButton(
            icon: Icon(Icons.message, color: Colors.blue),
            onPressed: () {
              setState(() {
                  counter = 0;
              });
            },
          ),
            counter != 0 ? new Positioned(
              right: 11,
              top: 11,
              child: new Container(
                decoration: new BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: Text(
                  '$counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ) : new Container()
          ]
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          for(var story in DataList.getStoryList())
                            makeStory(storyImage: story.storyImage,userImage: story.userImage,userName:story.userName),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    StatusUpdateBox(),
                    SizedBox(height: 30),

                  Feed(),

                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // Drawer Navigation
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            Container(
              height: 60.0,
              child: DrawerHeader(
                  child:
                      Text('Navigation', style: TextStyle(color: Colors.black)),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(10.0)),
            ),
            new ListTile(
              leading: Icon(Icons.home, color: Colors.blue),
              title: new Text(
                "Feed",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new FeedScreen(),
                        settings: RouteSettings(arguments: DataList.getFeedList())));
              },
            ),
            new ListTile(
              leading: Icon(Icons.chat, color: Colors.blue),
              title: new Text(
                "Chats",
                style: TextStyle(fontSize: 18),
              ),
              onTap:(){
                _getNewActivity();
              }
            ),
            new ListTile(
              leading: Icon(Icons.flag, color: Colors.black),
              title: new Text(
                "Pages",
                style: TextStyle(fontSize: 18),
              ),
            ),
            new ListTile(
              leading: Icon(Icons.play_circle_fill_sharp, color: Colors.red),
              title: new Text(
                "Videos",
                style: TextStyle(fontSize: 18),
              ),
            ),
            new ListTile(
              leading: Icon(Icons.group, color: Colors.blue),
              title: new Text(
                "Groups",
                style: TextStyle(fontSize: 18),
              ),
            ),
            new ListTile(
              leading: Icon(Icons.edit, color: Colors.orange),
              title: new Text(
                "Courses",
                style: TextStyle(fontSize: 18),
              ),
            ),
            new ListTile(
              leading: Icon(Icons.info, color: Colors.red),
              title: new Text(
                "Questions",
                style: TextStyle(fontSize: 18),
              ),
            ),
            new ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.blue),
              title: new Text(
                "Jobs",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getNewActivity() async {
    try {
      StoryModal storyModal = StoryModal('http://demo.foxthemes.net/socialitehtml/assets/images/avatars/avatar-lg-1.jpg', 'http://demo.foxthemes.net/socialitehtml/assets/images/avatars/avatar-lg-3.jpg',
          'Jonathan');
      String jsonStory = jsonEncode(storyModal);
      await platform.invokeMethod('startNewActivity', {'text': jsonStory });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

}

// Story Feed
Widget makeStory({storyImage, userImage, userName}) {
  return AspectRatio(
    aspectRatio: 1.6 / 2,
    child: Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(
              storyImage,
            ),
            fit: BoxFit.cover),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.1),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                      image: NetworkImage(userImage), fit: BoxFit.cover)),
            ),
            Text(
              userName,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    ),
  );
}

// Create Feed
Widget makeFeed({userName, userImage, feedTime, feedImage}) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(userImage), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userName,
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),

                    // Row(
                    //   children: <Widget>[
                    Text(
                      feedTime,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    // IconButton(icon: Icon(Icons.group_outlined), onPressed: null)
                    //     ]
                    // ),
                  ],
                )
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                size: 30,
                color: Colors.grey[600],
              ),
              onPressed: () {},
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        feedImage != ''
            ? Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(feedImage), fit: BoxFit.cover)),
              )
            : Container(),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                createLikeIcon(),
                Transform.translate(
                    offset: Offset(-5, 0), child: createLoveIcon()),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "13",
                  style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                )
              ],
            ),
            Text(
              "24 Comments",
              style: TextStyle(fontSize: 13, color: Colors.grey[800]),
            )
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Divider(color: Colors.grey),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            makeLikeButton(isActive: true),
            makeFavouriteButton(),
            makeShareButton(),
            makeTagButton()
          ],
        ),
        Divider(color: Colors.grey),
      ],
    ),
  );
}

Widget createLikeIcon() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)),
    child: Center(
      child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
    ),
  );
}

Widget createLoveIcon() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)),
    child: Center(
      child: Icon(Icons.favorite, size: 12, color: Colors.white),
    ),
  );
}

Widget makeLikeButton({isActive}) {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.thumb_up_alt_outlined,
            color: isActive ? Colors.blue : Colors.grey,
            size: 18,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "126",
            style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
          )
        ],
      ),
    ),
  );
}

Widget makeFavouriteButton() {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.favorite_outline, color: Colors.grey, size: 18),
          SizedBox(
            width: 5,
          ),
          Text(
            "18",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    ),
  );
}

Widget makeShareButton() {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.share, color: Colors.grey, size: 18),
          SizedBox(
            width: 5,
          ),
          Text(
            "193",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    ),
  );
}

Widget makeTagButton() {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.bookmark, color: Colors.grey, size: 18),
          SizedBox(
            width: 5,
          ),
          Text(
            "13",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    ),
  );
}

// CommentCard creation
Widget makeCommentSection({userName, userImage, noOfDays, isLike, comments}) {
  return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(userImage), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userName,
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        comments,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: isLike
                                      ? Icon(Icons.thumb_up_alt_outlined,
                                          size: 15, color: Colors.blue)
                                      : Icon(Icons.favorite_outline,
                                          size: 15, color: Colors.red)),
                              TextSpan(
                                  text: isLike ? "Like" : "Love",
                                  style: isLike
                                      ? TextStyle(color: Colors.blue)
                                      : TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Reply",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width: 10),
                        Text(noOfDays, style: TextStyle(color: Colors.grey))
                      ],
                    )
                  ],
                )
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                size: 30,
                color: Colors.grey[600],
              ),
              onPressed: () {},
            )
          ],
        ),
      ]));
}


