import 'package:ai_dermatologist/utils/constants/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../app/constant.dart';
import '../../../screens/history/histories_screen.dart';

class HistoryFrontBodyWidget extends StatefulWidget {
  const HistoryFrontBodyWidget({Key? key}) : super(key: key);

  @override
  State<HistoryFrontBodyWidget> createState() => _HistoryFrontBodyWidgetState();
}

class _HistoryFrontBodyWidgetState extends State<HistoryFrontBodyWidget> {
  final firebaseFirestore = FirebaseFirestore.instance;

  final List<Map<String, dynamic>> headData = [];
  final List<Map<String, dynamic>> bodyData = [];
  final List<Map<String, dynamic>> rightArmData = [];
  final List<Map<String, dynamic>> leftArmData = [];
  final List<Map<String, dynamic>> rightLegData = [];
  final List<Map<String, dynamic>> leftLegData = [];

  _getReportData() async {
    final documents = await firebaseFirestore
        .collection('users')
        .doc(Constant.users!.id)
        .collection("reports")
        .get();

    for (var document in documents.docs) {
      final data = document.data();
      if (data['category'] == "Head" && data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();

          headData.add(data);
        });
      } else if (data['category'] == "Body" && data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();

          bodyData.add(data);
        });
      } else if (data['category'] == "Right Arm" &&
          data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();

          rightArmData.add(data);
        });
      } else if (data['category'] == "Left Arm" &&
          data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();

          leftArmData.add(data);
        });
      } else if (data['category'] == "Right Leg" &&
          data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();

          rightLegData.add(data);
        });
      } else if (data['category'] == "Left Leg" &&
          data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();

          leftLegData.add(data);
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _getReportData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: screenHeight,
            child: SizedBox(
              width: screenWidth *
                  0.5, // Adjusted the width to show half the image
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'History / Front',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/historybodyfront.png',
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.18,
            right: screenWidth * 0.32,
            child: BoxWidget(
              heading: 'Head',
              value: headData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (headData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No data found'),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Front / Head",
                              reportData: headData,
                            )),
                    (route) => true);
              },
            ),
          ),
          Positioned(
            top: screenHeight * 0.18,
            right: screenWidth * 0.03,
            child: BoxWidget(
              heading: 'Body',
              value: bodyData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (bodyData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No data found'),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Front / Body",
                              reportData: bodyData,
                            )),
                    (route) => true);
              },
            ),
          ),
          Positioned(
            top: screenHeight * 0.28,
            right: screenWidth * 0.03,
            child: BoxWidget(
              heading: 'Left Arm',
              value: leftArmData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (leftArmData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No data found'),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Back / Left Arm",
                              reportData: leftArmData,
                            )),
                    (route) => true);
              },
            ),
          ),
          Positioned(
            top: screenHeight * 0.28,
            right: screenWidth * 0.32,
            child: BoxWidget(
              heading: 'Right Arm',
              value: rightArmData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (rightArmData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No data found'),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Back / Right Arm",
                              reportData: rightArmData,
                            )),
                    (route) => true);
              },
            ),
          ),
          Positioned(
            top: screenHeight * 0.38,
            right: screenWidth * 0.32,
            child: BoxWidget(
              heading: 'Left Leg',
              value: leftLegData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (leftArmData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No data found'),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Back / Left Leg",
                              reportData: leftLegData,
                            )),
                    (route) => true);
              },
            ),
          ),
          Positioned(
            top: screenHeight * 0.38,
            right: screenWidth * 0.03,
            child: BoxWidget(
              heading: 'Right Leg',
              value: rightLegData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (rightLegData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No data found'),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Back / Right Leg",
                              reportData: rightLegData,
                            )),
                    (route) => true);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final String heading;
  final String value;
  final VoidCallback onPressed;

  const BoxWidget({
    Key? key,
    required this.heading,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF13204B),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  AppGaps.hGap10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.more_vert,
                          size: 16,
                          color: AppColors.white), // Replace with desired icon
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
