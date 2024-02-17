import 'package:flutter/material.dart';

import '../SearchScreen.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const AppBarWidget(this.title, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}
