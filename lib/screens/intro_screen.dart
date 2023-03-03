import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/fake_data.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_gaps.dart';
import '../utils/constants/app_page_names.dart';
import '../widgets/core_widgets.dart';
import '../widgets/screen_widgets/intro_screen_widgets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  /// Page controller for managing intro content sequences.
  final PageController _pageController = PageController(keepPage: false);
_saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSkipped', true);
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _saveData();
  }


  /// Go to next intro section
  void _gotoNextIntroSection(BuildContext context) {
    // If intro section ends, goto sign in screen.
    if (_pageController.page == FakeData.fakeIntroContents.length - 1) {
      Navigator.pushNamed(context, AppPageNames.signInScreen);
    }
    // Goto next intro section
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    /// Get screen size
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      /* <-------- Content --------> */
      body: SafeArea(
          top: true,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 426,
                      /* <---- Intro screens ----> */
                      child: PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: FakeData.fakeIntroContents.length,
                        itemBuilder: (context, index) {
                          /// Single intro screen data
                          final fakeIntroContent =
                              FakeData.fakeIntroContents[index];
                          /* <---- Single Intro screen widget ----> */
                          return IntroContentWidget(
                              screenSize: screenSize,
                              localImageLocation:
                                  fakeIntroContent.localSVGImageLocation,
                              slogan: fakeIntroContent.slogan,
                              subtitle: fakeIntroContent.content);
                        },
                      ),
                    ),
                    AppGaps.hGap65,
                    SizedBox(
                      /* <---- Current page dot indicator widget ----> */
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: FakeData.fakeIntroContents.length,
                        axisDirection: Axis.horizontal,
                        effect: const ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            spacing: 4,
                            expansionFactor: 3,
                            activeDotColor: AppColors.textColor1,
                            dotColor: AppColors.tertiaryColor),
                      ),
                    )
                  ]),
            ),
          )),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* <---- Next button ----> */
              CustomSmallTextButtonWidget(
                  buttonText: 'Next',
                  onTap: () {
                    _gotoNextIntroSection(context);
                  }),
              /* <---- Skip button ----> */
              TextButton(
                  onPressed: () {
                    // Goto sign in screen.
                    Navigator.pushNamed(context, AppPageNames.signInScreen);
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.white),
                  ))
            ]),
      ),
    );
  }
}
