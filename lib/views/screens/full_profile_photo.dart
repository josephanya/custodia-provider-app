import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/theme/theme.dart';
import 'package:flutter/material.dart';

class FullProfilePhoto extends StatelessWidget {
  final String imageUrl;

  const FullProfilePhoto({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      appBar: AppBar(
        backgroundColor: darkGrey,
        leading: InkWell(
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
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(140),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: 280,
            width: 280,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
