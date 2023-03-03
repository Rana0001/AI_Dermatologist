import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../app/constant.dart';
import '../../../screens/history/histories_screen.dart';

class FrontBodyWidget extends StatefulWidget {
  const FrontBodyWidget({super.key});

  @override
  State<FrontBodyWidget> createState() => _FrontBodyWidgetState();
}

class _FrontBodyWidgetState extends State<FrontBodyWidget> {
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
      if (data['category'] == "Head" && data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();
          _headData.add(data);
          setState(() {
            debugPrint(_headData.toString());
          });
        });
      } else if (data['category'] == "Body" && data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();

          _bodyData.add(data);
        });
      } else if (data['category'] == "Right Arm" &&
          data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();

          _rightArmData.add(data);
        });
      } else if (data['category'] == "Left Arm" &&
          data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();

          _leftArmData.add(data);
        });
      } else if (data['category'] == "Right Leg" &&
          data['body_face'] == 'Front') {
        setState(() {
          data['reportUID'] = document.id.toString();

          _rightLegData.add(data);
        });
      } else if (data['category'] == "Left Leg" &&
          data['body_face'] == 'Front') {
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
    return GestureDetector(
      onTap: () {
        // Navigate to another page when the body is tapped
        // Replace `AnotherPage()` with your desired page widget
        // Navigator.push(context, MaterialPageRoute(builder: (_) => AnotherPage()));
      },
      child: Stack(
        children: [
          Image.asset(
              'assets/front_image.png'), // Replace with your front body image
          Positioned(
            top: 1, // Adjust the position according to your image
            left: 140,
            child: CircleButtonWidget(
              value: _headData.length
                  .toString(), // Replace with the value you want to display
              onPressed: () {
                if (_headData.isEmpty) {
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
                              reportData: _headData,
                            )),
                    (route) => true);
              },
            ),
          ),
          Positioned(
            top: 120, // Adjust the position according to your image
            left: 140,
            child: CircleButtonWidget(
              value: _bodyData.length
                  .toString(), // Replace with the value you want to display
              onPressed: () {
                if (_bodyData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No data found'),
                    ),
                  );
                  return;
                }
                // Handle circle button press
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Front / Body",
                              reportData: _bodyData,
                            )),
                    (route) => true);
              },
            ),
          ),
          Positioned(
            top: 160, // Adjust the position according to your image
            left: 25,
            child: CircleButtonWidget(
              value: _rightArmData.length
                  .toString(), // Replace with the value you want to display
              onPressed: () {
                if (_rightArmData.isEmpty) {
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
                              bodyPart: "Front / Right Arm",
                              reportData: _rightArmData,
                            )),
                    (route) => true);
                // Handle circle button press
              },
            ),
          ),
          Positioned(
            top: 160, // Adjust the position according to your image
            left: 258,
            child: CircleButtonWidget(
              value: _leftArmData.length
                  .toString(), // Replace with the value you want to display
              onPressed: () {
                if (_leftArmData.isEmpty) {
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
                              bodyPart: "Front / Left Arm",
                              reportData: _leftArmData,
                            )),
                    (route) => true);
                // Handle circle button press
              },
            ),
          ),
          Positioned(
            top: 350, // Adjust the position according to your image
            left: 83,
            child: CircleButtonWidget(
              value: _rightLegData.length
                  .toString(), // Replace with the value you want to display
              onPressed: () {
                if (_rightLegData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No data found'),
                    ),
                  );
                  return;
                }
                // Handle circle button press
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Front / Right Leg",
                              reportData: _rightLegData,
                            )),
                    (route) => true);
              },
            ),
          ),
          Positioned(
            top: 350, // Adjust the position according to your image
            left: 193,
            child: CircleButtonWidget(
              value: _leftLegData.length
                  .toString(), // Replace with the value you want to display
              onPressed: () {
                if (_leftLegData.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No data found'),
                    ),
                  );
                  return;
                }
                // Handle circle button press
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MyHistoryScreen(
                              bodyPart: "Front / Left Leg",
                              reportData: _leftLegData,
                            )),
                    (route) => true);
              },
            ),
          ),

          // Add more positioned circles for other body parts
        ],
      ),
    );
  }
}

class CircleButtonWidget extends StatelessWidget {
  final String value;
  final VoidCallback onPressed;
  final bool isBig;

  const CircleButtonWidget({
    Key? key,
    required this.value,
    required this.onPressed,
    this.isBig = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double outerCircleSize = isBig ? 60 : 40;
    final double innerCircleSize = isBig ? 40 : 30;

    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: outerCircleSize,
        height: outerCircleSize,
        child: Stack(
          children: [
            Container(
              width: outerCircleSize,
              height: outerCircleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            Positioned(
              top: (outerCircleSize - innerCircleSize) / 2,
              left: (outerCircleSize - innerCircleSize) / 2,
              child: Container(
                width: innerCircleSize,
                height: innerCircleSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
