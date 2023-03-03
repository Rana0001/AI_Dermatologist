import 'package:ai_dermatologist/utils/constants/app_constants.dart';
import 'package:ai_dermatologist/widgets/core_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/app_page_names.dart';

class ResetPasswordEmailScreen extends StatefulWidget {
  const ResetPasswordEmailScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordEmailScreen> createState() =>
      _ResetPasswordEmailScreenState();
}

class _ResetPasswordEmailScreenState extends State<ResetPasswordEmailScreen> {
  final _auth = FirebaseAuth.instance;

  final _emailController = TextEditingController();

  bool isLoading = false;

  _resetPassword() async {
    setState(() {
      isLoading = true;
    });
    await _auth
        .sendPasswordResetEmail(email: _emailController.text)
        .then((value) {
      setState(() {
        isLoading = false;
        Navigator.pushNamed(
            context, AppPageNames.passwordResentLinkSentSucessScreen);
      });
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message.toString()),
          backgroundColor: AppColors.primaryColor,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppGaps.screenPaddingValue),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const HighlightAndDetailTextWidget(
                          isSpaceShorter: true,
                          slogan: 'Reset your password',
                          subtitle:
                              'Enter your email address to reset your password'),
                      AppGaps.hGap24,
                      /* <---- Email text field ----> */
                      CustomTextFormField(
                        controller: _emailController,
                        labelText: 'Email address',
                        hintText: 'yourlink@gmail.com',
                        prefixIcon:
                            SvgPicture.asset(AppAssetImages.messageSVGLogoLine),
                      ),
                      AppGaps.hGap24,

                      /* <---- Sign in button ----> */
                      CustomStretchedTextButtonWidget(
                          buttonText: 'Send reset link',
                          onTap: () {
                            _resetPassword();
                            // Goto home screen
                          }),
                      AppGaps.hGap24,
                    ],
                  ),
                ),
              ),
            ),
      /* <-------- Bottom bar of sign up text button --------> */
    );
  }
}
