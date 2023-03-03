// import 'package:flutter/material.dart';
// import '../../utils/constants/app_constants.dart';
// import '../../utils/constants/app_page_names.dart';
// import '../../widgets/core_widgets.dart';

// class ImageUploadedScreen extends StatefulWidget {
//   const ImageUploadedScreen({Key? key}) : super(key: key);

//   @override
//   State<ImageUploadedScreen> createState() => _ImageUploadedScreenState();
// }

// class _ImageUploadedScreenState extends State<ImageUploadedScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       appBar: CoreWidgets.appBarWidget(
//         screenContext: context,
//         hasBackButton: false,
//         titleWidget: const Text(''),
//       ),
//       body: SafeArea(
//         child: CustomScaffoldBodyWidget2(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppGaps.hGap15,
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: AppGaps.screenPaddingValue,
//                   ),
//                   decoration: const BoxDecoration(
//                     color: AppColors.container2,
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
//                   ),
//                   child: Column(
//                     children: [
//                       AppGaps.hGap24,
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: const [
//                           Expanded(
//                             child: Text(
//                               'Image Uploaded',
//                               style: TextStyle(
//                                 color: AppColors.primaryColor,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       AppGaps.hGap20,
//                     Container(
//                       width: 420,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryColor,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Text(
//                             'Uploading photo...',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     AppGaps.hGap10,
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 5),
//                       ),
//                     ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         child: CustomScaffoldBottomBarWidget(
//           backgroundColor: AppColors.container2,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               CustomStretchedButtonWidget(
//                 onTap: () {
//                   // Handle 'Done' button tap
//                 },
//                 child: const Text('View Results'),
//               ),
//               AppGaps.hGap10,
//               CustomStretchedButtonWidget4(
//                 onTap: () {
//                       Navigator.pushNamed(context, AppPageNames.homeNavigatorScreen);

//                 },
//                 child: const Text('Cancel'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:ai_dermatologist/data_source/remote_data_storage/disease_data.dart';
import 'package:ai_dermatologist/screens/detection/uploadedImagePredictionScreen.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/constants/app_page_names.dart';
import '../../widgets/core_widgets.dart';

class ImageUploadedScreen extends StatefulWidget {
  ImageUploadedScreen({
    Key? key,
    this.img,
  }) : super(key: key);
  File? img;
  @override
  State<ImageUploadedScreen> createState() => _ImageUploadedScreenState();
}

class _ImageUploadedScreenState extends State<ImageUploadedScreen> {
  bool isLoading = false;
  DiseaseData diseaseData = DiseaseData();

  _viewResult() async {
    int result = await diseaseData.predictDisease(widget.img);
    _showResult(result);
  }

  _showResult(int value) {
    if (value == 1) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => UploadedImagePredictionScreen(
                    img: widget.img,
                  )),
          (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.img == null) {
      setState(() {
        isLoading = true;
      });
      Future.delayed(const Duration(seconds: 3), () async {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLoading ? AppColors.white : AppColors.primaryColor,
      appBar: isLoading
          ? null
          : CoreWidgets.appBarWidget(
              screenContext: context,
              hasBackButton: false,
              titleWidget: const Text(''),
            ),
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  AppGaps.hGap10,
                  Text('Uploading photo...'),
                ],
              ),
            )
          : SafeArea(
              child: CustomScaffoldBodyWidget2(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppGaps.hGap15,
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppGaps.screenPaddingValue,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.container2,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(28)),
                        ),
                        child: Column(
                          children: [
                            AppGaps.hGap24,
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Image Uploaded',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AppGaps.hGap20,
                            Container(
                              width: 420,
                              height: 150,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20), // Add left padding
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: FileImage(widget.img!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Expanded(
                                    child: Text(
                                      'Image is suitalble for analysis. ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 1), // Add left padding
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                ],
                              ),
                            ),
                            AppGaps.hGap10,
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'The application has analyzed your photo. Press \'View Results\' to see the results. ',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: SafeArea(
        child: CustomScaffoldBottomBarWidget(
          backgroundColor: AppColors.container2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomStretchedButtonWidget(
                onTap: () {
                  _viewResult();
                },
                child: const Text('View Results'),
              ),
              AppGaps.hGap10,
              CustomStretchedButtonWidget4(
                onTap: () {
                  Navigator.pushNamed(
                      context, AppPageNames.homeNavigatorScreen);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
