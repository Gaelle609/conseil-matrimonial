import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:christoude/config/data/description.dart';
import 'package:christoude/config/data/problem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){

        },
        label: Text("Question", style: Theme.of(context).textTheme.headlineSmall,),
        elevation: 20,
        isExtended: true,
        icon:const Icon(Icons.question_mark, size: 30,color: Colors.red,),

      ),
        body:SafeArea(
          child: SizedBox(
            height: h,
            child: Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: Image.asset("images/dispute.jpg", fit: BoxFit.cover),
                ),
                Positioned(
                    top: 90,
                    left: 70,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("I WANT", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red
                        ),),
                        const SizedBox(width: 10,),
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 43,
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText("FAMILY"),
                              RotateAnimatedText("PEACE"),
                              RotateAnimatedText("UNION"),
                              RotateAnimatedText("LIFE"),
                            ],
                          ),
                        ),

                      ],
                    )
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    height: h*.7,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0))
                    ),
                    child: ListView.builder(
                      itemCount: problem.length,
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){
                              context.push("/reader/$index");
                            },
                            child: SizedBox(
                              height: 400,
                              child: Card(
                                elevation: 12,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: Card(
                                          elevation: 10,
                                          child: Image.asset("images/violence.jpg", fit: BoxFit.cover,)),
                                    ),
                                    const SizedBox(height: 12,),
                                    Text(problem[index], style: Theme.of(context).textTheme.headlineLarge,
                                    textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 12,),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      // height: 100,
                                      // width: 400,
                                      child:description[index].length > w~/40?Text(
                                         "${description[index].substring(0,(w~/6.9))}...",
                                        style: Theme.of(context).textTheme.headlineSmall,
                                      textAlign: TextAlign.justify,
                                      ):
                                      Text(description[index],
                                      style: Theme.of(context).textTheme.headlineSmall,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text("${DateTime.now().hour}:${DateTime.now().minute}"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}
