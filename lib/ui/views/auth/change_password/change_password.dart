// import 'package:custodia_provider/ui/core/theme/theme.dart';
// import 'package:custodia_provider/ui/widgets/appbar.dart';
// import 'package:custodia_provider/ui/widgets/buttons.dart';
// import 'package:custodia_provider/ui/widgets/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:custodia_provider/utils/margin.dart';
// import 'package:custodia_provider/utils/register_provider.dart';
// import 'package:custodia_provider/utils/validator.dart';

// class ResetPassword extends ConsumerWidget {
//   const ResetPassword({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var provider = ref.watch(resetPasswordProvider);
//     return Scaffold(
//       appBar: const AppBarBorderless(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const YMargin(25),
//               const Text(
//                 'Forgot password',
//                 style: TextStyle(
//                   fontSize: 26,
//                   color: blue,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const YMargin(15),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 child: const Text(
//                   'Enter your email address and we’ll send your password reset link to you',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     height: 1.5,
//                   ),
//                 ),
//               ),
//               const YMargin(35),
//               Form(
//                 key: provider.formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Email',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: black,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const YMargin(10),
//                     SustainTextField(
//                       validator: (value) {
//                         if (Validator.isEmail(value!)) {
//                           return null;
//                         } else if (value.isEmpty) {
//                           return 'This field can\'t be left empty';
//                         } else {
//                           return 'Please enter a valid email';
//                         }
//                       },
//                       isTextArea: true,
//                       isPassword: false,
//                       autocorrect: false,
//                       isEmail: true,
//                       isPhone: false,
//                       isNumber: false,
//                       isEnabled: true,
//                       hintText: 'Email address',
//                       controller: provider.emailTEC,
//                     ),
//                   ],
//                 ),
//               ),
//               const YMargin(60),
//               PrimaryButton(
//                 buttonText: 'Send link',
//                 onPressed: () {},
//               ),
//               const YMargin(30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
