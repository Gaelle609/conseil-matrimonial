import 'package:christoude/config/data/description.dart';
import 'package:christoude/config/data/problem.dart';
import 'package:christoude/config/data/solution.dart';
import 'package:flutter/material.dart';

class ReaderPage extends StatelessWidget {
  ReaderPage({super.key, required this.index});
  var index;
  
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Image.asset("images/violence.jpg",),
              ),
              Container(
                // height: h*.8,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 24, left: 10, right: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      child: Text(problem[int.parse(index)],
                      style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Container(
                      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 30),
                      child: Text("\t${description[int.parse(index)]}", style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      child: Text("Solution", style: Theme.of(context).textTheme.headlineLarge,textAlign: TextAlign.center,),
                    ),
                    const SizedBox(height: 23,),
                    Container(
                      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 30),
                      child: Text("\t${solution[int.parse(index)]}",
                      style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
