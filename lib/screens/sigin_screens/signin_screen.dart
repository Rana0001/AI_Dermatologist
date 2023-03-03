// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_switch/flutter_switch.dart';

// import '../../utils/constants/app_colors.dart';
// import '../../utils/constants/app_gaps.dart';
// import '../../utils/constants/app_images.dart';
// import '../../utils/constants/app_page_names.dart';
// import '../../widgets/core_widgets.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   /// Toggle value of remember me
//   bool _toggleRememberLogin = false;

//   /// Toggle value of hide password
//   bool _toggleHidePassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       /* <-------- Empty appbar --------> */
//       backgroundColor: AppColors.primaryColor,
//       appBar: CoreWidgets.appBarWidget(
//           screenContext: context, hasBackButton: false),
//       /* <-------- Content --------> */
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: AppGaps.screenPaddingValue),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const HighlightAndDetailTextWidget(
//                     isSpaceShorter: true,
//                     slogan: 'Welcome to AI Dermatologist',
//                     subtitle: 'Hello there, sign in to continue'),
//                 AppGaps.hGap24,
//                 /* <---- Email text field ----> */
//                 CustomTextFormField2(
//                   labelText: 'Email address',
//                   hintText: 'contact@gmail.com',
//                   prefixIcon:
//                       SvgPicture.asset(AppAssetImages.messageSVGLogoLine),
//                 ),
//                 AppGaps.hGap24,
//                 /* <---- Password text field ----> */
//                 CustomTextFormField2(
//                   hasShadow: false,
//                   isPasswordTextField: _toggleHidePassword,
//                   labelText: 'Password',
//                   hintText: '********',
//                   prefixIcon:
//                       SvgPicture.asset(AppAssetImages.unlockSVGLogoLine),
//                   /* <---- Password hide icon button ----> */
//                   suffixIcon: IconButton(
//                       padding: EdgeInsets.zero,
//                       visualDensity: const VisualDensity(
//                           horizontal: VisualDensity.minimumDensity,
//                           vertical: VisualDensity.minimumDensity),
//                       color: Colors.transparent,
//                       onPressed: () => setState(
//                           () => _toggleHidePassword = !_toggleHidePassword),
//                       icon: SvgPicture.asset(AppAssetImages.hideSVGLogoLine,
//                           color: _toggleHidePassword
//                               ? AppColors.bodyTextColor
//                               : AppColors.primaryColor)),
//                 ),
//                 AppGaps.hGap24,
//                 /* <---- Remember me, forget password row ----> */
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         /* <---- Remember me toggle button ----> */
//                         FlutterSwitch(
//                           value: _toggleRememberLogin,
//                           width: 35,
//                           height: 20,
//                           toggleSize: 12,
//                           activeColor: AppColors.successColor,
//                           onToggle: (value) =>
//                               setState(() => _toggleRememberLogin = value),
//                         ),
//                         AppGaps.wGap8,
//                         Text('Remember me',
//                             style: TextStyle(
//                                 color: _toggleRememberLogin
//                                     ? AppColors.successColor
//                                     : AppColors.white)),
//                       ],
//                     ),
//                     /* <---- Forget password? text button ----> */
//                     CustomTightTextButtonWidget(
//                       child: Text('Forgot password?',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium
//                               ?.copyWith(color: AppColors.alertColor)),
//                       onTap: () {
//                         // Goto verification method selection screen.
//                         Navigator.pushNamed(
//                             context, AppPageNames.passwordRecoverySelectScreen);
//                       },
//                     ),
//                   ],
//                 ),
//                 AppGaps.hGap25,
//                 /* <---- Sign in button ----> */
//                 CustomStretchedTextButtonWidget(
//                     buttonText: 'Sign in',
//                     onTap: () {
//                       // Goto home screen
//                       // Navigator.pushNamed(
//                       //     context, AppPageNames.homeNavigatorScreen);
//                     }),
//                 AppGaps.hGap24,
//                 Center(
//                     child: Text('Or Sign in with social account',
//                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                               color: AppColors.white,
//                             ))),
//                 AppGaps.hGap24,
//                 /* <---- Social buttons row ----> */
//                 Center(
//                     child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     /* <---- Google icon button ----> */
//                     CustomIconButtonWidget(
//                         border: Border.all(color: AppColors.lineShapeColor),
//                         child:
//                             SvgPicture.asset(AppAssetImages.googleSVGLogoColor),
//                         onTap: () {})
//               ])),
//                 // Bottom extra spaces
//                 AppGaps.hGap20,
//               ],
//             ),
//           ),
//         ),
//       ),
//       /* <-------- Bottom bar of sign up text button --------> */
//       bottomNavigationBar: CustomScaffoldBottomBarWidget(
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text('Don\'t have an account?',
//                 style: TextStyle(color: AppColors.white)),
//             AppGaps.wGap5,
//             /* <---- Sign up TextButton ----> */
//             CustomTightTextButtonWidget(
//               onTap: () {
//                 // Goto sign up screen.
//                 Navigator.pushNamed(context, AppPageNames.signUpScreen);
//               },
//               child: Text('Sign up',
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium
//                       ?.copyWith(color: AppColors.successColor)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:ai_dermatologist/app/constant.dart';
import 'package:ai_dermatologist/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_gaps.dart';
import '../../utils/constants/app_images.dart';
import '../../utils/constants/app_page_names.dart';
import '../../widgets/core_widgets.dart';

class SignInScreen extends StatefulWidget {
   SignInScreen({Key? key,this.email,this.password,this.rememberMe}) : super(key: key);
  String? email, password;
  bool? rememberMe;
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;
  
  ///Create a TextController for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Toggle value of hide password
  bool _toggleHidePassword = true;

  bool _toggleRememberLogin = false;

  Map<String,dynamic> sharedData = {};

@override
void initState() {
  super.initState();
  _emailController.text = widget.email ??'';
  _passwordController.text = widget.password ??  '';
  _toggleRememberLogin = widget.rememberMe ?? false;
}
  ///Creating Success or Failure Message
  _message(bool value) {
    if (value) {
      Navigator.pushNamed(context, AppPageNames.homeNavigatorScreen);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User Logged In Successfully',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User Logged In Failed',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ));
    }
  }

_savePreference(String email,String password) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('rememberMe', _toggleRememberLogin);
  prefs.setString('email', email);
  prefs.setString('password', password);
}

