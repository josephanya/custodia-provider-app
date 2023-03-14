import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/patients/patients_list/patients_list_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/ui/widgets/patients_list_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';

final List patients = [
  {'name': 'Ezeogo Mang', 'info': '4783484 • Male'},
  {'name': 'Stephanie Ekwueme', 'info': '4783484 • Female'},
  {'name': 'Asemota Osaretin', 'info': '4783484 • Male'},
  {'name': 'Nosa Asemota', 'info': '4783484 • Male'},
  {'name': 'Jessica Moore', 'info': '4783484 • Female'},
];

class PatientsList extends ConsumerStatefulWidget {
  const PatientsList({super.key});

  @override
  ConsumerState<PatientsList> createState() => _PatientsListState();
}

class _PatientsListState extends ConsumerState<PatientsList> {
  @override
  void initState() {
    super.initState();
    ref.read(patientListProvider.notifier).initialize();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(patientListProvider);
    // final provider = ref.watch(patientListProvider);
    return Scaffold(
      // appBar: provider.isSearching
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
      //                 fontWeight: FontWeight.w600,
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
      //                 borderRadius: BorderRadius.circular(10),
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
      appBar: appBarWithoutBack(
        context,
        'Patients',
        // const SearchPatients(),
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
              : provider.patients == null || provider.viewState.isError
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 250,
                      ),
                      child: Column(
                        children: const [
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
                      itemBuilder: (context, index) => PatientsListCard(
                        name:
                            '${provider.patients?[index].firstName} ${provider.patients?[index].lastName}',
                        info: provider.patients?[index].gender,
                        patientModel: provider.patients?[index],
                      ),
                      itemCount: provider.patients?.length ?? 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const YMargin(30),
                    ),
        ),
      ),
    );
  }
}

// class SearchPatients extends ConsumerWidget {
//   const SearchPatients({
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
