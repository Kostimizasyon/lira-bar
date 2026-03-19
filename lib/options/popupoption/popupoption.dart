import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../variables/mainvariables.dart';


class popupoption extends StatefulWidget {
  final String text;
  final Alignment position;
  popupoption({required this.text,required this.position});
  @override
  State<popupoption> createState() => _popupoption();
}

class _popupoption extends State<popupoption> {
  late Alignment currentValue;
  @override
  void initState() {
    super.initState();
    currentValue = widget.position;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Text(widget.text, style: GoogleFonts.amarante(fontSize: 32, color: Color(0xFF2A3439))),
        PopupMenuButton<int>(
          itemBuilder: (context) {
            return <PopupMenuEntry<int>>[
              PopupMenuItem(child: ListTile(
                title: Text("Bottom Left",),
                splashColor: Colors.transparent,
                onTap: () => {
                  currentValue = position[0]
                },
              )),
              PopupMenuItem(child: ListTile(
                title: Text("Bottom Right",),
                splashColor: Colors.transparent,
                onTap: () => {
                  currentValue = position[1]
                },
              )),
              PopupMenuItem(child: ListTile(
                title: Text("Top Left",),
                splashColor: Colors.transparent,
                onTap: () => {
                  currentValue = position[2]
                },
              )),
              PopupMenuItem(child: ListTile(
                title: Text("Top Right",),
                splashColor: Colors.transparent,
                onTap: () => {
                  currentValue = position[3]
                },
              )),
            ];
          },
        )
    ]);
  }
}