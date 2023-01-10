import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/utils/register_provider.dart';
import 'package:custodia_provider/views/screens/home.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/buttons.dart';
import 'package:custodia_provider/views/widgets/textfield.dart';

class EditProfile extends ConsumerWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(editProfileProvider);
    return Scaffold(
      appBar: appBar(context, 'Edit Profile'),
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
              const YMargin(40),
              const Text(
                'Username',
                style: TextStyle(
                  fontSize: 14,
                  color: black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: lightGrey,
                    width: .5,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(13, 0, 6, 0),
                      child: Text(
                        '@',
                        style: TextStyle(fontSize: 14, color: grey),
                      ),
                    ),
                    Flexible(
                      child: SustainBorderlessTextField(
                        isTextArea: true,
                        isPassword: false,
                        autocorrect: false,
                        isEmail: false,
                        isPhone: false,
                        isNumber: false,
                        isEnabled: true,
                        hintText: 'Username',
                        controller: provider.usernameTEC,
                      ),
                    ),
                  ],
                ),
              ),
              const YMargin(35),
              const Text(
                'Bio',
                style: TextStyle(
                  fontSize: 14,
                  color: black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(10),
              SustainTextField(
                isTextArea: true,
                isPassword: false,
                autocorrect: false,
                isEmail: false,
                isPhone: false,
                isNumber: false,
                isEnabled: true,
                hintText: 'Add your bio',
                controller: provider.bioTEC,
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: PrimaryButton(
            buttonText: 'Save changes',
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
