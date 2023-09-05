import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'feedback_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const String id = 'onboard-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  double scrollerPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
              PageView(
                onPageChanged: (val){
                  setState(() {
                    scrollerPosition = val.toDouble();
                  });
                },
                children: [
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Welcome  to \n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 45
                          ),
                        ),

                        const Text(
                          'SHOP|VISTA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF261B65),
                              fontSize: 35
                          ),
                        ),
                        SizedBox(
                            height: 400,
                            width: 400,
                            child: Image.asset('assets/images/choose.jpg'))
                      ],
                    ),
                  ),
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Unlock Your\n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 30
                          ),
                        ),
                        const Text(
                          'Shopping World \n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 30
                          ),
                        ),
                        SizedBox(
                            height: 250,
                            width: 250,
                            child: Image.asset('assets/images/login.jpeg')),

                      ],
                    ),
                  ),
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Plan Your \n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 30
                          ),
                        ),
                        const Text(
                          'Shopping Easily With Us.. \n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 30
                          ),
                        ),
                        SizedBox(
                            height: 300,
                            width: 300,
                            child: Image.asset('assets/images/Wishlist.jpg')),

                      ],
                    ),
                  ),

                ],
              ),

          Align(
            alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [// create button
                      TextButton(child: const Text('feedback form',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black
                        ),), onPressed: () {
                        // Navigate to the FeedbackScreen when the button is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedbackScreen(),
                          ),
                        );
                      },),
                      DotsIndicator(
                        dotsCount: 5,
                        position: scrollerPosition.round(),
                        decorator: const DotsDecorator(
                          activeColor: Colors.deepPurple,
                        ),
                      ),
                      scrollerPosition == 3? Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: ElevatedButton(
                          child: const Text('Start Shopping'),
                          onPressed: (){},
                        ),
                      ) :
                      TextButton(
                        child: const Text('SKIP TO THE APP>',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black
                        ),),
                        onPressed: (){},
                      ),
                    const SizedBox(height: 60,)
                  ],
                ),
          )
        ],
      ),
    );
  }
}

class OnBoardPage extends StatelessWidget {
  final Column? boardColumn;
  const OnBoardPage({super.key, this.boardColumn});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 155,
            decoration: const BoxDecoration(
                color: Color(0xFFFEB062),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)
              ),
            ),
          ),
        ),
        Container(
          child: Center(child: boardColumn),
        ),

      ],
    );
  }
}

