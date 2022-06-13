import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

class TouchAndDeployProduct extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  Function? onNext;

  TouchAndDeployProduct({Key? key, this.onNext}) : super(key: key);

  @override
  State<TouchAndDeployProduct> createState() => _TouchAndDeployProduct();
}

class _TouchAndDeployProduct extends State<TouchAndDeployProduct> {
  String _value = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: _renderSection(),
    );
  }

  double _currentValue = 0;
  double _startValue = 0.0;
  double _endValue = 12.0;
  Widget _renderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DefaultApproachHeader(
        title: "Touch-And-Deploy",
        titleFontSize: 30,
        description:
            "É rápido e fácil! Coloque um nome para um produto, o tempo de demanda e o seu preço.",
      ),
      SizedBox(height: 15),
      RoundedTextField(
        label: 'Nome do produto',
        controller: widget.textEditingController,
        onChanged: () {},
      ),
      //SizedBox(height: 12),
      Slider(
        min: 0.0,
        max: 200.0,
        value: _currentValue,
        divisions: 99999,
        //label: '${_currentValue.round()}',
        onChanged: (value) {
          setState(() {
            _currentValue = value;
          });
        },
      ),
      Text(
        'Preço: ${_currentValue.toStringAsFixed(2).toString()}                                                               R\$',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
      RangeSlider(
        min: 0.0,
        max: 24.0,
        values: RangeValues(_startValue, _endValue),
        onChanged: (values) {
          setState(() {
            _startValue = values.start;
            _endValue = values.end;
          });
        },
      ),
      Text(
        'De ${_startValue.toStringAsFixed(0).toString()} à(s) ${_endValue.toStringAsFixed(0).toString()} hora(s)',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
      SizedBox(height: 9),
      DefaultButton(
        child: const LargeTextHeader(content: "Deploy!", fontSize: 18),
        backgroundColor: kSystemPurple,
        onPressed: () {},
      )
    ]);
  }
}
