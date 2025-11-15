import 'package:flutter/material.dart'
    show
        BuildContext,
        LinearProgressIndicator,
        State,
        StatefulWidget,
        Widget,
        Color;

class FluiProgressBar extends StatefulWidget {
  final double? progress;
  final Color? progressBarColor;

  const FluiProgressBar({super.key, this.progress = 0, this.progressBarColor});

  @override
  State<StatefulWidget> createState() => FluiProgressBarState();
}

class FluiProgressBarState extends State<FluiProgressBar> {
  late double? _progress;

  @override
  void initState() {
    super.initState();
    _progress = widget.progress;
  }

  void toggleState() {
    setState(() {
      _progress = _progress == null ? 0 : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _progress,
      color: widget.progressBarColor,
    );
  }
}
