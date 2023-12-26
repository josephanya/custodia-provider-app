import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarBorderless extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBorderless({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(12, statusBarHeight, 12, 0),
      height: statusBarHeight + 56,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const XMargin(5),
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  size: 16,
                  color: AppColors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarBorderlessWithoutBack extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarBorderlessWithoutBack({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(12, statusBarHeight, 12, 0),
      height: statusBarHeight + 56,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
    );
  }
}

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(20, statusBarHeight, 20, 0),
      height: statusBarHeight + 56,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }
}

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget buildActions, searchBar;

  const SearchAppBar({
    super.key,
    required this.buildActions,
    required this.searchBar,
  });

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(12, statusBarHeight, 12, 0),
      height: statusBarHeight + 56,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: searchBar),
          const XMargin(12),
          buildActions,
        ],
      ),
    );
  }
}

appBar(context, title) => AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.maybePop(context),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
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
                Icons.arrow_back,
                size: 16,
                color: AppColors.blue,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: FontSize.s18,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      shape: Border(
        bottom: BorderSide(
          color: AppColors.white,
          width: .5.w,
        ),
      ),
    );

appBarWithAction(context, title, action) => AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.maybePop(context),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
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
                Icons.arrow_back,
                size: 16,
                color: AppColors.blue,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: FontSize.s18,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [action],
      elevation: 0,
      centerTitle: true,
      shape: Border(
        bottom: BorderSide(
          color: AppColors.white,
          width: .5.w,
        ),
      ),
    );

appBarWithActionWithoutBack(context, title, action) => AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: FontSize.s18,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [action],
      elevation: 0,
      centerTitle: true,
      shape: Border(
        bottom: BorderSide(
          color: AppColors.white,
          width: .5.w,
        ),
      ),
    );

appBarWithoutBack(context, title) => AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: FontSize.s18,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      shape: Border(
        bottom: BorderSide(
          color: AppColors.white,
          width: .5.w,
        ),
      ),
    );
