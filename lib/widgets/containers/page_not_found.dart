import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.sentiment_very_dissatisfied_sharp,
            color: Colors.white,
            size: 60,
          ),
          SizedBox(height: 20),
          Text('Oops!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold)),
          Text('Essa página ainda não foi criada :(',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              )),
        ],
      ),
    );
  }
}
