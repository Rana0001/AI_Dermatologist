import 'package:ai_dermatologist/app/constant.dart';
import 'package:ai_dermatologist/screens/history/disease_description_screen.dart';
import 'package:ai_dermatologist/screens/home_navigator_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/app_constants.dart';
import '../../widgets/core_widgets.dart';

import '../../data_source/local_data_storage/disease_data.dart' as data;
import '../../widgets/screen_widgets/alertdialogue_widgets.dart';
import '../../widgets/screen_widgets/my_disease_desc_screen_widgets.dart';

class HistoryDiseaseDescScreen extends StatefulWidget {
  HistoryDiseaseDescScreen(
      {Key? key,
      this.diseaseName,
      this.reportDate,
      this.reportUrl,
      this.reportUid})
      : super(key: key);
  String? reportUid;
  String? diseaseName;
  String? reportUrl;
  String? reportDate;
  @override
  State<HistoryDiseaseDescScreen> createState() =>
      _HistoryDiseaseDescScreenState();
}

class _HistoryDiseaseDescScreenState extends State<HistoryDiseaseDescScreen> {
  Map<String, dynamic>? diseaseInfo;
  final _firebaseFirestore = FirebaseFirestore.instance;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    diseaseInfo = data.getDiseaseData(widget.diseaseName);
    debugPrint(widget.reportUid);
  }

  _deleteReportInfo() async {
    setState(() {
      isLoading = true;
    });
    Navigator.of(context).pop();

    await _firebaseFirestore
        .collection('users')
        .doc(Constant.users!.id)
        .collection('reports')
        .doc(widget.reportUid)
        .delete()
        .then((value) {
      setState(() {
        isLoading = false;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const HomeNavigatorScreen()),
            (route) => true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Report Deleted Successfully'),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLoading ? AppColors.white : AppColors.primaryColor,
      appBar: isLoading
          ? null
          : CoreWidgets.appBarWidget(
              screenContext: context,
              hasBackButton: true,
              titleWidget: const Text(''),
            ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            )
          : CustomScaffoldBodyWidget2(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: AppGaps.screenPaddingValue,
                      ),
                      child: Text(
                        'Prediction Overview',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
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
                          child: MyDiseaseDescWidget(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DiseaseDescriptionScreen(
                                            diseaseName: widget.diseaseName,
                                          )),
                                  (route) => true);
                            },
                            diseaseName: widget.diseaseName!,
                            diseaseImage: NetworkImage(
                                "${Constant.disease}${widget.reportUrl}"),
                            dateText: widget.reportDate!,
                            riskAssessment: diseaseInfo!['Risk Assessment'],
                            result: diseaseInfo!['Risk Management'],
                            preciseDiagnosis: diseaseInfo!['Precise Diagnosis'],
                            advice: diseaseInfo!['Advice'][0],
                          )))
                ],
              ),
            ),
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        backgroundColor: AppColors.container2,
        child: CustomStretchedButtonWidget2(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                  title: 'Confirmation',
                  message: 'Are you sure you want to delete the data?',
                  onDeletePressed: () {
                    // Add your delete logic here
                    _deleteReportInfo();
                  },
                  onCancelPressed: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
          child: const Text('Delete'),
        ),
      ),

      // bottomNavigationBar: CustomScaffoldBottomBarWidget(
      //   backgroundColor: AppColors.container2,
      //   child: CustomStretchedButtonWidget2(
      //     onTap: () {
      //       showDialog(
      //         context: context,
      //         builder: (BuildContext context) {
      //           return AlertDialog(
      //             title: const Text('Confirmation'),
      //             content: const Text('Are you sure you want to delete?'),
      //             actions: [
      //               TextButton(
      //                 onPressed: () {
      //                   Navigator.of(context).pop();
      //                 },
      //                 child: const Text('Cancel'),
      //               ),
      //               TextButton(
      //                 onPressed: () {
      //                   // Add your delete logic here
      //                   Navigator.of(context).pop();
      //                 },
      //                 child: const Text('Delete'),
      //               ),
      //             ],
      //           );
      //         },
      //       );
      //     },
      //     child: const Text('Delete'),
      //   ),
      // ),
    );
  }
}
