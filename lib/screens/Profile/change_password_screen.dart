// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../models/enums.dart';
// import '../../utils/constants/app_constants.dart';
// import '../../widgets/core_widgets.dart';
// import '../../widgets/screen_widgets/password_change_screen.dart';

// class CreateNewPasswordScreen extends StatefulWidget {
//   const CreateNewPasswordScreen({Key? key}) : super(key: key);

//   @override
//   State<CreateNewPasswordScreen> createState() =>
//       _CreateNewPasswordScreenState();
// }

// class _CreateNewPasswordScreenState
//     extends State<CreateNewPasswordScreen> {
//   /// Toggle value of hide new password
//   bool _toggleHideNewPassword = true;

//   /// Toggle value of hide confirm password
//   bool _toggleHideConfirmPassword = true;

//   /// Toggle value of over 5 characters requirement
//   bool _isPasswordOver5Characters = false;

//   /// Toggle value of at least 1 digit number
//   bool _isPasswordHasAtLeastSingleNumberDigit = false;

//   /// Create new password editing controller
//   TextEditingController _newPasswordEditingController = TextEditingController();

//   /// Password strong level value
//   PasswordStrongLevel _passwordStrongLevel = PasswordStrongLevel.none;

//   /// Find if any password text character has number digit.
//   bool _detectPasswordNumber(String passwordText) =>
//       passwordText.contains(RegExp(r'[0-9]'));

//   /// Check password
//   void _passwordCheck(String passwordText) {
//     _setPasswordStrongLevel(passwordText);
//     if (passwordText.length > 5) {
//       _isPasswordOver5Characters = true;
//     } else {
//       _isPasswordOver5Characters = false;
//     }
//     if (_detectPasswordNumber(passwordText)) {
//       _isPasswordHasAtLeastSingleNumberDigit = true;
//     } else {
//       _isPasswordHasAtLeastSingleNumberDigit = false;
//     }
//   }

//   /// Simple password strong level algorithm for new password field
//   void _setPasswordStrongLevel(String passwordText) {
//     final isNumberFound = _detectPasswordNumber(passwordText);
//     if (passwordText.isEmpty) {
//       _passwordStrongLevel = PasswordStrongLevel.none;
//     } else {
//       if (passwordText.length > 5 && isNumberFound) {
//         _passwordStrongLevel = PasswordStrongLevel.strong;
//         if (passwordText.length > 11 && isNumberFound) {
//           _passwordStrongLevel = PasswordStrongLevel.veryStrong;
//         }
//       } else if (passwordText.length > 5) {
//         _passwordStrongLevel = PasswordStrongLevel.normal;
//       } else {
//         _passwordStrongLevel = PasswordStrongLevel.weak;
//       }
//     }
//   }

