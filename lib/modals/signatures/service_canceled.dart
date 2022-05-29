import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:flutter/material.dart';

bool checkValue = false;
bool checkValue1 = false;
bool checkValue2 = false;

class ServiceCanceled extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  Function? onNext;

  ServiceCanceled({Key? key, this.onNext}) : super(key: key);

  @override
  State<ServiceCanceled> createState() => _ServiceCanceled();
}

class _ServiceCanceled extends State<ServiceCanceled> {
  String _value = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: _renderSection(),
    );
  }

  Widget _renderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DefaultApproachHeader(
        title: "Serviço cancelado!",
        titleFontSize: 30,
        description: "Deu tudo certo com seu processo de         cancelamento!",
      ),
    ]);
  }
}
