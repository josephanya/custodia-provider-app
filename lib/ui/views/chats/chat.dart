import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';
import 'package:custodia_provider/ui/views/chats/chat_vm.dart';
import 'package:custodia_provider/ui/widgets/utils/loader.dart';
import 'package:custodia_provider/ui/widgets/chats/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Chat extends ConsumerStatefulWidget {
  const Chat({
    Key? key,
    required this.patientID,
  }) : super(key: key);

  final String patientID;

  @override
  ConsumerState<Chat> createState() => _ChatState();
}

class _ChatState extends ConsumerState<Chat> {
  @override
  void initState() {
    super.initState();
    ref.read(chatProvider.notifier).initialize(patientID: widget.patientID);
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          // user has scrolled to the top
          ref.watch(chatProvider.notifier).fetchOldMessages(widget.patientID);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    ref.watch(chatProvider.notifier).disposeChat();
  }

  final TextEditingController _chatFieldTEC = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(chatProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: AppColors.white,
            width: .5.w,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 14.h,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 6.h,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 16,
                  color: AppColors.blue,
                ),
              ),
            ),
          ),
        ),
        title: provider.viewState.isLoading
            ? const Loader()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.blue,
                    foregroundColor: AppColors.white,
                    radius: 19.r,
                    child: Text(
                      '${provider.patient?.firstName[0].toUpperCase()}${provider.patient?.lastName[0].toUpperCase()}',
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                  const XMargin(12),
                  Text(
                    '${provider.patient?.firstName} ${provider.patient?.lastName}',
                    style: TextStyle(
                      fontSize: FontSize.s18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6.w, 3.h, 6.w, 0.h),
                  child: ListView.builder(
                    reverse: true,
                    itemCount: provider.messages?.length,
                    itemBuilder: (context, index) {
                      if (index == provider.messages?.length) {
                        return const Loader();
                      } else {
                        return MessageBubble(
                          content: provider.messages![index].content,
                          type: provider.messages![index].type,
                          isMe: provider.messages![index].senderID ==
                              ref.read(chatProvider.notifier).user.userID,
                          // time: provider.messages![index].timestamp,
                        );
                      }
                    },
                    controller: _scrollController,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        alignment: const Alignment(0.0, 1.0),
                        decoration: BoxDecoration(
                          color: AppColors.offWhite,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 6.h,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // Container(
                              //   width: 35.w,
                              //   height: 35.h,
                              //   decoration: BoxDecoration(
                              //     color: AppColors.blue,
                              //     border: Border.all(
                              //       color: AppColors.blue,
                              //     ),
                              //     borderRadius: const BorderRadius.all(
                              //       Radius.circular(35.r),
                              //     ),
                              //   ),
                              //   child: IconButton(
                              //     iconSize: 18,
                              //     icon: const Icon(Icons.add),
                              //     onPressed: () => CustomBottomSheet(
                              //       context: context,
                              //       body: const BottomSheet(),
                              //     ).modalBottomSheet(),
                              //     color: AppColors.white,
                              //   ),
                              // ),
                              const XMargin(10),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.5.h,
                                  ),
                                  child: TextField(
                                    maxLines: 3,
                                    minLines: 1,
                                    cursorColor: AppColors.blue,
                                    cursorWidth: 1.5,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      height: 1.32.h,
                                      fontSize: FontSize.s14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    controller: _chatFieldTEC,
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Type your message...',
                                      hintStyle: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: FontSize.s14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const XMargin(10),
                              GestureDetector(
                                onTap: () {
                                  ref.read(chatProvider.notifier).sendMessage(
                                      content: _chatFieldTEC.text.trim());
                                  _chatFieldTEC.clear();
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 8.h,
                                  ),
                                  child: Text(
                                    'Send',
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
