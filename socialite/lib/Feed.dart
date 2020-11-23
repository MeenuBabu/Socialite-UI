import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:socialite/CommentModal.dart';
import 'package:socialite/DataList.dart';

import 'FeedModal.dart';

class Feed extends StatefulWidget {
  const Feed({
    Key key,
  }) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    List<FeedModal> feedList = DataList.getFeedList();
    return Container(
      child: ListView.builder(
          itemCount: feedList.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: Card(
                    child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                                    image:
                                        NetworkImage(feedList[index].userImage),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                feedList[index].userName,
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),

                              // Row(
                              //   children: <Widget>[
                              Text(
                                feedList[index].feedTime,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
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
                  feedList[index].feedImage != ''
                      ? Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image:
                                      NetworkImage(feedList[index].feedImage),
                                  fit: BoxFit.cover)),
                        )
                      : feedList[index].feedText != ""
                          ? Container(
                              child: Text(
                                feedList[index].feedText,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
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
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[800]),
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
                  makeCommentSection(feedList[index].comments),
                  SizedBox(height: 8),
                  Text("View 8 more comments",
                      style: TextStyle(color: Colors.black)),
                  SizedBox(height: 10),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   children: [
                  //     Container(
                  //       width: 40,
                  //       height: 40,
                  //       decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           image: DecorationImage(
                  //               image: NetworkImage(
                  //                   'https://www.thefamouspeople.com/profiles/images/suga-1.jpg'),
                  //               fit: BoxFit.cover)),
                  //     ),
                  //     Expanded(
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //             height: 40,
                  //             margin:
                  //                 const EdgeInsets.only(left: 5.0, right: 10.0),
                  //             decoration: BoxDecoration(
                  //                 color: Colors.black12,
                  //                 borderRadius: new BorderRadius.all(
                  //                     new Radius.circular(25.7))),
                  //             child: TextField(
                  //               decoration: InputDecoration(
                  //                 border: InputBorder.none,
                  //                 fillColor: Colors.red,
                  //                 hintText: "Write your comment",
                  //               ),
                  //               style: TextStyle(
                  //                 fontSize: 15.0,
                  //                 color: const Color(0xFF000000),
                  //                 fontWeight: FontWeight.w200,
                  //                 fontFamily: "Archivo",
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            )));
          }),
    );
  }
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
Widget makeCommentSection(List<CommentModal> commentList) {
  return Container(
    child: ListView.builder(
        itemCount: commentList.length,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    NetworkImage(commentList[index].userImage),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            commentList[index].userName,
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
                              commentList[index].comments,
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
                                        child: commentList[index].isLike
                                            ? Icon(Icons.thumb_up_alt_outlined,
                                                size: 15, color: Colors.blue)
                                            : Icon(Icons.favorite_outline,
                                                size: 15, color: Colors.red)),
                                    TextSpan(
                                        text: commentList[index].isLike
                                            ? "Like"
                                            : "Love",
                                        style: commentList[index].isLike
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
                              Text(commentList[index].noOfDays,
                                  style: TextStyle(color: Colors.grey))
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
            ],
          ));
        }),
  );
}
