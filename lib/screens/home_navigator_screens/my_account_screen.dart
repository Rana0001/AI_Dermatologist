// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../utils/constants/app_constants.dart';
// import '../../utils/constants/app_page_names.dart';
// import '../../widgets/core_widgets.dart';
// import '../../widgets/screen_widgets/my_account_screen_widgets.dart';

// class MyAccountScreen extends StatefulWidget {
//   const MyAccountScreen({Key? key}) : super(key: key);

//   @override
//   State<MyAccountScreen> createState() => _MyAccountScreenState();
// }

// class _MyAccountScreenState extends State<MyAccountScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       /* <-------- Appbar --------> */
//       appBar: CoreWidgets.appBarWidget(
//           screenContext: context,
//           hasBackButton: false,
//           titleWidget: const Text('My account')),
//       /* <-------- Content --------> */
//       body: CustomScaffoldBodyWidget(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Top extra spaces
//               AppGaps.hGap15,
//               /* <---- Profile picture, name, phone number, email address
//                        ----> */
//               Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     /* <---- Profile picture ----> */
//                     Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         /* <---- Circular profile picture widget ----> */
//                         CircleAvatar(
//                           backgroundImage: Image.asset(
//                             AppAssetImages.myAccountProfilePicture,
//                           ).image,
//                           radius: 64,
//                         ),
//                         /* <---- Small edit circle icon button ----> */
//                         Positioned(
//                             bottom: 7,
//                             right: -3,
//                             child: IconButton(
//                               onPressed: () {
//                                 // Tapping on it goes to edit my account screen
//                                 Navigator.pushNamed(
//                                     context, AppPageNames.editProfileScreen);
//                               },
//                               padding: EdgeInsets.zero,
//                               constraints: const BoxConstraints(
//                                   minHeight: 34, minWidth: 34),
//                               icon: Container(
//                                 height: 34,
//                                 width: 34,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: AppColors.primaryColor,
//                                     border: Border.all(color: Colors.white)),
//                                 child: SvgPicture.asset(
//                                   AppAssetImages.editSVGLogoSolid,
//                                   height: 14,
//                                   width: 14,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ))
//                       ],
//                     ),
//                     AppGaps.hGap18,
//                     /* <---- Profile name ----> */
//                     const Text(
//                       'Srinkhala Baniya',
//                         style: TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w600)),
//                     AppGaps.hGap8,
//                     /* <---- Profile phone number ----> */
//                     const Text('+977 9860914588',
//                         style: TextStyle(color: AppColors.bodyTextColor)),
//                     AppGaps.hGap5,
//                     /* <---- Profile email address ----> */
//                     const Text('sisanbaniya@gmail.com@gmail.com',
//                         style: TextStyle(color: AppColors.bodyTextColor)),
//                     AppGaps.hGap32,
//                     /* <---- Horizontal dashed line ----> */
//                     CustomHorizontalDashedLineWidget(
//                         color: AppColors.darkColor.withOpacity(0.1)),
//                     AppGaps.hGap32,
//                     /* <---- 'Save address' list tile button ----> */
//                     CustomListTileMyAccountWidget(
//                         text: 'Nearby Hospitals',
//                         icon: SvgPicture.asset(
//                           AppAssetImages.locationSVGLogoDualTone,
//                           color: AppColors.primaryColor,
//                           height: 24,
//                           width: 24,
//                         ),
//                         onTap: () {
//                           Navigator.pushNamed(
//                               context, AppPageNames.myAccountScreen);
//                         }),
//                     AppGaps.hGap24,
//                     /* <---- 'Terms & conditions' list tile button ----> */
//                     CustomListTileMyAccountWidget(
//                         text: 'Terms & conditions',
//                         icon: SvgPicture.asset(
//                           AppAssetImages.bookmarkSVGLogoDualTone,
//                           color: AppColors.primaryColor,
//                           height: 24,
//                           width: 24,
//                         ),
//                         onTap: () {}),
//                     AppGaps.hGap24,
//                     /* <---- 'Frequently Asked Questions' list tile button ----> */
//                     CustomListTileMyAccountWidget(
//                         text: 'Frequently Asked Questions',
//                         icon: SvgPicture.asset(
//                           AppAssetImages.sendSVGLogoDualTone,
//                           color: AppColors.primaryColor,
//                           height: 24,
//                           width: 24,
//                         ),
//                         onTap: () {}),
//                     AppGaps.hGap24,
//                     /* <---- 'Settings' list tile button ----> */
//                     CustomListTileMyAccountWidget(
//                         text: 'Settings',
//                         icon: SvgPicture.asset(
//                           AppAssetImages.settingSVGLogoDualTone,
//                           color: AppColors.primaryColor,
//                           height: 24,
//                           width: 24,
//                         ),
//                         onTap: () {
//                           Navigator.pushNamed(
//                               context, AppPageNames.settingScreen);
//                         }),
//                     AppGaps.hGap24,
//                     /* <---- 'Sign out' list tile button ----> */
//                     CustomListTileMyAccountWidget(
//                         text: 'Sign out',
//                         icon: SvgPicture.asset(
//                           AppAssetImages.logoutSVGLogoDualTone,
//                           color: AppColors.primaryColor,
//                           height: 24,
//                           width: 24,
//                         ),
//                         onTap: () {}),
//                     // Bottom extra spaces
//                     AppGaps.hGap30,
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:ai_dermatologist/app/constant.dart';
import 'package:ai_dermatologist/data_source/remote_data_storage/reponse/disease_response.dart';
import 'package:ai_dermatologist/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/constants/app_page_names.dart';
import '../../widgets/core_widgets.dart';
import '../../widgets/screen_widgets/my_account_screen_widgets.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;

  _signOut() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () async {
      await _auth.signOut().then((value) {
        setState(() {
          isLoading = false;
        });

        Navigator.pushNamedAndRemoveUntil(
            context, AppPageNames.signInScreen, (route) => false);
        Constant.users = Users();
        Constant.diseaseResponse = DiseaseResponse();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLoading ? AppColors.white : AppColors.primaryColor,
      /* <-------- Appbar --------> */
      appBar: isLoading
          ? null
          : CoreWidgets.appBarWidget(
              screenContext: context,
              hasBackButton: false,
              titleWidget: const Text('My Account'),
            ),
      /* <-------- Content --------> */
      body: isLoading
          ? SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Signing out...',
                      style: TextStyle(color: AppColors.primaryColor),
                    )
                  ]),
            )
          : CustomScaffoldBodyWidget2(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top extra spaces
                    AppGaps.hGap15,
                    /* <---- Profile picture, name, phone number, email address ----> */
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /* <---- Profile picture ----> */
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              /* <---- Circular profile picture widget ----> */
                              CircleAvatar(
                                backgroundImage: Constant.users!.profileUrl !=
                                        ""
                                    ? NetworkImage(Constant.users!.profileUrl!)
                                    : Image.asset(
                                        AppAssetImages.myAccountProfilePicture,
                                      ).image,
                                radius: 64,
                              ),
                              /* <---- Small edit circle icon button ----> */
                              Positioned(
                                bottom: 7,
                                right: -3,
                                child: IconButton(
                                  onPressed: () {
                                    // Tapping on it goes to edit my account screen
                                    Navigator.pushNamed(
                                      context,
                                      AppPageNames.editProfileScreen,
                                    );
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(
                                    minHeight: 34,
                                    minWidth: 34,
                                  ),
                                  icon: Container(
                                    height: 34,
                                    width: 34,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primaryColor,
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: SvgPicture.asset(
                                      AppAssetImages.editSVGLogoSolid,
                                      height: 14,
                                      width: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppGaps.hGap18,
                          /* <---- Profile name ----> */
                          Text(
                            "${Constant.users!.firstName!} ${Constant.users!.lastName!}",
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AppGaps.hGap8,
                          /* <---- Profile phone number ----> */
                          Text(
                            "+977 ${Constant.users!.phone!}",
                            style: const TextStyle(color: AppColors.white),
                          ),
                          AppGaps.hGap5,
                          /* <---- Profile email address ----> */
                          Text(
                            '${Constant.users!.email}',
                            style: const TextStyle(color: AppColors.white),
                          ),
                          AppGaps.hGap32,
                          /* <---- Horizontal dashed line ----> */
                          CustomHorizontalDashedLineWidget(
                            color: AppColors.darkColor.withOpacity(0.1),
                          ),
                          AppGaps.hGap5,
                          /* <---- List tiles wrapped with a Container ----> */

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppGaps.screenPaddingValue),
                            decoration: const BoxDecoration(
                                color: AppColors.container,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            child: Column(
                              children: [
                                AppGaps.hGap24,
                                /* <---- 'Save address' list tile button ----> */

                                /* <---- 'Terms & conditions' list tile button ----> */
                                CustomListTileMyAccountWidget(
                                  text: 'My Histories',
                                  icon: SvgPicture.asset(
                                    AppAssetImages.bookmarkSVGLogoDualTone,
                                    color: AppColors.primaryColor,
                                    height: 24,
                                    width: 24,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppPageNames.homeNavigatorScreen,
                                      // );
                                    );
                                  },
                                ),
                                AppGaps.hGap24,
                                /* <---- 'Frequently Asked Questions' list tile button ----> */
                                CustomListTileMyAccountWidget(
                                  text: 'Frequently Asked Questions',
                                  icon: SvgPicture.asset(
                                    AppAssetImages.sendSVGLogoDualTone,
                                    color: AppColors.primaryColor,
                                    height: 24,
                                    width: 24,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppPageNames.faqScreen,
                                    );
                                  },
                                ),
                                AppGaps.hGap24,
                                /* <---- 'Settings' list tile button ----> */
                                CustomListTileMyAccountWidget(
                                  text: 'Settings',
                                  icon: SvgPicture.asset(
                                    AppAssetImages.settingSVGLogoDualTone,
                                    color: AppColors.primaryColor,
                                    height: 24,
                                    width: 24,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppPageNames.settingScreen,
                                    );
                                  },
                                ),
                                AppGaps.hGap24,
                                /* <---- 'Sign out' list tile button ----> */
                                CustomListTileMyAccountWidget(
                                  text: 'Sign out',
                                  icon: SvgPicture.asset(
                                    AppAssetImages.logoutSVGLogoDualTone,
                                    color: AppColors.primaryColor,
                                    height: 24,
                                    width: 24,
                                  ),
                                  onTap: () {
                                    _signOut();
                                  },
                                ),
                                AppGaps.hGap90
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
    );
  }
}
