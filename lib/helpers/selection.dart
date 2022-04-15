import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  bool isSelected = false;
  final String text;
  final String avatarText;
  SelectButton({Key? key, required this.text, required this.avatarText}) : super(key: key);

  @override
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: InputChip(
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(widget.avatarText),
        ),
        label: Text(widget.text.toUpperCase()),
        onSelected: (selected) {
          setState(() {
            widget.isSelected = selected;
          });
        },
        selectedColor: Colors.green,
        selected: widget.isSelected,
      ),
    );
  }
}