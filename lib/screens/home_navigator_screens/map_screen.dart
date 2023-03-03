import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/constants/app_page_names.dart';
import '../../widgets/core_widgets.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                /* <---- Demo map location background image ----> */
                image: Image.asset(AppAssetImages.deliveryinfobackground).image,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionalTranslation(
              translation: const Offset(0.0, -0.6), // Adjust the offset value to move the widget up or down
              child: CustomScaffoldBottomBarWidget(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: AppColors.container3,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: Image.asset(AppAssetImages.profilePic).image,
                      ),
                      AppGaps.wGap16,
                      /* <---- Delivery man name and designation column ----> */
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Doctor AI',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                            AppGaps.hGap8,
                            Text(
                              'Chat with AI',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: AppColors.black),
                            ),
                          ],
                        ),
                      ),
                      /* <---- Delivery man call icon button ----> */
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppGaps.wGap5,
                          CustomIconButtonWidget(
                            fixedSize: const Size(20, 20),
                            onTap: () {
                              Navigator.pushNamed(context, AppPageNames.chatScreen);
                            },
                            child: SvgPicture.asset(
                              AppAssetImages.messageSVGLogoLine,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          AppGaps.wGap24,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          /* <---- Slide up notch widget ----> */
          Positioned(
            top: 580,
            child: SvgPicture.asset(
              AppAssetImages.slideUpPanelNotchSVG,
              color: AppColors.container3,
            ),
          ),
        ],
      ),
    );
  }
}
