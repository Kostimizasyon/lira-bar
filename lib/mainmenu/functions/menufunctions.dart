import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lira_bar/game/game.dart';
import 'package:lira_bar/options/optionpage.dart';

void play(BuildContext context) {
  Navigator.of(context).
  push(
    MaterialPageRoute(builder: (context) => game())
  );
}

void options(BuildContext context) {
  Navigator.of(context).
  push(
      MaterialPageRoute(builder: (context) => optionpage())
  );
}

void quit() {
  SystemNavigator.pop();
}