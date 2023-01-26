import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/profile/edit_profile/edit_profile_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/ui/views/home/home.dart';

class EditProfile extends ConsumerWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(editProfileProvider);
    return Scaffold(
      appBar: appBar(context, 'Edit photo'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: provider.image != null
                        ? FileImage(provider.image!)
                        : null,
                  ),
                ],
              ),
              const YMargin(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => provider.getImage(),
                    child: const Text(
                      'Change Photo',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: blue,
                      ),
                    ),
                  ),
                ],
              ),
              const YMargin(150),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: PrimaryButton(
            buttonText: 'Save',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
