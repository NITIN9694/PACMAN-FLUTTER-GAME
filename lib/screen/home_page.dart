import 'package:flutter/material.dart';
import 'package:pacman/theme/theme_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberIbRow = 11;
  int numberInColum = numberIbRow*16;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                child: GridView.builder(
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: numberInColum,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:numberIbRow
                    ),
                    itemBuilder: (BuildContext context,int index){
                    return Container(
                      margin: EdgeInsets.all(1.0),
                      color: Colors.grey,
                    );
                    }),
              )),
          Expanded(child: Container(

            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Score:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                ),
                Text("P L A Y",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
