import 'package:flutter/cupertino.dart';
import 'package:pacman/theme/image_path.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(2),
      child: Image.asset(ImagePath.pacman),
    );
  }
}
