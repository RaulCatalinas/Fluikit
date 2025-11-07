import 'dart:ui' show Size;

import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        PreferredSizeWidget,
        StatelessWidget,
        Widget,
        kToolbarHeight;

class FluiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  const FluiAppBar({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
