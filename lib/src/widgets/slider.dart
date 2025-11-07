import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Color,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        MainAxisAlignment,
        MainAxisSize,
        Padding,
        RoundSliderThumbShape,
        RoundedRectSliderTrackShape,
        Row,
        SizedBox,
        Slider,
        SliderTheme,
        SliderThemeData,
        State,
        StatefulWidget,
        ValueChanged,
        Widget;

import 'text.dart' show CreateText;

class CreateSlider extends StatefulWidget {
  final String label;
  final double initialValue;
  final double minValue;
  final double maxValue;
  final ValueChanged<double>? onChanged;
  final String Function(double value)? valueFormatter;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final double borderRadius;
  final EdgeInsets padding;

  const CreateSlider({
    super.key,
    required this.label,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    this.onChanged,
    this.valueFormatter,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  State<CreateSlider> createState() => CreateSliderState();
}

class CreateSliderState extends State<CreateSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  String _formatValue(double value) {
    if (widget.valueFormatter != null) return widget.valueFormatter!(value);
    return value.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.backgroundColor ?? Colors.grey.shade200;

    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CreateText(text: widget.label, fontSize: 14),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: CreateText(
                  text: _formatValue(_currentValue),
                  fontSize: 14,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SliderTheme(
            data: SliderThemeData(
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              trackHeight: 6,
              trackShape: const RoundedRectSliderTrackShape(),
              activeTrackColor: widget.activeColor,
              inactiveTrackColor: widget.inactiveColor,
            ),
            child: Slider(
              value: _currentValue,
              min: widget.minValue,
              max: widget.maxValue,
              onChanged: (value) {
                setState(() => _currentValue = value);
                widget.onChanged?.call(value);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreateText(text: _formatValue(widget.minValue), fontSize: 12),
                CreateText(text: _formatValue(widget.maxValue), fontSize: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
