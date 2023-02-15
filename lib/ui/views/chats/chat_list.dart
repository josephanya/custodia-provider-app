import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/patients/patients_list/patients_list_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/chats_list_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List patients = [
  {'name': 'Ezeogo Ude-Mang', 'last_message': 'Lol. I ran around my...'},
  {'name': 'Stephanie Ekwueme', 'last_message': 'Lol. I ran around my...'},
  {'name': 'Asemota Osaretin', 'last_message': 'Lol. I ran around my...'},
  {'name': 'Nosa Osariemen', 'last_message': 'Lol. I ran around my...'},
  {'name': 'Jessica Moore', 'last_message': 'Lol. I ran around my...'},
];

class ChatsList extends ConsumerWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final provider = ref.watch(patientListProvider);
    return Scaffold(
      appBar:
          //  provider.isSearching
          //     ? SearchAppBar(
          //         buildActions: GestureDetector(
          //           onTap: () {
          //             if (provider.searchTEC.text.isEmpty) {
          //               provider.stopSearching(false);
          //               return;
          //             }
          //             provider.clearSearchQuery();
          //           },
          //           child: const Center(
          //             child: Text(
          //               'Cancel',
          //               style: TextStyle(
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w500,
          //                 color: blue,
          //               ),
          //             ),
          //           ),
          //         ),
          //         searchBar: Center(
          //           child: TextField(
          //             controller: provider.searchTEC,
          //             autofocus: true,
          //             decoration: InputDecoration(
          //               fillColor: offWhite,
          //               focusColor: offWhite,
          //               filled: true,
          //               isDense: true,
          //               contentPadding: const EdgeInsets.all(12),
          //               border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(15),
          //                 borderSide: const BorderSide(
          //                   color: offWhite,
          //                 ),
          //               ),
          //               hintText: 'Search',
          //               hintStyle: const TextStyle(color: grey),
          //             ),
          //             style: const TextStyle(
          //               color: black,
          //               fontSize: 15,
          //             ),
          //             onChanged: (query) => provider.updateSearchQuery,
          //           ),
          //         ),
          //       )
          //     :
          appBarWithoutBack(
        context,
        'Chats',
        // const SearchChats(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const YMargin(25),
              ListView.separated(
                itemBuilder: (context, index) => ChatsListCard(
                  name: patients[index]['name'],
                  lastMessage: patients[index]['last_message'],
                ),
                itemCount: patients.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const YMargin(30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SearchChats extends ConsumerWidget {
//   const SearchChats({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final provider = ref.watch(patientListProvider);
//     return GestureDetector(
//       onTap: () => provider.startSearch(true),
//       child: Padding(
//         padding: const EdgeInsets.all(14.0),
//         child: Container(
//           decoration: const BoxDecoration(
//             color: lightBlue,
//             borderRadius: BorderRadius.all(
//               Radius.circular(20),
//             ),
//           ),
//           child: const Padding(
//             padding: EdgeInsets.all(6.0),
//             child: Icon(
//               Icons.search,
//               size: 16,
//               color: blue,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
