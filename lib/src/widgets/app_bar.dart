import 'dart:ui' show Size;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Icons,
        PreferredSizeWidget,
        Scaffold,
        StatelessWidget,
        Widget,
        kToolbarHeight;

import 'icon_button.dart' show FluiIconButton;

class FluiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final IconData? drawerIcon;
  final double? drawerIconSize;
  final String? drawerIconTooltip;

  const FluiAppBar({
    super.key,
    required this.actions,
    this.drawerIcon,
    this.drawerIconSize,
    this.drawerIconTooltip,
  });

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.maybeOf(context);

    return AppBar(
      actions: actions,
      leading: scaffold != null && scaffold.hasDrawer
          ? FluiIconButton(
              icon: drawerIcon ?? Icons.reorder,
              iconSize: drawerIconSize ?? 24,
              tooltip: drawerIconTooltip,
              onPressed: () {
                scaffold.isDrawerOpen
                    ? scaffold.closeDrawer()
                    : scaffold.openDrawer();
              },
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
