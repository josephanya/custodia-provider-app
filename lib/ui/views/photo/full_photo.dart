import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullPhoto extends StatelessWidget {
  final String path;

  const FullPhoto({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 32, 32, 32),
        leading: GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 14.h,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF3E474D),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 6.h,
                ),
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: CachedNetworkImage(
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
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
