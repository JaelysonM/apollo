import 'package:apollo/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class DefaultDropdown extends StatefulWidget {
  final String value;

  final String? label;
  final List<String> items;
  final Function(String value) displayComposer;
  final Function onChanged;

  const DefaultDropdown(
      {Key? key,
      required this.value,
      this.label,
      required this.onChanged,
      required this.items,
      required this.displayComposer})
      : super(key: key);

  @override
  State<DefaultDropdown> createState() => _DefaultDropdownState();
}

class _DefaultDropdownState extends State<DefaultDropdown> {
  late String _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        DropdownButton<String>(
          value: _value,
          dropdownColor: kSystemLightBlue2,
          onChanged: (String? value) {
            setState(() {
              _value = value!;
            });
            widget.onChanged(value);
          },
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: widget.displayComposer(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
