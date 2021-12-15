import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player_pinterest/src/models/music.dart';
import 'package:music_player_pinterest/src/pages/more_information_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight:25,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.info_outline))
          ]),
      body: Stack(
        children: [
          Column(
            children: [
              _ImageBackground(size: size),
              _MorePopularMusic(size: size),
            ],
          ),
          _ButtonMoreInformation(size: size),
        ],
      ),
    );
  }
}

class _MorePopularMusic extends StatelessWidget {
  const _MorePopularMusic({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black54;
    return Container(
        width: double.infinity,
        height: size.height / 2,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return _MorePopularMusicItem(
                title: content[index].title,
                subtitle: content[index].subtitle,
                textStyleTitle: content[index].style,
                icon: content[index].icon,
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: content.length));
  }
}

class _ButtonMoreInformation extends StatelessWidget {
  const _ButtonMoreInformation({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: (size.height / 2) - 30,
        right: 0,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MoreInformationPage()));
          },
          child: BounceInDown(
            delay: Duration(milliseconds: 500),
            duration: Duration(seconds: 1),
            from: 50,
            child: Container(
              margin: EdgeInsets.only(right: 30),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Color(0Xff74A1F1),
                  borderRadius: BorderRadius.circular(60)),
              child: Icon(Icons.play_arrow, color: Colors.white),
            ),
          ),
        ));
  }
}

class _MorePopularMusicItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final textStyleTitle;

  _MorePopularMusicItem(
      {required this.title,
      required this.subtitle,
      this.icon = const SizedBox.shrink(),
      this.textStyleTitle = const TextStyle(color: Colors.black54)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textStyleTitle,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Text(subtitle,
                    style: TextStyle(
                      color: Colors.black87,
                    )),
              ),
              icon
            ],
          )
        ],
      ),
    );
  }
}

class _ImageBackground extends StatelessWidget {
  const _ImageBackground({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: size.height / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
          ),
          child: Hero(
            tag: '1',
            child: Image.asset(
              'assets/tree.jpeg',
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
