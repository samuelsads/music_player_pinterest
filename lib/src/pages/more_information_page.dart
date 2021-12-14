import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoreInformationPage extends StatelessWidget {
  const MoreInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.info_outline))
          ]),
      body: Stack(
        children: [
          _ImageBackground(size: size),
          Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              margin: EdgeInsets.only(top: size.height * 0.18),
              child: Column(
                children: [
                  _ImageCenter(),
                  _MusicInformation(),
                ],
              )),
        ],
      ),
    );
  }
}

class _MusicInformation extends StatelessWidget {
  const _MusicInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 2, width: double.infinity, color: Colors.black45),
              Container(
                  height: 2, width: size.width * 0.4, color: Color(0Xff74A1F1)),
            ],
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2.00'),
                Text('4.40'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Text('One last time',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
          ),
          Container(
              margin: EdgeInsets.only(top: 15),
              child: Text('Ariana Grande',
                  style: TextStyle(color: Colors.black54, fontSize: 20))),
          _ButtonsMusic(),
          Container(
            height: 20,
            child: Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 2,
                    width: double.infinity,
                    color: Colors.black45),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 2,
                    width: size.width * 0.4,
                    color: Colors.black),
                Positioned(
                    right: size.width * 0.45,
                    child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonsMusic extends StatelessWidget {
  const _ButtonsMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      width: double.infinity,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.fast_rewind),
          //Icon(Icons.volume_down),
          Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  border: Border.all(color: Colors.black54)),
              child: Icon(Icons.play_arrow)),
          //Icon(Icons.volume_up),
          Icon(Icons.fast_forward)
        ],
      ),
    );
  }
}

class _ImageCenter extends StatelessWidget {
  const _ImageCenter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.all(60),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Hero(
          tag: '1',
          child: Image.asset(
            'assets/tree.jpeg',
            fit: BoxFit.fill,
          ),
        ),
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
      height: size.height * 0.30,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new ExactAssetImage('assets/tree.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    );
  }
}
