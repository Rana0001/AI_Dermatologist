import 'package:ai_dermatologist/app/constant.dart';
import 'package:ai_dermatologist/models/reports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/constants/app_page_names.dart';
import '../../widgets/core_widgets.dart';

class PredictedAnalysisSaveFormScreen extends StatefulWidget {
  const PredictedAnalysisSaveFormScreen({Key? key}) : super(key: key);

  @override
  State<PredictedAnalysisSaveFormScreen> createState() =>
      _PredictedAnalysisSaveFormScreenState();
}

class _PredictedAnalysisSaveFormScreenState
    extends State<PredictedAnalysisSaveFormScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  bool isLoading = false;
  bool addToPreviousOptions = false;
  int? selectedCategory;
  int selectedBody = 0;
  // 0 represents front body, 1 represents back body
  String? bodyFace = 'Front';
  String? category = "Head";
  final _descriptionController = TextEditingController();

  /// Create a function to save the result using firebase
  _saveResult() async {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat.yMMMd().format(dateTime);
    setState(() {
      isLoading = true;
    });
    if (addToPreviousOptions == false) {
      Reports reports = Reports();

      reports.bodyFace = bodyFace;
      reports.category = category;
      reports.date = formattedDate;
      reports.descriptions = _descriptionController.text;
      reports.reportImgUrl = Constant.diseaseResponse.filename;
      reports.diseaseName = Constant.diseaseResponse.label;

      // Add the new category to the list of categories in firebase

      // .then((value) {

      try {
        _firebaseFirestore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('reports')
            .add(reports.toJson());
        setState(() {
          isLoading = false;
        });
        Navigator.pushNamed(
          context,
          AppPageNames.homeNavigatorScreen,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Report saved successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      Reports reports = Reports();

      reports.bodyFace = bodyFace;
      reports.category = category;
      reports.date = formattedDate;
      reports.descriptions = _descriptionController.text;
      reports.reportImgUrl = Constant.diseaseResponse.filename;
      reports.diseaseName = Constant.diseaseResponse.label;

      /// Replace add doc data
      final collectionDocs = _firebaseFirestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('reports');
      final documents = await _firebaseFirestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('reports')
          .get();

      for (var document in documents.docs) {
        await collectionDocs.doc(document.id).delete();
      }

      await _firebaseFirestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('reports')
          .add(reports.toJson())
          .then((value) {
        setState(() {
          isLoading = false;

          Navigator.pushNamed(
            context,
            AppPageNames.homeNavigatorScreen,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Report saved successfully'),
              backgroundColor: Colors.green,
            ),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLoading ? AppColors.white : AppColors.primaryColor,
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        hasBackButton: false,
        titleWidget: const Text(''),
      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppGaps.screenPaddingValue),
                            decoration: const BoxDecoration(
                                color: AppColors.container2,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            child: Column(
                              children: [
                                AppGaps.hGap24,
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        'Save Result',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                AppGaps.hGap5,
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        'To further track the dynamics of the stored object, you need to specify a name and save the result of the analysis.',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                AppGaps.hGap24,
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedBody = 0;
                                            bodyFace = 'Front';
                                          });
                                        },
                                        child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: selectedBody == 0
                                                ? AppColors.primaryColor
                                                : Colors.transparent,
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/front.png',
                                                height: 80,
                                                width: 80,
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Front',
                                                  style: TextStyle(
                                                    color: selectedBody == 0
                                                        ? AppColors.white
                                                        : AppColors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedBody = 1;
                                            bodyFace = 'Back';
                                          });
                                        },
                                        child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: selectedBody == 1
                                                ? AppColors.primaryColor
                                                : Colors.transparent,
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/back.png',
                                                height: 80,
                                                width: 80,
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Back',
                                                  style: TextStyle(
                                                    color: selectedBody == 1
                                                        ? AppColors.white
                                                        : AppColors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                AppGaps.hGap24,
                                CustomTextFormField(
                                  isReadOnly: true,
                                  labelText: 'Select Category',
                                  hintText: getCategoryText(selectedCategory),
                                  prefixIcon: AppGaps.emptyGap,
                                  suffixIcon: PopupMenuButton<int>(
                                    padding: const EdgeInsets.only(right: 5),
                                    position: PopupMenuPosition.under,
                                    child: CustomIconButtonWidget(
                                      fixedSize: const Size(20, 20),
                                      child: SvgPicture.asset(
                                        AppAssetImages.arrowDownSVGLogoLine,
                                        height: 12,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    itemBuilder: (context) => [
                                      PopupMenuItem<int>(
                                        value: 0,
                                        child: const Text(
                                          'Head',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedCategory = 0;
                                            category = "Head";
                                          });
                                        },
                                      ),
                                      PopupMenuItem<int>(
                                        value: 1,
                                        child: const Text(
                                          'Body',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedCategory = 1;
                                            category = "Body";
                                          });
                                        },
                                      ),
                                      PopupMenuItem<int>(
                                        value: 2,
                                        child: const Text(
                                          'Right Arm',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedCategory = 2;
                                            category = "Right Arm";
                                          });
                                        },
                                      ),
                                      PopupMenuItem<int>(
                                        value: 3,
                                        child: const Text(
                                          'Left Arm',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedCategory = 3;
                                            category = "Left Arm";
                                          });
                                        },
                                      ),
                                      PopupMenuItem<int>(
                                        value: 4,
                                        child: const Text(
                                          'Right Leg',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedCategory = 4;
                                            category = "Right Leg";
                                          });
                                        },
                                      ),
                                      PopupMenuItem<int>(
                                        value: 5,
                                        child: const Text(
                                          'Left Leg',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedCategory = 5;
                                            category = "Left Leg";
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                AppGaps.hGap15,
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Radio<int>(
                                          value: 0,
                                          groupValue:
                                              addToPreviousOptions ? null : 0,
                                          onChanged: (value) {
                                            setState(() {
                                              addToPreviousOptions = false;
                                            });
                                          },
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'New Result',
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              'Save object as a new result to the category',
                                              style: TextStyle(
                                                color: AppColors.bodyTextColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<int>(
                                          value: 1,
                                          groupValue:
                                              addToPreviousOptions ? 1 : null,
                                          onChanged: (value) {
                                            setState(() {
                                              addToPreviousOptions = true;
                                            });
                                          },
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Add to Previous',
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              'Save object to the existing result',
                                              style: TextStyle(
                                                color: AppColors.bodyTextColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap24,
                                CustomTextFormField(
                                  controller: _descriptionController,
                                  labelText: 'Save new object*',
                                  hintText: 'Scan Result 1',
                                  textInputType: TextInputType.text,
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.tasksquareSVG),
                                ),
                                AppGaps.hGap24,
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
      bottomNavigationBar: SafeArea(
        child: CustomScaffoldBottomBarWidget(
          backgroundColor: AppColors.container2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomStretchedButtonWidget(
                onTap: () {
                  _saveResult();
                },
                child: const Text('Save Result'),
              ),
              AppGaps.hGap10,
              CustomStretchedButtonWidget4(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppPageNames.homeNavigatorScreen,
                  );
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getCategoryText(int? category) {
    switch (category) {
      case 0:
        return 'Head';
      case 1:
        return 'Body';
      case 2:
        return 'Right Arm';
      case 3:
        return 'Left Arm';
      case 4:
        return 'Right Leg';
      case 5:
        return 'Left Leg';
      default:
        return 'Head';
    }
  }
}
