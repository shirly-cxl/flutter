import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';

//音频
class AudioPage extends StatefulWidget {
  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  double value=0.0;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration _duration;
  double totalLength = 0.0;
  double currentLength = 0.0;
  double a;
  StreamSubscription _durationSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _durationSubscription =
    audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
      totalLength = _duration?.inSeconds.toDouble();
      print("sssssssssssss$duration");
    });
    audioPlayer.onAudioPositionChanged.listen((p) async {
      // p参数可以获取当前进度，也是可以调整的，比如p.inMilliseconds
      currentLength = p.inSeconds.toDouble();
      print(p.inSeconds);
      print('ccccccuuuu$currentLength');
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavigationBar(
        title: '音频',
      ),
      body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: ()=>play(),
                    child: Icon(Icons.play_circle_outline),
                  ),
//进度条
                  Builder(
                    builder: (c){
                      return Slider(
                        max: totalLength,
//                min: 0.0
                        onChanged: (v) {
                          print('vvvvvvvvvvvvvvvvvv$v');
                          print('maxmaxmaxmax${totalLength}');
                          currentLength = v ;
                          a = v;
                          print('aaaaaaaaah$a');
                          audioPlayer
                              .seek(Duration(seconds: a==null?currentLength.round():a.toInt()));
                        },
                        value: a == null?currentLength:a,
                      );
                    },
                  ),
                  InkWell(
                    onTap: ()=> pause(),
                    child: Icon(Icons.pause_circle_outline),
                  )
                ],
              ),
            ),
        HorizontalLine(
          height: 8,
          color: Colors.grey[200],
        ),
       Container(
          color:  Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('竞猜选项',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff212121),
                      ),),
                    Text('644人参与',style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffBFBFBF),
                    ),),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 9),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                child: Row(
                  children: <Widget>[
                    Text('支持',style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff595959),
                    ),),
                    Spacer(),
                    Text('365票',style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff8C8C8C),
                    ),),
                    Space(width: 24,),
                    Text('56.7%',style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff8C8C8C),
                    ),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                child: Row(
                  children: <Widget>[
                    Text('反对',style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff595959),
                    ),),
                    Spacer(),
                    Text('279票',style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff8C8C8C),
                    ),),
                    Space(width: 24,),
                    Text('43.7%',style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff8C8C8C),
                    ),),
                  ],
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                color: Color.fromRGBO(191,191,191,1),
                child: Text('参与',style: TextStyle(color: Colors.white,fontSize: 14),),
                onPressed: (){},
              ),
              Row(
                children: <Widget>[
                  Space(),
                  Text('CupertinoSlider',style: TextStyle(color: Colors.black,fontSize: 14),),
                  CupertinoSlider(
                    value: value,
                    onChanged: (v){
                     setState(() {
                       value=v;
                     });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  play() async {
//    int result = await audioPlayer.play("http://sq.sycdn.kuwo.cn/7d3f594e51eef70de9540a8ca4b168f0/5eec79a2/resource/n1/24/87/383711329.mp3");
    int result=await audioPlayer.play('https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3');
    if (result == 1) {
      print('play success');
    } else {
      print('play failed');
    }
  }
  //结束
  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print('pause success');
    } else {
      print('pause failed');
    }
  }

  @override
  void deactivate() async{
    print('结束');
//    int result = await audioPlayer.release();
//    if (result == 1) {
//      print('release success');
//    } else {
//      print('release failed');
//    }
    super.deactivate();
  }
  @override
  void dispose() {
    audioPlayer.dispose();
    _durationSubscription?.cancel();
    super.dispose();
  }
}

