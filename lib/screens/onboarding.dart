import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/screens/register.dart';
import 'package:task1/widgets/componants.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final pageController = PageController();
  final List<PageViewModel> pages = [
    PageViewModel(
        'assets/images/take_away1.png',
        'Get food delivery to your doorstep asap',
        'we have young and professional delivery team that will bring your food as soon as possible to your doorstep'),
    PageViewModel(
        'assets/images/take_away2.png',
        'Get food delivery to your doorstep asap',
        'we have young and professional delivery team that will bring your food as soon as possible to your doorstep'),
    PageViewModel(
        'assets/images/take_away3.png',
        'Get food delivery to your doorstep asap',
        'we have young and professional delivery team that will bring your food as soon as possible to your doorstep'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  MyButton(
                    onClick: () {
                      navigateTo(context, RegisterScreen());
                    },
                    text: 'Skip',
                    width: 75,
                    radius: 25,
                    color: Color.fromRGBO(240, 220, 195, 1),
                    textColor: Colors.black,
                  )
                ],
              ),
              RichText(
                text: TextSpan(
                    text: '7',
                    children: [
                      TextSpan(
                          text: 'Krave',
                          style: TextStyle(
                            color: Colors.teal.shade400,
                          )),
                    ],
                    style: const TextStyle(
                        color: Color.fromRGBO(228, 183, 125, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.w800)),
              ),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return buidPageView(pages[index]);
                  },
                  controller: pageController,
                  itemCount: pages.length,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: pages.length,
                effect: WormEffect(
                    dotColor: Colors.grey.shade300,
                    activeDotColor: Color.fromRGBO(228, 183, 125, 1),
                    dotWidth: 18,
                    dotHeight: 6),
              ),
              const SizedBox(height: 22),
              MyButton(
                onClick: () {
                  navigateTo(context, RegisterScreen());
                },
                text: 'Get Start',
                width: double.infinity,
                radius: 8,
                height: 55,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: () {
                        navigateTo(context, RegisterScreen());
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.teal),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buidPageView(PageViewModel page) => Column(
        children: [
          Image.asset(
            page.image,
          ),
          Text(
            page.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Text(
            page.description,
            style: const TextStyle(
              fontSize: 14,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          )
        ],
      );
}

class PageViewModel {
  final String image;
  final String title;
  final String description;

  PageViewModel(this.image, this.title, this.description);
}
