import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/startup/startup_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Startup extends ConsumerStatefulWidget {
  const Startup({super.key});

  @override
  ConsumerState<Startup> createState() => _StartupState();
}

class _StartupState extends ConsumerState<Startup> {
  @override
  void initState() {
    super.initState();
    ref.read(startupProvider).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StartupBody(),
    );
  }
}

class StartupBody extends StatelessWidget {
  const StartupBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'logo',
        child: SvgPicture.asset(
          'images/logo.svg',
          color: blue,
          height: 32,
        ),
      ),
    );
  }
}
