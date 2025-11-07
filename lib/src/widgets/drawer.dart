import 'package:flutter/material.dart'
    show
        BuildContext,
        Drawer,
        ListView,
        SizedBox,
        StatelessWidget,
        Widget,
        EdgeInsets;

class FluiDrawer extends StatelessWidget {
  final List<Widget> children;
  final double? height;
  final double? width;

  const FluiDrawer({
    super.key,
    required this.children,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: children),
      ),
    );
  }
}
