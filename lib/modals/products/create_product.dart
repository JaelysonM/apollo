import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  CreateProduct({Key? key}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProduct();
}

class _CreateProduct extends State<CreateProduct> {
  String _value = '';
  late double _price;
  late double _minTime;
  late double _maxTime;
  @override
  initState() {
    super.initState();
    _price = 0.0;
    _minTime = 0.0;
    _maxTime = 12.0;
    _value = widget.textEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: _renderSection(),
    );
  }

  Widget _renderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const DefaultApproachHeader(
        title: "Touch-And-Deploy",
        titleFontSize: 30,
        description:
            "É rápido e fácil! Coloque um nome para um produto, o tempo de demanda e o seu preço.",
      ),
      const SizedBox(height: 20),
      ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 60),
          child: RoundedTextField(
            labelFontSize: 16,
            label: 'Nome do produto',
            controller: widget.textEditingController,
            onChanged: (String text) {
              setState(() {
                _value = text;
              });
            },
          )),
      const SizedBox(height: 10),
      Slider(
        min: 0.0,
        max: 200.0,
        value: _price,
        divisions: 200,
        onChanged: (value) {
          setState(() {
            _price = value;
          });
        },
      ),
      Text(
        'Preço: R\$${_price.toStringAsFixed(2).toString()}                                                               R\$',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
      RangeSlider(
        min: 0.0,
        max: 24.0,
        divisions: 24,
        values: RangeValues(_minTime, _maxTime),
        onChanged: (values) {
          setState(() {
            _minTime = values.start;
            _maxTime = values.end;
          });
        },
      ),
      Text(
        'De ${_minTime.toStringAsFixed(0).toString()}h à ${_maxTime.toStringAsFixed(0).toString()}h',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
      const SizedBox(height: 9),
      DefaultButton(
        child: const LargeTextHeader(content: "Deploy!", fontSize: 18),
        backgroundColor: kSystemPurple,
        onPressed: () {},
      )
    ]);
  }
}
