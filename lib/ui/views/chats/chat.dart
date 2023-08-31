import 'package:custodia_provider/ui/core/extensions/view_state.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/chats/chat_vm.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/ui/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
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
          // User has scrolled to the top
          ref.watch(chatProvider.notifier).fetchOldMessages(widget.patientID);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    ref.watch(chatProvider.notifier).clearMessages();
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
        shape: const Border(
          bottom: BorderSide(color: white, width: .5),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: const BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.arrow_back,
                  size: 16,
                  color: blue,
                ),
              ),
            ),
          ),
        ),
        title: GestureDetector(
          // onTap: () => Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>  PatientProfile(),
          //   ),
          // ),
          child: provider.viewState.isLoading
              ? const Loader()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: blue,
                      foregroundColor: white,
                      radius: 19,
                      child: Text(
                        '${provider.patient?.firstName[0].toUpperCase()}${provider.patient?.lastName[0].toUpperCase()}',
                      ),
                    ),
                    const XMargin(13),
                    Text(
                      '${provider.patient?.firstName} ${provider.patient?.lastName}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
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
                  padding: const EdgeInsets.fromLTRB(6, 3, 6, 0),
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
                          time: DateTime.now(),
                        );
                      }
                    },
                    controller: _scrollController,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        alignment: const Alignment(0.0, 1.0),
                        decoration: BoxDecoration(
                          color: offWhite,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // Container(
                              //   width: 35,
                              //   height: 35,
                              //   decoration: BoxDecoration(
                              //     color: blue,
                              //     border: Border.all(
                              //       color: blue,
                              //     ),
                              //     borderRadius: const BorderRadius.all(
                              //       Radius.circular(35),
                              //     ),
                              //   ),
                              //   child: IconButton(
                              //     iconSize: 18,
                              //     icon: const Icon(Icons.add),
                              //     onPressed: () => CustomBottomSheet(
                              //       context: context,
                              //       body: const Column(
                              //         children: [
                              //           Row(
                              //             children: [
                              //               Icon(
                              //                 CustomIcon.camera,
                              //                 size: 22,
                              //                 color: blue,
                              //               ),
                              //               XMargin(15),
                              //               Text(
                              //                 'Camera',
                              //                 style: TextStyle(
                              //                   fontWeight: FontWeight.w500,
                              //                   fontSize: 14,
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //           YMargin(33),
                              //           Row(
                              //             children: [
                              //               Icon(
                              //                 CustomIcon.gallery,
                              //                 size: 22,
                              //                 color: blue,
                              //               ),
                              //               XMargin(15),
                              //               Text(
                              //                 'Gallery',
                              //                 style: TextStyle(
                              //                   fontWeight: FontWeight.w500,
                              //                   fontSize: 14,
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ],
                              //       ),
                              //     ).modalBottomSheet(),
                              //     color: Colors.white,
                              //   ),
                              // ),
                              const XMargin(10),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.5,
                                  ),
                                  child: TextField(
                                    maxLines: 3,
                                    minLines: 1,
                                    cursorColor: blue,
                                    cursorWidth: 1.5,
                                    style: const TextStyle(
                                      color: black,
                                      height: 1.32,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    controller: _chatFieldTEC,
                                    decoration: const InputDecoration.collapsed(
                                      hintText: 'Type your message...',
                                      hintStyle: TextStyle(color: grey),
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
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    'Send',
                                    style: TextStyle(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w500,
                                      color: blue,
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
