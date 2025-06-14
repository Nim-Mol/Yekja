// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Swipablewidget extends StatefulWidget {
  const Swipablewidget({
    super.key,
    this.width,
    this.height,
    this.action,
  });

  final double? width;
  final double? height;
  final Future Function()? action;

  @override
  State<Swipablewidget> createState() => _SwipablewidgetState();
}

class _SwipablewidgetState extends State<Swipablewidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
