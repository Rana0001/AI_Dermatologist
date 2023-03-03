import 'package:ai_dermatologist/screens/Profile/edit_my_account_screen.dart';
import 'package:ai_dermatologist/screens/history/histories_screen.dart';
import 'package:ai_dermatologist/screens/home_navigator_screen.dart';
import 'package:ai_dermatologist/screens/home_navigator_screens/home_screen.dart';
import 'package:ai_dermatologist/screens/home_navigator_screens/aichat_screen.dart';
import 'package:ai_dermatologist/screens/home_navigator_screens/my_account_screen.dart';
import 'package:ai_dermatologist/screens/home_navigator_screens/history_screen.dart';
import 'package:ai_dermatologist/screens/password_recovery_screens/password_recovery_enter_email_screen.dart';
import 'package:ai_dermatologist/screens/password_recovery_screens/password_recovery_select_screen.dart';
import 'package:ai_dermatologist/screens/password_recovery_screens/password_reset_link_sent_sucess_screen.dart';
import 'package:ai_dermatologist/screens/Profile/settings_screen.dart';
import 'package:ai_dermatologist/screens/sigin_screens/signin_screen.dart';
import 'package:flutter/material.dart';

import '../screens/Profile/change_password_screen.dart';
import '../screens/chat/chat_screen.dart';
import '../screens/detection/analysis_save_form_screen.dart';
import '../screens/detection/image_uploaded.dart';
import '../screens/detection/uploadedImagePredictionDetailsScreen.dart';
import '../screens/detection/uploadedImagePredictionScreen.dart';
import '../screens/detection/uploading_screen.dart';
import '../screens/faq/faq_questions_screen.dart';
import '../screens/history/disease_description_screen.dart';
import '../screens/history/history_disease_desc_screen.dart';
import '../screens/how_to_use/howtouseScreen.dart';
import '../screens/intro_screen.dart';
import '../screens/signup_screen/signup_screen.dart';
import '../screens/splash_screen.dart';
import 'constants/app_page_names.dart';

/// This file contains app route generator
class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? argument = settings.arguments;
    switch (settings.name) {
      case AppPageNames.rootScreen:
      case AppPageNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppPageNames.introScreen:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case AppPageNames.signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case AppPageNames.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppPageNames.passwordRecoverySelectScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoverySelectScreen());
      case AppPageNames.resetPasswordEmailScreen:
        return MaterialPageRoute(
            builder: (_) => const ResetPasswordEmailScreen());
      case AppPageNames.passwordResentLinkSentSucessScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordResentLinkSentSucessScreen());
      case AppPageNames.homeNavigatorScreen:
        return MaterialPageRoute(builder: (_) => const HomeNavigatorScreen());
      case AppPageNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppPageNames.aichatScreen:
        return MaterialPageRoute(builder: (_) => const AIChatScreen());
      case AppPageNames.myAccountScreen:
        return MaterialPageRoute(builder: (_) => const MyAccountScreen());
      case AppPageNames.historiesScreen:
        return MaterialPageRoute(builder: (_) => const HistoryScreen());
      case AppPageNames.settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppPageNames.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditMyAccountScreen());
      case AppPageNames.createNewPasswordScreen:
        return MaterialPageRoute(
            builder: (_) => const CreateNewPasswordScreen());
      case AppPageNames.myHistoriesScreen:
        return MaterialPageRoute(builder: (_) => MyHistoryScreen());
      case AppPageNames.historyDiseaseDescScreen:
        return MaterialPageRoute(builder: (_) => HistoryDiseaseDescScreen());
      case AppPageNames.diseaseDescScreen:
        return MaterialPageRoute(builder: (_) => DiseaseDescriptionScreen());
      case AppPageNames.faqScreen:
        return MaterialPageRoute(builder: (_) => const FAQScreen());
      case AppPageNames.uploadingScreen:
        return MaterialPageRoute(builder: (_) => UploadingScreen());
      case AppPageNames.imageUploadedScreen:
        return MaterialPageRoute(builder: (_) => ImageUploadedScreen());
      case AppPageNames.uploadedImagePredictionScreen:
        return MaterialPageRoute(
            builder: (_) => UploadedImagePredictionScreen());
      case AppPageNames.uploadedImagePredictionDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const UploadedImagePredictionDetailsScreen());
      case AppPageNames.analysissaveFormScreen:
        return MaterialPageRoute(
            builder: (_) => const PredictedAnalysisSaveFormScreen());
      case AppPageNames.howtouseappscreen:
        return MaterialPageRoute(builder: (_) => const HowToUseAppPageScreen());
      case AppPageNames.chatScreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      default:
        // Open this page if wrong route address used
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Page not found')))));
    }
  }
}
