import 'package:flutter/material.dart';

class slideroption extends StatefulWidget {
  final String text;
  final double value;
  slideroption({required this.text,required this.value});
  @override
  State<slideroption> createState() => _slideroption();
}

class _slideroption extends State<slideroption> {
  late double currentValue;
  @override
  void initState() {
    super.initState();
    currentValue = widget.value;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.text),
        Slider(value: widget.value,
               max: 100,
               onChanged:(double value) {
                setState(() {
                  currentValue = value;
                });
               }
        )
      ],
    );
  }
}