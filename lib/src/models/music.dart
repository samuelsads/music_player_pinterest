

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color color = Colors.black54;
List<Music> content =[
  Music(title: 'Popular', subtitle: 'show all', style:TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
  Music(title: 'No tears left to cry', subtitle: '6:30', icon: FaIcon(FontAwesomeIcons.ellipsisH, color: color)),
  Music(title: 'Imagine', subtitle: '3:20', icon: FaIcon(FontAwesomeIcons.ellipsisH, color: color)),
  Music(title: 'Into you', subtitle: '4:17', icon: FaIcon(FontAwesomeIcons.ellipsisH, color: color)),
  Music(title: 'One last time', subtitle: '4:40', icon: FaIcon(FontAwesomeIcons.ellipsisH, color: color)),
];


class Music{
  String title;
  String subtitle;
  Widget icon;
  TextStyle style;

  Music({required this.title, required this.subtitle,  this.icon=const SizedBox.shrink(), this.style= const TextStyle(color: Colors.black54)});
}