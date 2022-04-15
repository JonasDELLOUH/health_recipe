import 'package:flutter/material.dart';
import 'package:health_recipe/helpers/selection.dart';

class Parameter extends StatefulWidget {
  final String typeParameter;
  final List<SelectButton> choices;
  const Parameter({Key? key, required this.typeParameter, required this.choices}) : super(key: key);

  @override
  _ParameterState createState() => _ParameterState();
}

class _ParameterState extends State<Parameter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.choices,
      ),
    );
  }
}
