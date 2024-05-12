import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pacman/theme/theme_colors.dart';
import 'package:pacman/widget/my_path.dart';
import 'package:pacman/widget/my_pixel.dart';
import 'package:pacman/widget/player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberIbRow = 11;
  int numberInColum = numberIbRow*16;
  int player = numberIbRow*15+1;
  static List<int>barriers = [
    0,1,2,3,4,5,6,7,8,9,10,11,22,33,44,55,66,77,21,32,43,54,35,76,87,83,84,85,86,78,79,80,81,70,59,61,72,99,100,101,102,103,105,106,107,108,109,
    176,177,178,179,180,181,182,183,184,185,186,110,120,121,131,132,142,143,154,165,176,153,164,175,24,46,57,26,37,38,39,
    30,41,52,63,123,134,145,156,147,158,148,149,160,129,140,151,162,28,1,

  ];

  String direction = "right";
  List<int>food = [];

  void startGame(){
    getFood();
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      if(food.contains(player)){
        food.remove(player);
      }

      switch (direction){
        case "left":
          moveLeft();
          break;
        case "right":
          moveRight();
          break;
        case "up":
          moveUp();
          break;
        case "down":
          moveDown();
          break;

      }

    });
  }

  getFood(){
   for(int i = 0;i<numberInColum;i++){
     if(!barriers.contains(i)){
       food.add(i);
     }
   }
  }
  moveLeft(){

      if(!barriers.contains(player-1)){
        setState(() {
        player--;
        });
      }

  }
  moveRight(){

      if(!barriers.contains(player+1)){
        setState(() {
        player++;
        });
      }

  }
  moveUp(){

      if(!barriers.contains(player-numberIbRow)){
        setState(() {
        player-=numberIbRow;
        });
      }

  }
  moveDown(){
    if(!barriers.contains(player+numberIbRow)){
      setState(() {
        player+=numberIbRow;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:blackColor,
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: GestureDetector(
                onVerticalDragUpdate: (detail){
                  if(detail.delta.dy> 0){
                    direction ="down";
                  }else if(detail.delta.dy<0){
                    direction ="up";
                  }

                  print(direction);
                },
                onHorizontalDragUpdate: (detail){
                  if(detail.delta.dx> 0){
                    direction ="right";
                  }else if(detail.delta.dx<0){

                    direction ="left";
                  }

                  print(direction);
                },
                child: Container(
                  child: GridView.builder(
                    physics:const NeverScrollableScrollPhysics(),
                    itemCount: numberInColum,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:numberIbRow
                      ),
                      itemBuilder: (BuildContext context,int index){
                        if(player == index){
                          switch (direction){
                            case "left":
                              return Transform.rotate(angle: pi,child:Player(),);

                            case "right":
                              return Player();

                            case "up":
                              return Transform.rotate(angle: 3*pi/2,child:Player(),);

                            case "down":
                              return Transform.rotate(angle: pi/2,child:Player(),);


                          }

                        }
                        else if(barriers.contains(index)){
                        return MyPixel(
                          color: blueColor,
                          innerColor:blueColor,



                        );
                      }else {
                         if(food.contains(index)){
                           return MyPath(
                             color: blackColor,
                             innerColor:yellowColor,

                           );
                         }else{
                           return MyPath(
                             color: blackColor,
                             innerColor:blackColor,

                           );
                         }

                      }
                      }),
                ),
              )),
          Expanded(child: Container(

            child: Center(
              child:    GestureDetector(
                onTap:(){
                  startGame();
                },
                child: const Text("P L A Y",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          ))
        ],
      ),
    );
  }
}
