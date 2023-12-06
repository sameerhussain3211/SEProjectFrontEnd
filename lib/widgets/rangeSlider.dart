import 'package:flutter/material.dart';

class CustomRangeSlider extends StatefulWidget {
  final int upperLimit;
  final void Function(double lower, double upper) onRangeChanged;

  CustomRangeSlider({
    required this.upperLimit,
    required this.onRangeChanged,
  });

  @override
  _CustomRangeSliderState createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      max: widget.upperLimit.toDouble(),
      divisions: 20,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
          widget.onRangeChanged(values.start, values.end);
        });
      },
    );
  }
}
