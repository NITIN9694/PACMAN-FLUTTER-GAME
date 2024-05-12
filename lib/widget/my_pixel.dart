import 'package:flutter/cupertino.dart';

class MyPixel extends StatelessWidget {
  Color? color;
  Color?innerColor;
  final child;
   MyPixel({super.key, this.color, this.child,this.innerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),

      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),

        child: Container(
          margin: EdgeInsets.all(2.0),
          color: innerColor,
          child: Center(
            child: child,
          ),
        ),
      )
    );
  }
}
