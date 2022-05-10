import 'package:apollo/constants/colors.dart';
import 'package:flutter/material.dart';

class MutableModalContent extends StatefulWidget {
  final Widget? firstModal;

  const MutableModalContent({Key? key, this.firstModal}) : super(key: key);

  @override
  State<MutableModalContent> createState() => _MutableModalContentState();

  static of(BuildContext context, {bool root = false}) => root
      ? context.findRootAncestorStateOfType<_MutableModalContentState>()
      : context.findAncestorStateOfType<_MutableModalContentState>();

  static void showModal(BuildContext context, Widget? firstModal) {
    MutableModalContent modalContent = MutableModalContent(
      firstModal: firstModal,
    );
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: kThemeBackground,
        context: context,
        builder: (context) => modalContent);
  }
}

class _MutableModalContentState extends State<MutableModalContent> {
  late Widget _content;
  late List<Widget> _contentHistory;

  @override
  void initState() {
    _contentHistory = [];
    if (widget.firstModal != null) {
      _content = widget.firstModal!;
      _contentHistory.add(_content);
    }

    super.initState();
  }

  void push(Widget content) {
    setState(() {
      _content = content;
      _contentHistory.add(content);
    });
  }

  void pop() {
    setState(() {
      _contentHistory.removeLast();
      _content = _contentHistory.last;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_contentHistory.length > 1) {
            pop();
            return false;
          } else {
            return true;
          }
        },
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  height: 4,
                  width: 50,
                  margin: const EdgeInsets.only(top: 7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  )),
              AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                      alwaysIncludeSemantics: true,
                    );
                  },
                  child: Container(
                    key: ValueKey(_content),
                    child: _content,
                  )),
            ],
          ),
        ));
  }
}
