import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lira_bar/liranimation/liranimation.dart';
import 'package:lira_bar/mainmenu/functions/menufunctions.dart';
import 'package:google_fonts/google_fonts.dart';

class selection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: () => play(context), style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory, overlayColor: Colors.transparent), child: Text("Play", style: GoogleFonts.amarante(fontSize: 32, color: Color(0xFF2A3439)))),
        TextButton(onPressed: () => options(context), style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory, overlayColor: Colors.transparent), child: Text("Options", style: GoogleFonts.amarante(fontSize: 32, color: Color(0xFF2A3439)))),
        TextButton(onPressed: quit, style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory, overlayColor: Colors.transparent), child: Text("Quit", style: GoogleFonts.amarante(fontSize: 32, color: Color(0xFF2A3439))))
      ],
    );
  }
}

class mainmenu extends StatefulWidget {
  const mainmenu({super.key});
  @override
  State<mainmenu> createState() => _mainmenu();
}

class _mainmenu extends State<mainmenu> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          liranimation(),
          Center(
            child: ColoredBox(
                color: Color(0xFF111111),
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.70,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    spacing: BorderSide.strokeAlignCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text("Lira's Bar", style: GoogleFonts.aubrey(fontSize: 80, color: Color(0xFF800000),),),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: selection(),
                      ),
                      Spacer()
                    ],
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}