_loginWithGoogle() async{
  try{
    await GoogleSignIn().signOut();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
    final userCredential = await _auth.signInWithCredential(credential).then((value) {
      return true;
    }).whenComplete(() async {
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .get()
          .then((value) {
        if (value.exists) {
          Constant.users = Users.fromJson(value.data());
          _savePreference(Constant.users!.email!, _passwordController.text);
          debugPrint(Constant.users!.firstName);
        } else {
          debugPrint('No such user');

        }
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
    _message(userCredential);
  }catch(e){
    debugPrint(e.toString());
  }
}
  ///Creating Login function using firebase
  _login() async {
    try {
      final userCredential = await _auth
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
        return true;
      }).whenComplete(() async {
        await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser?.uid)
            .get()
            .then((value) {
          if (value.exists) {
            Constant.users = Users.fromJson(value.data());
          _savePreference(Constant.users!.email!, _passwordController.text);

            debugPrint(Constant.users!.firstName);
          } else {
            debugPrint('No such user');

          }
        });
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
        return false;
      });
      _message(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'No user found for that email.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Wrong password provided for that user.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 2)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Get screen size

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      /* <-------- Empty appbar with back button --------> */
      // appBar: CoreWidgets.appBarWidget(screenContext: context),
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        hasBackButton: false,
      ),

      /* <-------- Content --------> */
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 20), // Add desired spacing
          const Center(
            child: HighlightAndDetailTextWidget(
              isSpaceShorter: true,
              slogan: 'Welcome to AI Dermatologist',
              subtitle: 'Hello there, sign in to continue',
            ),
          ),
          AppGaps.hGap24,
          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppGaps.screenPaddingValue),
              decoration: const BoxDecoration(
                  color: AppColors.container,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Center(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppGaps.screenPaddingValue),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppGaps.hGap24,
                    /* <---- User full name text field ----> */
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            /* <---- Expiration date text field ----> */
                            child: CustomTextFormField(
                              controller: _emailController,
                              labelText: 'Email Address',
                              prefixIcon: SvgPicture.asset(
                                  AppAssetImages.messageSVGLogoLine),
                              hintText: 'contact@gmail.com',
                              textInputType: TextInputType.text,
                            ),
                          ),
                        ]),
                    AppGaps.hGap24,

                    /* <---- Password text field ----> */
                    CustomTextFormField(
                      controller: _passwordController,
                      hasShadow: false,
                      isPasswordTextField: _toggleHidePassword,
                      labelText: 'Password',
                      hintText: '********',
                      prefixIcon:
                          SvgPicture.asset(AppAssetImages.unlockSVGLogoLine),
                      /* <---- Password hide icon button ----> */
                      suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          color: Colors.transparent,
                          onPressed: () => setState(
                              () => _toggleHidePassword = !_toggleHidePassword),
                          icon: SvgPicture.asset(AppAssetImages.hideSVGLogoLine,
                              color: _toggleHidePassword
                                  ? AppColors.bodyTextColor
                                  : AppColors.primaryColor)),
                    ),
                    AppGaps.hGap24,
                    /* <---- Terms and conditions CheckBox ----> */
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /* <---- Remember me toggle button ----> */
                            FlutterSwitch(
                              value: _toggleRememberLogin,
                              width: 35,
                              height: 20,
                              toggleSize: 12,
                              activeColor: AppColors.successColor,
                              onToggle: (value) =>
                                  setState(() => _toggleRememberLogin = value),
                            ),
                            AppGaps.wGap8,
                            Text('Remember me',
                                style: TextStyle(
                                    color: _toggleRememberLogin
                                        ? AppColors.primaryColor
                                        : AppColors.black)),
                          ],
                        ),
                        /* <---- Forget password? text button ----> */
                        CustomTightTextButtonWidget(
                          child: Text('Forgot password?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.alertColor)),
                          onTap: () {
                            // Goto verification method selection screen.
                            Navigator.pushNamed(context,
                                AppPageNames.passwordRecoverySelectScreen);
                          },
                        ),
                      ],
                    ),
                    // Bottom extra spaces
                    AppGaps.hGap25,
                    /* <---- Sign in button ----> */
                    CustomStretchedTextButtonWidget(
                        buttonText: 'Sign in',
                        onTap: () {
                          // Goto home screen
                          _login();
                        }),
                    AppGaps.hGap24,
                    Center(
                        child: Text('Or Sign in with social account',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.black,
                                ))),
                    AppGaps.hGap24,
                    /* <---- Social buttons row ----> */
                    Center(
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          /* <---- Google icon button ----> */
                          CustomIconButtonWidget(
                              border:
                                  Border.all(color: AppColors.lineShapeColor),
                              child: SvgPicture.asset(
                                  AppAssetImages.googleSVGLogoColor),
                              onTap: () {
                                _loginWithGoogle();
                              })
                        ])),
                    // Bottom extra spaces
                    AppGaps.hGap40,
                    AppGaps.hGap40,
                    AppGaps.hGap40,
                    AppGaps.hGap10,

                  ],
                ),
              ))))
        ]),
      ),

      /* <-------- Bottom bar of sign up and sign in button --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        backgroundColor: AppColors.container,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Don\'t have an account?',
                style: TextStyle(color: AppColors.black)),
            AppGaps.wGap5,
            /* <---- Sign up TextButton ----> */
            CustomTightTextButtonWidget(
              onTap: () {
                // Goto sign up screen.
                Navigator.pushNamed(context, AppPageNames.signUpScreen);
              },
              child: Text('Sign up',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.primaryColor)),
            )
          ],
        ),
      ),
    );
  }
}
