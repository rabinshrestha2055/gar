import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({@required this.icon, @required this.onPress, @required this.iconSize});

  final IconData icon;
  final Function onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 2.0,
      onPressed: onPress,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      fillColor: Colors.orange,
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize * 0.8,
      ),
    );
  }
}