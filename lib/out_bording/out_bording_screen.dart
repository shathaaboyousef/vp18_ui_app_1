import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widegts/contaner_page_indecator.dart';
import 'outboardingpage.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  final String textContent =
      "Now were up in the big leagues gettingour turn at bat. The Brady Bunch that's the way we  Brady Bunch..";

  int _pageIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Visibility(
              visible: _pageIndex != 2,
              replacement: Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/login_screen'),
                  style: TextButton.styleFrom(
                      primary: const Color(0xFF6C8EF2),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      )),
                  child: Text(
                    "START",
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () => _pageController.animateToPage(
                    2,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeIn,
                  ),
                  style: TextButton.styleFrom(
                      primary: const Color(0xFF6C8EF2),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      )),
                  child: Text(
                    "SKIP",
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int pageIndex) {
                  setState(() {
                    _pageIndex = pageIndex;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 34,
                      end: 33,
                    ),
                    child: OutBoardingPage(
                      image: "welcome_1",
                      title: "Welcome!",
                      subTitle: textContent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 34,
                      end: 33,
                    ),
                    child: OutBoardingPage(
                      image: "welcome_2",
                      title: "Add to cart",
                      subTitle: textContent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 34,
                      end: 33,
                    ),
                    child: OutBoardingPage(
                      image: "welcome_3",
                      title: "Enjoy Purchase!",
                      subTitle: textContent,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerPageIndicator(
                    selected: _pageIndex == 0, endMargin: 14.7),
                ContainerPageIndicator(
                  selected: _pageIndex == 1,
                  endMargin: 14.7,
                ),
                ContainerPageIndicator(
                  selected: _pageIndex == 2,
                  endMargin: 0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    if (_pageIndex != 0)
                      _pageController.previousPage(
                          duration: Duration(
                            seconds: 1,
                          ),
                          curve: Curves.easeInBack);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_pageIndex != 2)
                      _pageController.nextPage(
                        duration: Duration(
                          seconds: 1,
                        ),
                        curve: Curves.easeInBack,
                      );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
              child: Visibility(
                visible: _pageIndex == 2,
                maintainState: true,
                maintainSize: true,
                maintainAnimation: true,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/login_screen'),
                  child: Text(
                    "START",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 100,
            // )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TabPageSelectorIndicator(backgroundColor: _pageIndex ==0 ?  Colors.blue: Colors.grey, borderColor: _pageIndex ==0 ?  Colors.orange: Colors.transparent, size: 10,),
            //     TabPageSelectorIndicator(backgroundColor:_pageIndex ==1 ?  Colors.blue: Colors.grey, borderColor:_pageIndex ==1 ?  Colors.orange: Colors.transparent, size: 10,),
            //     TabPageSelectorIndicator(backgroundColor: _pageIndex ==2 ?  Colors.blue: Colors.grey, borderColor:_pageIndex ==2 ?  Colors.orange: Colors.transparent, size: 10,),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
