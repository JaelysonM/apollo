import 'package:apollo/shared/utils/string_utils.dart';
import 'package:flutter/material.dart';

class DefaultSlider extends StatefulWidget {
  final double value;
  final double max;
  final double min;
  final int? divisions;
  final String? label;
  final Function onChanged;

  const DefaultSlider(
      {Key? key,
      required this.value,
      required this.max,
      required this.min,
      this.divisions,
      this.label,
      required this.onChanged})
      : super(key: key);

  @override
  State<DefaultSlider> createState() => _DefaultSliderState();
}

class _DefaultSliderState extends State<DefaultSlider> {
  late double _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slider(
          min: widget.min,
          max: widget.max,
          value: _value,
          divisions: widget.divisions,
          onChanged: (value) {
            widget.onChanged(value);
            setState(() {
              _value = value;
            });
          },
        ),
        if (widget.label != null)
          Text(
            StringUtils.interpolate(
                widget.label!, [_value.toStringAsFixed(2).toString()]),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )
      ],
    );
  }
}
