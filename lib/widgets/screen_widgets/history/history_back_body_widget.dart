import 'package:ai_dermatologist/utils/constants/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../app/constant.dart';
import '../../../screens/history/histories_screen.dart';

class HistoryBackBodyWidget extends StatefulWidget {
  const HistoryBackBodyWidget({Key? key}) : super(key: key);

  @override
  State<HistoryBackBodyWidget> createState() => _HistoryBackBodyWidgetState();
}

class _HistoryBackBodyWidgetState extends State<HistoryBackBodyWidget> {
  final firebaseFirestore = FirebaseFirestore.instance;

  final List<Map<String, dynamic>> _headData = [];
  final List<Map<String, dynamic>> _bodyData = [];
  final List<Map<String, dynamic>> _rightArmData = [];
  final List<Map<String, dynamic>> _leftArmData = [];
  final List<Map<String, dynamic>> _rightLegData = [];
  final List<Map<String, dynamic>> _leftLegData = [];

  _getReportData() async {
    final documents = await firebaseFirestore
        .collection('users')
        .doc(Constant.users!.id)
        .collection("reports")
        .get();

    for (var document in documents.docs) {
      final data = document.data();
      if (data['category'] == "Head" && data['body_face'] == 'Back') {
        setState(() {
          data['reportUID'] = document.id.toString();

          _headData.add(data);
        });
      } else if (data['category'] == "Body" && data['body_face'] == 'Back') {
        setState(() {
          data['reportUID'] = document.id.toString();

          _bodyData.add(data);
        });
      } else if (data['category'] == "Right Arm" &&
          data['body_face'] == 'Back') {
        setState(() {
          data['reportUID'] = document.id.toString();

          _rightArmData.add(data);
        });
      } else if (data['category'] == "Left Arm" &&
          data['body_face'] == 'Back') {
        setState(() {
          data['reportUID'] = document.id.toString();

          _leftArmData.add(data);
        });
      } else if (data['category'] == "Right Leg" &&
          data['body_face'] == 'Back') {
        setState(() {
          data['reportUID'] = document.id.toString();

          _rightLegData.add(data);
        });
      } else if (data['category'] == "Left Leg" &&
          data['body_face'] == 'Back') {
        setState(() {
          data['reportUID'] = document.id.toString();

          _leftLegData.add(data);
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
                    'History / Back',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/historybodyback.png',
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
              value: _headData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (_headData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No data found"),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Back / Head",
                              reportData: _headData,
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
              value: _bodyData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (_bodyData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No data found"),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Back / Body",
                              reportData: _bodyData,
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
              value: _leftArmData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (_leftArmData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No data found"),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Back / Left Arm",
                              reportData: _leftArmData,
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
              value: _rightArmData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (_rightArmData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No data found"),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Back / Right Arm",
                              reportData: _rightArmData,
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
              value: _leftLegData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (_leftLegData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No data found"),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Back / Left Leg",
                              reportData: _leftLegData,
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
              value: _rightLegData.length.toString(),
              onPressed: () {
                // Navigate to another page
                if (_rightLegData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No data found"),
                    ),
                  );
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Back / Right Leg",
                              reportData: _rightLegData,
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
