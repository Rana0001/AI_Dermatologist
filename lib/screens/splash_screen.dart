
import 'package:ai_dermatologist/screens/sigin_screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/app_gaps.dart';
import '../../utils/constants/app_images.dart';
import '../../utils/constants/app_page_names.dart';
import '../utils/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _delayAndGotoNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
        context, AppPageNames.introScreen, (_) => false);
  }
bool toggleRememberLogin = false;
String email = "";
String password = "";
_getSharedData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      toggleRememberLogin = prefs.getBool('rememberMe')!;
      if(toggleRememberLogin == true){
      email = prefs.getString('email')!;
      password = prefs.getString('password')!;
      }

    });
  }

  _getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isSkipped = prefs.getBool('isSkipped');

    if(isSkipped == null || isSkipped == false){
_delayAndGotoNextScreen();
    }else{
      setState(() {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SignInScreen(email:email ?? "", password: password ?? "", rememberMe: toggleRememberLogin ?? false,)), (route) => false);
      });

    }
  }


  @override
  void initState() {
  _getData();
  _getSharedData();    
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Content --------> */
      backgroundColor: AppColors.primaryColor,
      body: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset(AppAssetImages.splashScreenAbstract).image,
                fit: BoxFit.fitWidth)),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssetImages.logo, height: 150, width: 150),
              AppGaps.wGap10,
            ],
          ),
        ),
      ),
    );
  }
}
