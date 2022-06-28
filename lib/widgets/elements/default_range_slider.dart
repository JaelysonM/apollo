import 'package:apollo/shared/utils/string_utils.dart';
import 'package:flutter/material.dart';

class DefaultRangeSlider extends StatefulWidget {
  final List<dynamic> value;
  final double max;
  final double min;
  final int? divisions;
  final String? label;
  final Function onChanged;

  const DefaultRangeSlider(
      {Key? key,
      required this.value,
      required this.max,
      required this.min,
      this.divisions,
      this.label,
      required this.onChanged})
      : super(key: key);

  @override
  State<DefaultRangeSlider> createState() => _DefaultRangeSliderState();
}

class _DefaultRangeSliderState extends State<DefaultRangeSlider> {
  late List<dynamic> _value;

  @override
  void initState() {
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RangeSlider(
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          values: RangeValues(_value[0], _value[1]),
          onChanged: (values) {
            widget.onChanged([values.start, values.end]);
            setState(() {
              _value = [
                values.start,
                values.end,
              ];
            });
          },
        ),
        if (widget.label != null)
          Text(
            StringUtils.interpolate(widget.label!, [
              _value[0].toStringAsFixed(2).replaceAll(".00", ""),
              _value[1].toStringAsFixed(2).replaceAll(".00", "")
            ]),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )
      ],
    );
  }
}
