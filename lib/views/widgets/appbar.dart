import 'package:flutter/material.dart';
import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';

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
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  size: 16,
                  color: blue,
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

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget buildActions, searchBar;

  const SearchAppBar(
      {super.key, required this.buildActions, required this.searchBar});

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
      decoration: BoxDecoration(
        color: white,
        border: Border.all(
          width: .5,
          color: white,
        ),
      ),
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
                Icons.arrow_back,
                size: 16,
                color: blue,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      shape: const Border(
        bottom: BorderSide(color: white, width: .5),
      ),
    );

appBarWithAction(context, title, action) => AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.maybePop(context),
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
                Icons.arrow_back,
                size: 16,
                color: blue,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [action],
      elevation: 0,
      centerTitle: true,
      shape: const Border(
        bottom: BorderSide(color: white, width: .5),
      ),
    );

appBarWithActionWithoutBack(context, title, action) => AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [action],
      elevation: 0,
      centerTitle: true,
      shape: const Border(
        bottom: BorderSide(color: white, width: .5),
      ),
    );

appBarWithoutBack(context, title) => AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      shape: const Border(
        bottom: BorderSide(color: white, width: .5),
      ),
    );
