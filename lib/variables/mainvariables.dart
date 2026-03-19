import 'dart:math';
import 'package:flutter/material.dart';
Random random = Random();
//game
bool loaded = false;
bool shooting = false;
bool dead = false;
bool showbar = true;
bool pickhand = false;
int bullet = 0;
int red = 0;
int hand = 0;
const List<AssetImage> photos = [
  AssetImage('assets/rounds/0out6.png'),
  AssetImage('assets/rounds/1out6.png'),
  AssetImage('assets/rounds/2out6.png'),
  AssetImage('assets/rounds/3out6.png'),
  AssetImage('assets/rounds/4out6.png'),
  AssetImage('assets/rounds/death.png'),
];
const List<AssetImage> deathphotos = [
  AssetImage('assets/deathrounds/unluckybastard.png'),
  AssetImage('assets/deathrounds/2.png'),
  AssetImage('assets/deathrounds/3.png'),
  AssetImage('assets/deathrounds/4.png'),
  AssetImage('assets/deathrounds/5.png'),
  AssetImage('assets/deathrounds/death.png'),
];
const List<AssetImage> handphotos = [

];
//option
bool thrill = false;
double music = 0;
double sound = 0;
Alignment current = Alignment.bottomRight;
const List<Alignment> position = [
  Alignment.bottomLeft,
  Alignment.bottomRight,
  Alignment.topLeft,
  Alignment.topRight,
];