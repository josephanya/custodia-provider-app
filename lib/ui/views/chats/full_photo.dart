import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:flutter/material.dart';

class FullPhoto extends StatelessWidget {
  final String path;

  const FullPhoto({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 58, 58, 58),
        leading: GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF3E474D),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: white,
                ),
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: CachedNetworkImage(
            placeholder: (context, url) => Container(
              decoration: const BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Center(
                child: Loader(),
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              'images/img_not_available.jpeg',
              fit: BoxFit.cover,
            ),
            imageUrl: path,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
