import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

class TouchAndDeployPlan extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  Function? onNext;

  TouchAndDeployPlan({Key? key, this.onNext}) : super(key: key);

  @override
  State<TouchAndDeployPlan> createState() => _TouchAndDeployPlan();
}

class _TouchAndDeployPlan extends State<TouchAndDeployPlan> {
  //String _value = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: _renderSection(),
    );
  }

  double _currentValue = 0;
  double _currentValue1 = 0;
  Widget _renderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DefaultApproachHeader(
        title: "Touch-And-Deploy",
        titleFontSize: 30,
        description:
            "É rápido e fácil! Coloque um nome para o plano, o número de vezes para ser utilizado e seu preço mensal.",
      ),
      SizedBox(height: 15),
      RoundedTextField(
        label: 'Nome do plano',
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
      Slider(
        min: 0.0,
        max: 31.0,
        value: _currentValue1,
        divisions: 31,
        //label: '${_currentValue.round()}',
        onChanged: (value) {
          setState(() {
            _currentValue1 = value;
          });
        },
      ),
      Text(
        'Nº de vezes ${_currentValue1.toStringAsFixed(0).toString()} ',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
      SizedBox(height: 9),
      DefaultButton(
        child: const LargeTextHeader(content: "Deploy", fontSize: 18),
        backgroundColor: kSystemPurple,
        onPressed: () {},
      )
    ]);
  }
}
