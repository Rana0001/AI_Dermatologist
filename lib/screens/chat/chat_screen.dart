import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data_source/remote_data_storage/chatbot_data.dart';
import '../../models/fake_models/chat_message_model.dart';
import '../../utils/constants/app_constants.dart';
import '../../widgets/core_widgets.dart';
import '../../widgets/screen_widgets/chat_screen_widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatMessageController = TextEditingController();

  List<FakeChatMessageModel> chatMessage = [];
  String message = "";

  _sendMessage() async {
    if (_chatMessageController.text.isNotEmpty) {
      setState(() {
        FakeChatMessageModel fakeChatMessageModel = FakeChatMessageModel(
          message: _chatMessageController.text,
          isMyMessage: true,
          audioUrl: null,
          dateTimeText: '',
        );
        chatMessage.add(fakeChatMessageModel);
      });
      message = await ChatBotData().getResponse(_chatMessageController.text);
      setState(() {
        FakeChatMessageModel fakeChatMessageModel = FakeChatMessageModel(
          message: message,
          isMyMessage: false,
          audioUrl: null,
          dateTimeText: '',
        );
        chatMessage.add(fakeChatMessageModel);
      });
      _chatMessageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a message")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInsetPaddingValue = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      extendBody: true,
      appBar: CoreWidgets.appBarWidget(
        backgroundColor: AppColors.primaryColor,
        screenContext: context,
        titleWidget:
            const Text('ChatBot', style: TextStyle(color: AppColors.white)),
        hasBackButton: true,
      ),
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     AppAssetImages.profilePic,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          SafeArea(
            bottom: false,
            child: Stack(
              children: [
                ClipPath(
                  clipper: CurvedContainerClipper(),
                  child: Container(
                    height: 100,
                    color: AppColors.primaryColor,
                  ),
                ),
                Positioned(
                  top: 22,
                  left: 160,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CircleAvatar(
                            backgroundImage: Image.asset(AppAssetImages.profilePic).image,
                          ),
                        ),
                        Positioned(
                          top: 7,
                          right: 0,
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 5, 181, 61),
                              shape: BoxShape.circle,
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
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.scaleDown,
                  image: Image.asset(AppAssetImages.chatIllustration, width: 275).image,
                ),
              ),
              child: SafeArea(
                bottom: true,
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 17, bottom: 30),
                  separatorBuilder: (context, index) => AppGaps.hGap24,
                  itemCount: chatMessage.length,
                  itemBuilder: (context, index) {
                    final FakeChatMessageModel deliveryManChatMessage =
                        chatMessage[index];
                    return ChatScreenWidgets.getCustomDeliveryChatWidget(
                      chatMessage: deliveryManChatMessage,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppGaps.bottomNavBarPadding.copyWith(
          bottom: AppGaps.minimumBottomPaddingValue + bottomInsetPaddingValue,
        ),
        child: CustomTextFormField(
          controller: _chatMessageController,
          hintText: 'Write message',
          prefixIcon: const SizedBox.shrink(),
          suffixIconConstraints: const BoxConstraints(maxHeight: 48),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppGaps.wGap8,
              CustomIconButtonWidget(
                child: SvgPicture.asset(
                  AppAssetImages.microphoneSVGLogoLine,
                  height: 24,
                  width: 24,
                  color: AppColors.bodyTextColor,
                ),
                onTap: () {},
              ),
              AppGaps.wGap8,
              CustomIconButtonWidget(
                backgroundColor: AppColors.primaryColor,
                hasShadow: true,
                child: Transform.scale(
                  scaleX: -1,
                  child: SvgPicture.asset(
                    AppAssetImages.arrowLeftSVGLogoLine,
                    color: Colors.white,
                    height: 16,
                    width: 16,
                  ),
                ),
                onTap: () {
                  _sendMessage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
