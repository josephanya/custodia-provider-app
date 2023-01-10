import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/utils/register_provider.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/patients_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List patients = [
  {'name': 'Ezeogo Mang', 'info': '4783484 • Male'},
  {'name': 'Stephanie Ekwueme', 'info': '4783484 • Female'},
  {'name': 'Asemota Osaretin', 'info': '4783484 • Male'},
  {'name': 'Nosa Asemota', 'info': '4783484 • Male'},
  {'name': 'Jessica Moore', 'info': '4783484 • Female'},
];

class PatientsList extends ConsumerWidget {
  const PatientsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(patientListProvider);
    return Scaffold(
      appBar: provider.isSearching
          ? SearchAppBar(
              buildActions: GestureDetector(
                onTap: () {
                  if (provider.searchTEC.text.isEmpty) {
                    provider.stopSearching(false);
                    return;
                  }
                  provider.clearSearchQuery();
                },
                child: const Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: blue,
                    ),
                  ),
                ),
              ),
              searchBar: Center(
                child: TextField(
                  controller: provider.searchTEC,
                  autofocus: true,
                  decoration: InputDecoration(
                    fillColor: offWhite,
                    focusColor: offWhite,
                    filled: true,
                    isDense: true,
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: offWhite,
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: grey),
                  ),
                  style: const TextStyle(
                    color: black,
                    fontSize: 15,
                  ),
                  onChanged: (query) => provider.updateSearchQuery,
                ),
              ),
            )
          : appBarWithActionWithoutBack(
              context,
              'Patients',
              const SearchPatients(),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const YMargin(25),
              ListView.separated(
                itemBuilder: (context, index) => PatientsListCard(
                  name: patients[index]['name'],
                  info: patients[index]['info'],
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

class SearchPatients extends ConsumerWidget {
  const SearchPatients({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(patientListProvider);
    return GestureDetector(
      onTap: () => provider.startSearch(true),
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
              Icons.search,
              size: 16,
              color: blue,
            ),
          ),
        ),
      ),
    );
  }
}
