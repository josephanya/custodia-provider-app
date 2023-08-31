import 'package:custodia_provider/ui/core/extensions/view_state.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/chats/conversations/conversation_list_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/conversation_list_card.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
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
      appBar: appBarWithoutBack(
        context,
        'Chats',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: provider.viewState.isLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Loader(),
                  ),
                )
              : provider.conversations == null || provider.viewState.isError
                  ? const Center(
                      child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 250,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'No data yet',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          YMargin(14),
                          Text(
                            'Your patients will show up here',
                            style: TextStyle(color: grey, height: 1.35),
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
