import 'package:flutter/material.dart';
import 'package:lira_bar/liranimation/liranimation.dart';
import 'package:lira_bar/options/popupoption/popupoption.dart';
import 'package:lira_bar/options/slideroption/slideroption.dart';
import 'package:lira_bar/options/ynoption/ynoption.dart';
import '../variables/mainvariables.dart';

class optionpage extends StatefulWidget {
  const optionpage({super.key});
  @override
  State<optionpage> createState() => _optionpage();
}

class optionbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButton(),
        SizedBox(width: 20,),
        Text("Options",style: TextStyle(fontSize: 40,color: Colors.red[950]),)
      ],
    );
  }
}

class _optionpage extends State<optionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
      liranimation(),
      Center(
      child: ColoredBox(
      color: Color(0xFF111111),
      child: SizedBox(
        width: MediaQuery.of(context).size.height * 0.85,
        height: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          children: [
            optionbar(),
            SizedBox(height: 12,),
            ynoption(text: "Thriller",value: thrill,),
            slideroption(text: "Music Volume",value: music),
            slideroption(text: "App Volume",value: sound),
            popupoption(text: "Bullet Position",position: current)
          ],
        ),
       )
      )
    )
     ],)
    );
  }
}