import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:total/util/tools.dart';

class SwiperPage extends StatefulWidget {
  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  List bannerList=[];
  @override
  Widget build(BuildContext context) {
    double _banHeight = (winWidth(context) - 32) * 0.52;
    return Scaffold(
      appBar: new NavigationBar(
        title: '轮播图',
        mainColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: _banHeight + 30,
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 114,
                  color: ThemeColors.color333,
                ),
                Container(
                  height: _banHeight + 18,
                  width: winWidth(context),
                  margin: EdgeInsets.only(top: 16),
                  child: Swiper(
                    itemCount:  bannerList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 18),
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color: ThemeColors.color333,
                              blurRadius: 20,
                              offset: Offset(0, -30),
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: listNoEmpty(bannerList)
                              ? CachedNetworkImage(
                            imageUrl: bannerList[index].contentUrl,
                            fit: BoxFit.cover,
                          )
                              : Image.asset(
                            bannerList[index].contentUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    onTap: (index) {
                    },
                    pagination: SwiperPagination(
                      margin: EdgeInsets.only(top: 10),
                      builder: DotSwiperPaginationBuilder(
                        space: 2,
                        size: 6,
                        color: Color(0xff797979),
                        activeSize: 6,
                        activeColor: Color(0xFFC1994E),
                      ),
                    ),
                    autoplayDisableOnInteraction: true,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
