import 'package:flutter/material.dart';

import 'fake_models/chat_message_model.dart';
import 'fake_models/faq_models.dart';
import 'fake_models/how-to_use_model.dart';
import 'fake_models/intro_content_model.dart';
import 'fake_models/my_disease_model.dart';
import 'fake_models/my_history_model.dart';

class FakeData {
  // Intro screens
  static List<FakeIntroContent> fakeIntroContents = [
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/first2.png',
        slogan: 'Say No Doctor?',
        content:
            '"Check your skin from home. Save your time and life before detecting a mole early stage from the smartphone.'),
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/first3.png',
        slogan: 'Artificial Intelligence',
        content:
            'Check your skin on the smartphone by sending your photo to Artificial Intelligence and get instant results within 1 minute.'),
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/first4.png',
        slogan: 'Say No To Skin Disease',
        content:
            'Check you skin on the smartphone and get instant results within 1 minute.'),
  ];

  static List<FakeMyHistoryModel> myHistorys = [
    FakeMyHistoryModel(
        name: 'Cancer',
        price: '23.00',
        diseaseImage: Image.asset(
                'assets/images/demo_images/my_account_profile_picture.jpg')
            .image,
        dateText: '26 Dec, 2021'),
    FakeMyHistoryModel(
        name: 'Cancer',
        price: '23.00',
        diseaseImage: Image.asset(
                'assets/images/demo_images/my_account_profile_picture.jpg')
            .image,
        dateText: '26 Dec, 2021'),
  ];

  static List<FakeMyDiseaseModel> diesaseDescription = [
    FakeMyDiseaseModel(
        diseasename: 'Pre-Cancer: Seborrhea',
        diseaseImage: Image.asset(
                'assets/images/demo_images/my_account_profile_picture.jpg')
            .image,
        dateText: '26 Dec, 2021',
        riskassessment:
            'Signs of a potentially dangerous neoplasm that belongs to the group of precancerous skin conditions. You need to contact a dermatologist or oncologist for additional diagnosis. Never self-medicate.',
        result: '35% Precancerous Conditions',
        precisediagnosis: 'After Biopsy, the diagnosis is confirmed.',
        advice: 'Immediately consult a dermatologist'),
  ];

  static List<FakeFAQModel> fakeFAQs = [
    FakeFAQModel(
      questions: 'What is the most common type of cancer?',
      answers: 'The most common type of cancer is skin cancer.',
    ),
    FakeFAQModel(
      questions: 'What are the risk factors for developing cancer?',
      answers:
          'Risk factors for developing cancer include smoking, exposure to harmful chemicals, family history, and unhealthy lifestyle choices.',
    ),
    FakeFAQModel(
      questions: 'How can I reduce my risk of getting cancer?',
      answers:
          'You can reduce your risk of getting cancer by maintaining a healthy lifestyle, avoiding tobacco and excessive alcohol consumption, eating a balanced diet, and protecting yourself from harmful sun exposure.',
    ),
    // Add more questions and answers as needed
  ];
  static List<FakeHowToUseContent> fakeHowToUseContent = [
    FakeHowToUseContent(
        localSVGImageLocation: 'assets/htu/1.png',
        content:
            'Take a square photo with a mole in the center of the frame.'),
    FakeHowToUseContent(
        localSVGImageLocation: 'assets/htu/2.png',
        content:
            'The smallest possible distance (2-4” or 5-10 cm) for a clear frame'),
    FakeHowToUseContent(
        localSVGImageLocation: 'assets/htu/3.png',
        content:
            'The photo should be free of foreign objects (hair, jewelry, etc.'),
    FakeHowToUseContent(
        localSVGImageLocation: 'assets/htu/4.png',
        content:
            'Save results and track dynamics of the stored object'),
  ];
  // static List<FakeChatMessageModel> deliveryManChats = [
  //   FakeChatMessageModel(
  //     isMyMessage: false,
  //     message: 'Hey there?\nHow much time?',
  //     dateTimeText: '11:59 am',
  //   ),
  //   FakeChatMessageModel(
  //     isMyMessage: true,
  //     message: 'On my way sir.\nWill reach in 10 mins.',
  //     dateTimeText: '11:59 am',
  //   ),
  //   FakeChatMessageModel(
  //     isMyMessage: false,
  //     message: 'Ok come with carefully!\nRemember the address please!',
  //     dateTimeText: '11:59 am',
  //   ),
  //   FakeChatMessageModel(
  //     isMyMessage: true,
  //     message:
  //         'Btw, I want to know more about the room space and facilities & can I get some more picture of current.',
  //     dateTimeText: 'Sep 04 2020',
  //   ),
  //   FakeChatMessageModel(
  //     isMyMessage: false,
  //     message: 'Ok come with carefully!\nRemember the address please!',
  //     dateTimeText: '11:59 am',
  //   ),
  //   FakeChatMessageModel(
  //     isMyMessage: true,
  //     message:
  //         'Btw, I want to know more about the room space and facilities & can I get some more picture of current.',
  //     dateTimeText: 'Sep 04 2020',
  //   ),
  //   FakeChatMessageModel(
  //     isMyMessage: false,
  //     message: 'Ok come with carefully!\nRemember the address please!',
  //     dateTimeText: '11:59 am',
  //   ),
  //   FakeChatMessageModel(
  //     isMyMessage: true,
  //     message:
  //         'Btw, I want to know more about the room space and facilities & can I get some more picture of current.',
  //     dateTimeText: 'Sep 04 2020',
  //     audioUrl: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
  //   ),
  // ];


  
}
