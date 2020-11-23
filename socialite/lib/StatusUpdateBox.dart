import 'package:flutter/material.dart';

class StatusUpdateBox extends StatefulWidget {
  const StatusUpdateBox({
    Key key,
  }) : super(key: key);

  @override
  _StatusUpdateBoxState createState() => _StatusUpdateBoxState();
}

class _StatusUpdateBoxState extends State<StatusUpdateBox> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1.0,
              )
            ],
          ),
          height: 135.0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.thefamouspeople.com/profiles/images/suga-1.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(25.7))),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.red,
                            hintText: "What's on Your Mind ? Hamsel!",
                          ),
                          style: TextStyle(
                            fontSize: 15.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Archivo",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Divider(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.photo, color: Colors.blue),
                            onPressed: () {},
                          ),
                          Text("Photo/Video")
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.emoji_emotions_rounded,
                                color: Colors.yellow),
                            onPressed: () {},
                          ),
                          Text("Feeling/Activity")
                        ],
                      )
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}