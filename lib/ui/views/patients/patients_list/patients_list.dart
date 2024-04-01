import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/constants/custom_icons.dart';
import 'package:custodia_provider/ui/views/patients/patients_list/patients_list_vm.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/ui/widgets/utils/loader.dart';
import 'package:custodia_provider/ui/widgets/patients/patients_list_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';

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
      appBar: const SectionAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Patients',
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
              : provider.patients == null || provider.viewState.isError
                  ? Center(
                      child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50.w,
                        vertical: 180.h,
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 20.h,
                              ),
                              child: const Icon(
                                CustomIcon.profile,
                                size: 30,
                                color: AppColors.blue,
                              ),
                            ),
                          ),
                          const YMargin(16),
                          Text(
                            'No data yet',
                            style: TextStyle(
                              fontSize: FontSize.s18,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const YMargin(8),
                          Text(
                            'Your patients will show up here',
                            style: TextStyle(
                              fontSize: FontSize.s14,
                              color: AppColors.grey,
                              height: 1.35.h,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ))
                  : ListView.separated(
                      itemBuilder: (context, index) => PatientsListCard(
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
