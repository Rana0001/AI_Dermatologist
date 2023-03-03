import 'dart:io';

import 'package:ai_dermatologist/app/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/constants/app_page_names.dart';
import '../../widgets/core_widgets.dart';
import '../../widgets/screen_widgets/my_disease_desc_screen_widgets.dart';

import '../../data_source/local_data_storage/disease_data.dart' as data;

class UploadedImagePredictionScreen extends StatefulWidget {
  UploadedImagePredictionScreen({Key? key, this.img}) : super(key: key);
  File? img;
  @override
  State<UploadedImagePredictionScreen> createState() =>
      _UploadedImagePredictionScreenState();
}

class _UploadedImagePredictionScreenState
    extends State<UploadedImagePredictionScreen> {
  Map<String, dynamic>? diseaseInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    diseaseInfo = data.getDiseaseData(Constant.diseaseResponse.label);
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat.yMMMd().format(dateTime);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        hasBackButton: false,
        titleWidget: const Text(''),
      ),
      body: CustomScaffoldBodyWidget2(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  child: MyDiseaseDescWidget(
                    onTap: () {
                      Navigator.pushNamed(context,
                          AppPageNames.uploadedImagePredictionDetailsScreen);
                    },
                    diseaseName: Constant.diseaseResponse.label!,
                    diseaseImage: NetworkImage(
                        "${Constant.disease}${Constant.diseaseResponse.filename}"),
                    dateText: formattedDate,
                    riskAssessment: diseaseInfo!['Risk Assessment'],
                    result: diseaseInfo!['Risk Management'],
                    preciseDiagnosis: diseaseInfo!['Precise Diagnosis'],
                    advice: diseaseInfo!['Advice'][0],
                  )),
            ),
          ],
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
                  Navigator.pushNamed(
                      context, AppPageNames.analysissaveFormScreen);
                },
                child: const Text('Save Results'),
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
