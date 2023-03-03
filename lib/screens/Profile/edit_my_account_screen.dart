import 'dart:io';

import 'package:ai_dermatologist/app/constant.dart';
import 'package:ai_dermatologist/models/users.dart';
import 'package:ai_dermatologist/utils/constants/app_page_names.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_gaps.dart';
import '../../utils/constants/app_images.dart';
import '../../widgets/core_widgets.dart';

class EditMyAccountScreen extends StatefulWidget {
  const EditMyAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditMyAccountScreen> createState() => _EditMyAccountScreenState();
}

class _EditMyAccountScreenState extends State<EditMyAccountScreen> {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;

  /// Create a TextEditingController for all field
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  bool isLoading = false;
  int? selectedGender;

  DateTime? selectedDate;
  File? img;

  Future _browseImage(ImageSource imageSource) async {
    try {
      // Source is either Gallary or Camera
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          // Open camera logic
                          _browseImage(ImageSource.camera);
                        },
                        title: const Text(
                          'Open Camera',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          // Open gallery logic
                          _browseImage(ImageSource.gallery);
                        },
                        title: const Text(
                          'Open Gallery',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        title: const Center(child: Text('Cancel')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  updateProfile() async {
    Reference ref = _firebaseStorage.ref("users/${Constant.users!.id}");

    await ref.putFile(img!);
    await ref.getDownloadURL().then((value) {
      setState(() {
        Constant.users!.profileUrl = value.toString();
      });
    });

    Users users = Users();
    users.firstName = _firstNameController.text == ''
        ? Constant.users!.firstName
        : _firstNameController.text;
    users.lastName = _lastNameController.text == ''
        ? Constant.users!.lastName
        : _lastNameController.text;
    users.email = _emailController.text == ''
        ? Constant.users!.email
        : _emailController.text;
    users.phone = _phoneController.text == ''
        ? Constant.users!.phone
        : _phoneController.text;
    users.gender = _genderController.text == ''
        ? Constant.users!.gender
        : _genderController.text;
    users.date = _dateController.text == ''
        ? Constant.users!.date
        : _dateController.text;

    users.id = Constant.users!.id;
    users.profileUrl = Constant.users!.profileUrl;
    setState(() {
      isLoading = true;
    });

    try {
      await _firebaseFirestore
          .collection('users')
          .doc(Constant.users!.id)
          .update(users.toJson())
          .then((value) {
        setState(() {
          isLoading = false;
          Navigator.pushNamed(context, AppPageNames.signInScreen);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Update up successfully',
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Logout successfully',
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green,
            ),
          );
          Constant.users = Users();
        });
      }).catchError((error) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Failed to update user',
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.redAccent,
            ),
          );
        });

        debugPrint("Failed to update user: $error");
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Failed to update user',
              style: TextStyle(color: Colors.white),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
          ),
        );
      });
      debugPrint("Failed to update user: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLoading ? AppColors.white : AppColors.primaryColor,
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          hasBackButton: true,
          titleWidget: const Text('Edit account')),
      /* <-------- Content --------> */
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
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              /* <---- Profile picture ----> */
                              CircleAvatar(
                                backgroundImage:
                                    Constant.users!.profileUrl != ""
                                        ? NetworkImage(
                                            "${Constant.users!.profileUrl}")
                                        : img != null
                                            ? Image.file(img!).image
                                            : Image.asset(
                                                AppAssetImages
                                                    .myAccountProfilePicture,
                                              ).image,
                                radius: 64,
                              ),
                              /* <---- Small camera circle icon button ----> */
                              Positioned(
                                  bottom: 7,
                                  right: -3,
                                  child: IconButton(
                                    onPressed: () {
                                      _showOptionsDialog(context);
                                    },
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                        minHeight: 34, minWidth: 34),
                                    icon: Container(
                                      height: 34,
                                      width: 34,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color.fromARGB(
                                              255, 236, 131, 99),
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: SvgPicture.asset(
                                        AppAssetImages.cameraSVGLogoSolid,
                                        height: 14,
                                        width: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          AppGaps.hGap18,
                          /* <---- Profile name ----> */
                          Text(
                              "${Constant.users!.firstName} ${Constant.users!.lastName}",
                              style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                          AppGaps.hGap8,
                          /* <---- Profile phone number ----> */
                          Text('+977 ${Constant.users!.phone}',
                              style: const TextStyle(color: AppColors.white)),
                          AppGaps.hGap5,
                          /* <---- Profile email address ----> */
                          Text(Constant.users!.email!,
                              style: const TextStyle(color: AppColors.white)),
                          AppGaps.hGap32,
                          CustomHorizontalDashedLineWidget(
                              color: AppColors.white.withOpacity(0.1)),
                          AppGaps.hGap5,
                          /* <---- Edit your name ----> */
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
                                  children: [
                                    Expanded(
                                      /* <---- Expiration date text field ----> */
                                      child: CustomTextFormField(
                                        controller: _firstNameController,
                                        labelText: 'First Name',
                                        prefixIcon: SvgPicture.asset(
                                            AppAssetImages.profileSVGLogoLine),
                                        hintText: 'Ram',
                                        textInputType: TextInputType.text,
                                      ),
                                    ),
                                    AppGaps.wGap10,
                                    Expanded(
                                      /* <---- CVV text field ----> */
                                      child: CustomTextFormField(
                                        controller: _lastNameController,
                                        labelText: 'Last Name',
                                        prefixIcon: SvgPicture.asset(
                                            AppAssetImages.profileSVGLogoLine),
                                        hintText: 'Sharma',
                                        textInputType: TextInputType.text,
                                      ),
                                    )
                                  ],
                                ),
                                AppGaps.hGap24,
                                /* <---- Edit your email address ----> */
                                CustomTextFormField(
                                  controller: _dateController,
                                  isReadOnly: true,
                                  onTap: () async {
                                    final pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate:
                                          DateTime(DateTime.now().year - 100),
                                      lastDate: DateTime.now(),
                                    );

                                    if (pickedDate != null) {
                                      setState(() {
                                        selectedDate = pickedDate;
                                        _dateController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(selectedDate!)
                                                .toString();
                                        debugPrint(_dateController
                                            .text); // Assign the selected date
                                      });
                                    }
                                  },
                                  labelText: 'Date of birth',
                                  hintText: selectedDate != null
                                      ? DateFormat('yyyy-MM-dd').format(
                                          selectedDate!) // Display the selected date
                                      : '2000-06-06',
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.calenderSVGLogoLine),
                                ),
                                AppGaps.hGap24,
                                /* <----  Phone number field ----> */
                                CustomTextFormField(
                                  controller: _phoneController,
                                  labelText: 'Phone Number',
                                  hintText: '98XXXXXXXX',
                                  textInputType: TextInputType.number,
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.phoneSVGLogoLine),
                                ),
                                AppGaps.hGap24,
                              ],
                            ),
                          ),
                          // AppGaps.hGap30,
                          // Bottom extra spaces
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
          backgroundColor: AppColors.container2,
          child: CustomStretchedButtonWidget(
            onTap: () {
              updateProfile();
            },
            child: const Text('Save changes'),
          )),
    );
  }

  String getGenderText(int? gender) {
    switch (gender) {
      case 0:
        return 'Others';
      case 1:
        return 'Male';
      case 2:
        return 'Female';
      default:
        return 'Others';
    }
  }
}
