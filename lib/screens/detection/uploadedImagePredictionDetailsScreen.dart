import 'package:ai_dermatologist/app/constant.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/constants/description_data.dart';
import '../../widgets/core_widgets.dart';
import '../../widgets/screen_widgets/disease_description_widget.dart';
import 'package:ai_dermatologist/data_source/local_data_storage/disease_data.dart'
    as diseaseData;

class UploadedImagePredictionDetailsScreen extends StatefulWidget {
  const UploadedImagePredictionDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UploadedImagePredictionDetailsScreen> createState() =>
      _UploadedImagePredictionDetailsScreenState();
}

class _UploadedImagePredictionDetailsScreenState
    extends State<UploadedImagePredictionDetailsScreen> {
  Map<String, dynamic>? _diseaseDiscriptions;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _diseaseDiscriptions =
        diseaseData.getDiseaseInfo(Constant.diseaseResponse.label!);
  }

  /// Get delivered order stepper widget based on current order status
  Widget _title(String title) {
    switch (title) {
      case DescriptionData.title:
        return StepperEnabledWidget(
            topicText: 'Disease',
            topicDescriptionText: _diseaseDiscriptions!['Disease']);
      default:
        return StepperDisabledWidget(
            topicText: 'Disease',
            topicDescriptionText: _diseaseDiscriptions!['Disease']);
    }
  }

  /// Get processing order stepper widget based on current order status
  Widget _predisposingFactors(String descriptionStatus) {
    switch (descriptionStatus) {
      case DescriptionData.title:
      case DescriptionData.predisposingFactors:
        return StepperEnabledWidget(
          topicText: 'Predisposing Factors:',
          topicDescriptionText: _diseaseDiscriptions!['Predisposing factors'],
        );
      default:
        return StepperDisabledWidget(
          topicText: 'Predisposing Factors:',
          topicDescriptionText: _diseaseDiscriptions!['Predisposing factors'],
        );
    }
  }

  /// Get confirmed order stepper widget based on current order status
  Widget _diagnostics(String descriptionStatus) {
    switch (descriptionStatus) {
      case DescriptionData.title:
      case DescriptionData.predisposingFactors:
      case DescriptionData.diagnostics:
        return StepperEnabledWidget(
            topicText: 'Diagnostics',
            topicDescriptionText: _diseaseDiscriptions!['Diagnostics']);
      default:
        return StepperDisabledWidget(
            topicText: 'Diagnostics',
            topicDescriptionText: _diseaseDiscriptions!['Diagnostics']);
    }
  }

  /// Get pending order stepper widget based on current order status
  Widget _symptoms(String descriptionStatus) {
    switch (descriptionStatus) {
      case DescriptionData.title:
      case DescriptionData.predisposingFactors:
      case DescriptionData.diagnostics:
      case DescriptionData.symptoms:
        return StepperEnabledWidget(
            topicText: 'Symptoms',
            topicDescriptionText: _diseaseDiscriptions!['Symptoms']);
      default:
        return StepperDisabledWidget(
            topicText: 'Symptoms',
            topicDescriptionText: _diseaseDiscriptions!['Symptoms']);
    }
  }

  /// Get placed order stepper widget based on current order status
  Widget _dermatoscopicDescription(String descriptionStatus) {
    switch (descriptionStatus) {
      case DescriptionData.dermatoscopicDescription:
      case DescriptionData.title:
      case DescriptionData.predisposingFactors:
      case DescriptionData.diagnostics:
      case DescriptionData.symptoms:
        return StepperEnabledWidget(
            topicText: 'Dermatoscopic Description',
            topicDescriptionText:
                _diseaseDiscriptions!['Dermatoscopic description']);
      default:
        return StepperDisabledWidget(
            topicText: 'Dermatoscopic Description',
            topicDescriptionText:
                _diseaseDiscriptions!['Dermatoscopic description']);
    }
  }

  Widget _differentialDiagnosis(String descriptionStatus) {
    switch (descriptionStatus) {
      case DescriptionData.differentialDiagnosis:
      case DescriptionData.dermatoscopicDescription:
      case DescriptionData.title:
      case DescriptionData.predisposingFactors:
      case DescriptionData.diagnostics:
      case DescriptionData.symptoms:
        return StepperEnabledWidget(
            topicText: 'Differential Diagnosis:',
            topicDescriptionText:
                _diseaseDiscriptions!["Differential diagnosis"]);
      default:
        return StepperDisabledWidget(
            topicText: 'Differential Diagnosis:',
            topicDescriptionText:
                _diseaseDiscriptions!["Differential diagnosis"]);
    }
  }

  Widget _risks(String descriptionStatus) {
    switch (descriptionStatus) {
      case DescriptionData.risks:
      case DescriptionData.differentialDiagnosis:
      case DescriptionData.dermatoscopicDescription:
      case DescriptionData.title:
      case DescriptionData.predisposingFactors:
      case DescriptionData.diagnostics:
      case DescriptionData.symptoms:
        return StepperEnabledWidget(
            topicText: 'Risks',
            topicDescriptionText: _diseaseDiscriptions!['Risks']);
      default:
        return StepperDisabledWidget(
            topicText: 'Risks',
            topicDescriptionText: _diseaseDiscriptions!['Risks']);
    }
  }

  Widget _tactics(String descriptionStatus) {
    switch (descriptionStatus) {
      case DescriptionData.tactics:
      case DescriptionData.risks:
      case DescriptionData.differentialDiagnosis:
      case DescriptionData.dermatoscopicDescription:
      case DescriptionData.title:
      case DescriptionData.predisposingFactors:
      case DescriptionData.diagnostics:
      case DescriptionData.symptoms:
        return StepperEnabledWidget(
            topicText: 'Tactics',
            topicDescriptionText: _diseaseDiscriptions!['Tactics']);
      default:
        return StepperDisabledWidget(
            topicText: 'Tactics',
            topicDescriptionText: _diseaseDiscriptions!['Tactics']);
    }
  }

  Widget _treatment(String descriptionStatus) {
    switch (descriptionStatus) {
      case DescriptionData.treatment:
      case DescriptionData.tactics:
      case DescriptionData.risks:
      case DescriptionData.differentialDiagnosis:
      case DescriptionData.dermatoscopicDescription:
      case DescriptionData.title:
      case DescriptionData.predisposingFactors:
      case DescriptionData.diagnostics:
      case DescriptionData.symptoms:
        return StepperEnabledWidget(
            topicText: 'Treatment',
            topicDescriptionText: _diseaseDiscriptions!['Treatment']);
      default:
        return StepperDisabledWidget(
            topicText: 'Treatment',
            topicDescriptionText: _diseaseDiscriptions!['Treatment']);
    }
  }

  Widget _prevention(String descriptionStatus) {
    switch (descriptionStatus) {
      case DescriptionData.prevention:
      case DescriptionData.treatment:
      case DescriptionData.tactics:
      case DescriptionData.risks:
      case DescriptionData.differentialDiagnosis:
      case DescriptionData.dermatoscopicDescription:
      case DescriptionData.title:
      case DescriptionData.predisposingFactors:
      case DescriptionData.diagnostics:
      case DescriptionData.symptoms:
        return StepperEnabledWidget(
            topicText: 'Prevention',
            topicDescriptionText: _diseaseDiscriptions!['Prevention']);
      default:
        return StepperDisabledWidget(
            topicText: 'Prevention',
            topicDescriptionText: _diseaseDiscriptions!['Prevention']);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Current order status set to delivered for demo purpose
    const String descriptionStatus = DescriptionData.title;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        titleWidget: const Text(''),
      ),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget2(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap10,
              const Center(
                child: Text(
                  'Disease Description',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              AppGaps.hGap15,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppGaps.screenPaddingValue,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.container3,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top extra spaces
                    AppGaps.hGap25,
                    /* <---- Order product name ----> */
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Constant.diseaseResponse.label!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    AppGaps.hGap24,
                    /* <---- Order placed status ----> */
                    _title(descriptionStatus),
                    AppGaps.hGap15,
                    /* <---- Order placed status ----> */
                    _predisposingFactors(descriptionStatus),
                    AppGaps.hGap15,
                    /* <---- Order pending status ----> */
                    _diagnostics(descriptionStatus),
                    AppGaps.hGap15,
                    /* <---- Order confirmed status ----> */
                    _symptoms(descriptionStatus),
                    AppGaps.hGap15,
                    /* <---- Order processing status ----> */
                    _dermatoscopicDescription(descriptionStatus),
                    AppGaps.hGap15,
                    /* <---- Order delivered status ----> */
                    _differentialDiagnosis(descriptionStatus),
                    AppGaps.hGap15,
                    /* <---- Order delivered status ----> */
                    _risks(descriptionStatus),
                    AppGaps.hGap15,
                    /* <---- Order delivered status ----> */
                    _tactics(descriptionStatus),
                    AppGaps.hGap15,
                    /* <---- Order delivered status ----> */
                    _treatment(descriptionStatus),
                    AppGaps.hGap15,
                    /* <---- Order delivered status ----> */
                    _prevention(descriptionStatus),
                    // Bottom extra spaces
                    AppGaps.hGap30,
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
