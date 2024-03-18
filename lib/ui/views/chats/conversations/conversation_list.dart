import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';
import 'package:custodia_provider/ui/views/chats/conversations/conversation_list_vm.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/ui/widgets/chats/conversation_list_card.dart';
import 'package:custodia_provider/ui/widgets/utils/loader.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConversationList extends ConsumerStatefulWidget {
  const ConversationList({super.key});

  @override
  ConsumerState<ConversationList> createState() => _ConversationsListState();
}

class _ConversationsListState extends ConsumerState<ConversationList> {
  @override
  void initState() {
    super.initState();
    ref.read(conversationListProvider.notifier).initialize();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(conversationListProvider);
    return Scaffold(
      appBar: const SectionAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: provider.viewState.isLoading
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: const Loader(),
                  ),
                )
              : provider.conversations == null || provider.viewState.isError
                  ? Center(
                      child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50.w,
                        vertical: 250.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'No data yet',
                            style: TextStyle(
                              fontSize: FontSize.s18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const YMargin(12),
                          Text(
                            'Your patients will show up here',
                            style: TextStyle(
                              color: AppColors.grey,
                              height: 1.35.h,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ))
                  : ListView.separated(
                      itemBuilder: (context, index) => ConversationListCard(
                        conversationModel: provider.conversations?[index],
                      ),
                      itemCount: provider.conversations?.length ?? 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const YMargin(30),
                    ),
        ),
      ),
    );
  }
}
