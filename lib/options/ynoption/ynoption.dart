import 'package:flutter/material.dart';

class ynoption extends StatefulWidget {
  final String text;
  final bool value;
  ynoption({required this.text,required this.value});
  @override
  _ynoptionState createState() => _ynoptionState();
}

class _ynoptionState extends State<ynoption> {
  late bool currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.value;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: currentValue,
          onChanged: (bool? newValue) {
            setState(() {
              currentValue = newValue!;
            });
          },
        ),
        Text(
          widget.text,
          style: TextStyle(color: Colors.red, fontSize: 30),
        ),
      ],
    );
  }
}