//   /* <-------- Initial state --------> */
//   @override
//   void initState() {
//     _newPasswordEditingController = TextEditingController();
//     _newPasswordEditingController.addListener(() {
//       if (mounted) {
//         setState(() => _passwordCheck(_newPasswordEditingController.text));
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       /* <-------- Empty appbar with back button --------> */
//       appBar: CoreWidgets.appBarWidget(screenContext: context),
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
//                 // Top extra spaces
//                 AppGaps.hGap80,
//                 /* <---- Verification icon and text ----> */
//                 Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: const [
//                       AppGaps.hGap20,
//                       HighlightAndDetailTextWidget2(
//                           slogan: 'Create new password',
//                           subtitle:
//                               'Please enter your new password and confirm password'),
//                     ],
//                   ),
//                 ),
//                 AppGaps.hGap40,
//                 /* <---- Enter current password text field ----> */
//                 CustomTextFormField(
//                   hasShadow: false,
//                   isPasswordTextField: _toggleHideConfirmPassword,
//                   labelText: 'Current password',
//                   hintText: '********',
//                   prefixIcon:
//                       SvgPicture.asset(AppAssetImages.unlockSVGLogoLine),
//                   suffixIcon: IconButton(
//                       padding: EdgeInsets.zero,
//                       visualDensity: const VisualDensity(
//                           horizontal: VisualDensity.minimumDensity,
//                           vertical: VisualDensity.minimumDensity),
//                       color: Colors.transparent,
//                       onPressed: () => setState(() =>
//                           _toggleHideConfirmPassword =
//                               !_toggleHideConfirmPassword),
//                       icon: SvgPicture.asset(AppAssetImages.hideSVGLogoLine,
//                           color: _toggleHideConfirmPassword
//                               ? AppColors.bodyTextColor
//                               : AppColors.primaryColor)),
//                 ),
//                 AppGaps.hGap24,
//                 /* <---- Create new password text field ----> */
//                 CustomTextFormField(
//                   controller: _newPasswordEditingController,
//                   hasShadow: false,
//                   isPasswordTextField: _toggleHideNewPassword,
//                   labelText: 'New password',
//                   hintText: '********',
//                   prefixIcon:
//                       SvgPicture.asset(AppAssetImages.unlockSVGLogoLine),
//                   suffixIcon: IconButton(
//                       padding: EdgeInsets.zero,
//                       visualDensity: const VisualDensity(
//                           horizontal: VisualDensity.minimumDensity,
//                           vertical: VisualDensity.minimumDensity),
//                       color: Colors.transparent,
//                       onPressed: () => setState(() =>
//                           _toggleHideNewPassword = !_toggleHideNewPassword),
//                       icon: SvgPicture.asset(AppAssetImages.hideSVGLogoLine,
//                           color: _toggleHideNewPassword
//                               ? AppColors.bodyTextColor
//                               : AppColors.primaryColor)),
//                 ),
//                 AppGaps.hGap24,
//                 /* <---- Create confirm password text field ----> */
//                 CustomTextFormField(
//                   hasShadow: false,
//                   isPasswordTextField: _toggleHideConfirmPassword,
//                   labelText: 'Confirm password',
//                   hintText: '********',
//                   prefixIcon:
//                       SvgPicture.asset(AppAssetImages.unlockSVGLogoLine),
//                   suffixIcon: IconButton(
//                       padding: EdgeInsets.zero,
//                       visualDensity: const VisualDensity(
//                           horizontal: VisualDensity.minimumDensity,
//                           vertical: VisualDensity.minimumDensity),
//                       color: Colors.transparent,
//                       onPressed: () => setState(() =>
//                           _toggleHideConfirmPassword =
//                               !_toggleHideConfirmPassword),
//                       icon: SvgPicture.asset(AppAssetImages.hideSVGLogoLine,
//                           color: _toggleHideConfirmPassword
//                               ? AppColors.bodyTextColor
//                               : AppColors.primaryColor)),
//                 ),
//                 AppGaps.hGap24,
//                 /* <---- Password requirement strong level columns ----> */
//                 Center(
//                     child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     /* <---- Password strong level widget ----> */
//                     PasswordStrongLevelWidget(
//                         currentPasswordStrongLevel: _passwordStrongLevel),
//                     AppGaps.hGap16,
//                     /* <---- Password 1st requirement ----> */
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(AppAssetImages.tickRoundedSVGLogoSolid,
//                             color: _isPasswordOver5Characters
//                                 ? AppColors.successColor
//                                 : AppColors.darkColor.withOpacity(0.25)),
//                         AppGaps.wGap15,
//                         const Text('At least 6 characters',
//                             style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.black)),
//                       ],
//                     ),
//                     AppGaps.hGap16,
//                     /* <---- Password 2nd requirement ----> */
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(AppAssetImages.tickRoundedSVGLogoSolid,
//                             color: _isPasswordHasAtLeastSingleNumberDigit
//                                 ? AppColors.successColor
//                                 : AppColors.darkColor.withOpacity(0.25)),
//                         AppGaps.wGap15,
//                         const Text('Contain at least 1 number',
//                             style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.black)),
//                       ],
//                     ),
//                   ],
//                 )),
//                 AppGaps.hGap30,
//               ],
//             ),
//           ),
//         ),
//       ),
//       /* <-------- Bottom bar of sign up text --------> */
//       bottomNavigationBar: CustomScaffoldBottomBarWidget(
//         child: CustomStretchedTextButtonWidget(
//             buttonText: 'Save password',
//             onTap: () {
//               // Go to password changed success screen.
//               // Navigator.pushNamed(
//               //     context, AppPageNames.passwordChangeSuccessScreen);
//             }),
//       ),
//     );
//   }
// }
import 'package:ai_dermatologist/app/constant.dart';
import 'package:ai_dermatologist/utils/constants/app_page_names.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/enums.dart';
import '../../utils/constants/app_constants.dart';
import '../../widgets/core_widgets.dart';
import '../../widgets/screen_widgets/password_change_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _auth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;
   SharedPreferences? _sharedPreferences;
  bool isLoading = false;

  /// Creating TextEditingController
  final TextEditingController _currentPasswordEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();

  ///Creating a funtion to change password using firebase
  Future<void> _changePassword(
      String currentPassword, String newPassword) async {
    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential = await _auth.
          signInWithEmailAndPassword(
                  email: Constant.users!.email!, password: currentPassword);
      final User? user = userCredential.user;
      if(user != null){
        await _auth.currentUser!
            .updatePassword(newPassword)
            .then((value) async {
          await user.updatePassword(newPassword).then((value) {
            setState(() {

              isLoading = false;

              Navigator.pushNamed(context, AppPageNames.signInScreen);
            
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Password changed successfully',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.green,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Logout successfully',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.green,
                ),
              );
            });
            debugPrint('Password changed successfully');
          });
        }).catchError((e) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.redAccent,
            ),
          );
        });
      } else{
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Current password is incorrect',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Failed to change password: $e");
    }
  }

  /// Toggle value of hide new password
  bool _toggleHideNewPassword = true;

  /// Toggle value of hide confirm password
  bool _toggleHideConfirmPassword = true;

  /// Toggle value of over 5 characters requirement
  bool _isPasswordOver5Characters = false;

  /// Toggle value of at least 1 digit number
  bool _isPasswordHasAtLeastSingleNumberDigit = false;

  /// Create new password editing controller
  TextEditingController _newPasswordEditingController = TextEditingController();

  /// Password strong level value
  PasswordStrongLevel _passwordStrongLevel = PasswordStrongLevel.none;

  /// Find if any password text character has number digit.
  bool _detectPasswordNumber(String passwordText) =>
      passwordText.contains(RegExp(r'[0-9]'));

  /// Check password
  void _passwordCheck(String passwordText) {
    _setPasswordStrongLevel(passwordText);
    if (passwordText.length > 5) {
      _isPasswordOver5Characters = true;
    } else {
      _isPasswordOver5Characters = false;
    }
    if (_detectPasswordNumber(passwordText)) {
      _isPasswordHasAtLeastSingleNumberDigit = true;
    } else {
      _isPasswordHasAtLeastSingleNumberDigit = false;
    }
  }

  /// Simple password strong level algorithm for new password field
  void _setPasswordStrongLevel(String passwordText) {
    final isNumberFound = _detectPasswordNumber(passwordText);
    if (passwordText.isEmpty) {
      _passwordStrongLevel = PasswordStrongLevel.none;
    } else {
      if (passwordText.length > 5 && isNumberFound) {
        _passwordStrongLevel = PasswordStrongLevel.strong;
        if (passwordText.length > 11 && isNumberFound) {
          _passwordStrongLevel = PasswordStrongLevel.veryStrong;
        }
      } else if (passwordText.length > 5) {
        _passwordStrongLevel = PasswordStrongLevel.normal;
      } else {
        _passwordStrongLevel = PasswordStrongLevel.weak;
      }
    }
  }

  /* <-------- Initial state --------> */
  @override
  void initState() {
    _newPasswordEditingController = TextEditingController();
    _newPasswordEditingController.addListener(() {
      if (mounted) {
        setState(() => _passwordCheck(_newPasswordEditingController.text));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Background color --------> */
      backgroundColor: isLoading ? AppColors.white : AppColors.primaryColor,
      extendBodyBehindAppBar: true,
      /* <-------- Empty appbar with back button --------> */
      appBar:
          isLoading ? null : CoreWidgets.appBarWidget(screenContext: context),
      /* <-------- Content --------> */
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            )
          : CustomScaffoldBodyWidget2(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Top extra spaces
                    AppGaps.hGap80,
                    /* <---- Verification icon and text ----> */
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          AppGaps.hGap50,
                          HighlightAndDetailTextWidget(
                              slogan: 'Create new password',
                              subtitle:
                                  'Please enter your current password ,new password, and confirm password'),
                        ],
                      ),
                    ),
                    AppGaps.hGap40,
                    /* <---- Enter current password text field ----> */
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppGaps.screenPaddingValue),
                      decoration: const BoxDecoration(
                          color: AppColors.container2,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      child: Column(
                        children: [
                          AppGaps.hGap40,
                          CustomTextFormField(
                            controller: _currentPasswordEditingController,
                            hasShadow: false,
                            isPasswordTextField: _toggleHideConfirmPassword,
                            labelText: 'Current password',
                            hintText: '********',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.unlockSVGLogoLine),
                            suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                color: Colors.transparent,
                                onPressed: () => setState(() =>
                                    _toggleHideConfirmPassword =
                                        !_toggleHideConfirmPassword),
                                icon: SvgPicture.asset(
                                    AppAssetImages.hideSVGLogoLine,
                                    color: _toggleHideConfirmPassword
                                        ? AppColors.bodyTextColor
                                        : AppColors.primaryColor)),
                          ),
                          AppGaps.hGap24,
                          /* <---- Create new password text field ----> */
                          CustomTextFormField(
                            controller: _newPasswordEditingController,
                            hasShadow: false,
                            isPasswordTextField: _toggleHideNewPassword,
                            labelText: 'New password',
                            hintText: '********',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.unlockSVGLogoLine),
                            suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                color: Colors.transparent,
                                onPressed: () => setState(() =>
                                    _toggleHideNewPassword =
                                        !_toggleHideNewPassword),
                                icon: SvgPicture.asset(
                                    AppAssetImages.hideSVGLogoLine,
                                    color: _toggleHideNewPassword
                                        ? AppColors.bodyTextColor
                                        : AppColors.primaryColor)),
                          ),
                          AppGaps.hGap24,
                          /* <---- Create confirm password text field ----> */
                          CustomTextFormField(
                            controller: _confirmPasswordEditingController,
                            hasShadow: false,
                            isPasswordTextField: _toggleHideConfirmPassword,
                            labelText: 'Confirm password',
                            hintText: '********',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.unlockSVGLogoLine),
                            suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                color: Colors.transparent,
                                onPressed: () => setState(() =>
                                    _toggleHideConfirmPassword =
                                        !_toggleHideConfirmPassword),
                                icon: SvgPicture.asset(
                                    AppAssetImages.hideSVGLogoLine,
                                    color: _toggleHideConfirmPassword
                                        ? AppColors.bodyTextColor
                                        : AppColors.primaryColor)),
                          ),
                          AppGaps.hGap24,
                          /* <---- Password requirement strong level columns ----> */
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /* <---- Password strong level widget ----> */
                                PasswordStrongLevelWidget(
                                    currentPasswordStrongLevel:
                                        _passwordStrongLevel),
                                AppGaps.hGap16,
                                /* <---- Password 1st requirement ----> */
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssetImages.tickRoundedSVGLogoSolid,
                                      color: _isPasswordOver5Characters
                                          ? AppColors.successColor
                                          : AppColors.darkColor
                                              .withOpacity(0.25),
                                    ),
                                    AppGaps.wGap15,
                                    const Text(
                                      'At least 6 characters',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                /* <---- Password 2nd requirement ----> */
                                AppGaps.hGap12,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssetImages.tickRoundedSVGLogoSolid,
                                      color:
                                          _isPasswordHasAtLeastSingleNumberDigit
                                              ? AppColors.successColor
                                              : AppColors.darkColor
                                                  .withOpacity(0.25),
                                    ),
                                    AppGaps.wGap15,
                                    const Text(
                                      'Contain at least 1 number',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                AppGaps.hGap40,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

      /* <-------- Bottom bar of sign up text --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        backgroundColor: AppColors.container,
        child: CustomStretchedTextButtonWidget(
          buttonText: 'Save password',
          onTap: () {
            if (_newPasswordEditingController.text ==
                _confirmPasswordEditingController.text) {
              _changePassword(_currentPasswordEditingController.text,
                  _newPasswordEditingController.text);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'New password and confirm password does not match',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: Colors.redAccent,
                  duration: Duration(seconds: 3),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
