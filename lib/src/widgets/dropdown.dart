import 'package:flutter/material.dart'
    show
        BuildContext,
        Container,
        DropdownMenu,
        DropdownMenuEntry,
        State,
        StatefulWidget,
        Widget;

class FluiDropdown<T> extends StatefulWidget {
  final List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  final void Function(T?)? onSelected;
  final bool? initiallyVisible;
  final String? placeHolder;

  const FluiDropdown({
    super.key,
    this.initiallyVisible,
    this.placeHolder,
    required this.dropdownMenuEntries,
    required this.onSelected,
  });

  @override
  State<FluiDropdown> createState() => FluiDropdownState();
}

class FluiDropdownState extends State<FluiDropdown> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = widget.initiallyVisible!;
  }

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void closeIfOpen() {
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isVisible) {
      return Container();
    }

    return DropdownMenu(
      dropdownMenuEntries: widget.dropdownMenuEntries,
      onSelected: widget.onSelected,
      hintText: widget.placeHolder,
    );
  }
}
