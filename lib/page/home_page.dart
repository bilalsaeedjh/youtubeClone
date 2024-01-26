import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:line_icons/line_icons.dart';
import 'package:youtubeClone/json/home_video.dart';
import 'package:youtubeClone/page/video_detail.dart';
import 'package:youtubeClone/theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List myVideos = [];
  getObjectsFromJson(){
    for(int i=0;i<home_video.length;i++){
      VideoInfo myObject = VideoInfo.fromJson(home_video[i]);
      myVideos.add(myObject);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getObjectsFromJson();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1b1c1e),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset(
                "assets/images/youtube.svg",
                width: 35,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        LineIcons.video,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(LineIcons.search, color: Colors.white),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(LineIcons.bell, color: Colors.white),
                      onPressed: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://yt3.ggpht.com/ytc/AAUvwnjvPbxYoEs-_5_R5qmeZoMmubWmVGtSMOD0l-7XgA=s88-c-k-c0x00ffffff-no-rj"),
                            fit: BoxFit.cover)),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "Recommended",
            style: TextStyle(
                color: white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 1000,
          child: ListView.builder(
              itemCount: myVideos.length,
              itemBuilder: (context,i){
                return   Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => VideoDetailPage(
                                      title: myVideos[i].title,
                                      viewCount: myVideos[i].viewCount,
                                      username: myVideos[i].username,
                                      profile: myVideos[i].profileImg,
                                      thumbnail: myVideos[i].thumbnailImg,
                                      dayAgo: myVideos[i].dayAgo,
                                      subscribeCount: myVideos[i].subscriberCount,
                                      likeCount: myVideos[i].likeCount,
                                      unlikeCount: myVideos[i].unlikeCount,
                                      videoUrl:myVideos[i].videoUrl
                                  )));
                        },
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(myVideos[i].thumbnailImg),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        myVideos[i].profileImg),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: size.width - 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  myVideos[i].title,
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: size.width - 120,
                                      child: Text(
                                        myVideos[i].username+
                                            " - " +
                                            myVideos[i].dayAgo +
                                            " - " +
                                            myVideos[i].viewCount,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: white.withOpacity(0.4),
                                            fontSize: 12,
                                            height: 1.5),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Icon(
                            LineIcons.ello,
                            color: white.withOpacity(0.4),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
        )

      ],
    );
  }
}
