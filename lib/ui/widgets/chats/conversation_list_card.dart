import 'package:custodia_provider/models/conversation_model.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/views/chats/conversations/conversation_list_vm.dart';
import 'package:custodia_provider/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ConversationListCard extends ConsumerWidget {
  const ConversationListCard({
    Key? key,
    required this.conversationModel,
  }) : super(key: key);

  final ConversationModel conversationModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(conversationListProvider.notifier);
    final redactedText =
        UtilityFunctions.redactString(conversationModel.lastMessage);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => provider.goToChatView(
        conversationModel.patientID,
        conversationModel.conversationID,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.blue,
                foregroundColor: AppColors.white,
                radius: 23.r,
                child: Text(
                  '${conversationModel.firstName[0].toUpperCase()}${conversationModel.lastName[0].toUpperCase()}',
                  style: TextStyle(
                    fontSize: FontSize.s15,
                  ),
                ),
              ),
              const XMargin(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${conversationModel.firstName} ${conversationModel.lastName} ',
                        style: TextStyle(
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const XMargin(4),
                      if (conversationModel.hasUnreadMessage)
                        const CircleAvatar(
                          backgroundColor: AppColors.blue,
                          radius: 3.5,
                        ),
                    ],
                  ),
                  const YMargin(4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      redactedText,
                      style: TextStyle(
                        fontSize: FontSize.s12,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const YMargin(3),
              Text(
                DateFormat('MMM dd, hh:mm aaa')
                    .format(conversationModel.lastMessageTime),
                style: TextStyle(
                  fontSize: FontSize.s12,
                  color: AppColors.grey,
                ),
              ),
              const YMargin(6),
            ],
          )
        ],
      ),
    );
  }
}
