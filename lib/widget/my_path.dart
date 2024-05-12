import 'package:flutter/cupertino.dart';

class MyPath extends StatelessWidget {
  Color? color;
  Color?innerColor;
  final child;
  MyPath({super.key, this.color, this.child,this.innerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),

        ),
        child: Container(
          margin: const EdgeInsets.all(6.0),

          decoration: BoxDecoration(
            color: innerColor,
            shape: BoxShape.circle
          ),

          child: Center(
            child: child,
          ),
        )
    );
  }
}
