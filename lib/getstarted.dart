import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class getStarted extends StatelessWidget {
  final List<String> imagesList = [
    'assets/image/food1.jpg',
    'assets/image/food2.jpg',
    'assets/image/food3.jpg',
    'assets/image/food4.jpg',
    'assets/image/food5.jpg',
    'assets/image/food6.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(

        body: Column(
          children: [
            Stack(
              children: [
                Center(

                  child: CarouselSlider(

                    options: CarouselOptions(
                      height: height,
                      autoPlay: true,
                    ),
                    items: imagesList
                        .map(
                          (item) => Container(
                        child: Center(
                          child: Image.asset(

                            item,
                            fit: BoxFit.cover,
                            height: height,
                          ),
                        ),
                      ),

                    )
                        .toList(),

                  ),

                ),
                Center(
                    child: Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.8),
                      child: FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          Navigator.pushNamed(context, "/splashscreen");
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage('assets/image/next.png')
                              )
                          ),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    )
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 20.0, height: 300.0),
                    const Text(
                      'He',
                      style: TextStyle(fontSize: 60.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20.0, height: 100.0),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Poppins',
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText('AWESOME'),
                          RotateAnimatedText('OPTIMISTIC'),
                          RotateAnimatedText('DIFFERENT'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),

          ],
        )

    );
  }
}