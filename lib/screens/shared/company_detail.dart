import 'package:apollo/models/company_account.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/company_info.dart';
import 'package:apollo/widgets/elements/back_button.dart';
import 'package:apollo/widgets/elements/company_avatar.dart';
import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:flutter/material.dart';

class CompanyDetail extends StatefulWidget {
  final CompanyAccount company;
  const CompanyDetail({Key? key, required this.company}) : super(key: key);

  @override
  State<CompanyDetail> createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: kThemeBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            leading: Container(
              margin: const EdgeInsets.only(left: 15),
              child: const DefaultBackButton(),
            ),
            titleSpacing: 5,
            actions: [
              Container(
                  margin: const EdgeInsets.only(top: 18, right: 15),
                  child: IconButton(
                    splashRadius: 20,
                    iconSize: 30,
                    alignment: Alignment.center,
                    icon: const Icon(Icons.bookmark),
                    onPressed: () => {},
                  ))
            ],
            title: Row(
              children: [
                CompanyAvatar(company: widget.company, size: 18),
                const SizedBox(
                  width: 9,
                ),
                Text(
                  widget.company.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryLightGray),
                ),
              ],
            ),
            backgroundColor: kThemeBackground,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.orange[100 * (index % 9)],
                  child: Text('orange $index'),
                );
              },
              childCount: 9,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 30,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.yellow,
              padding: const EdgeInsets.all(8.0),
              child: Text('Grid Header', style: TextStyle(fontSize: 24)),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
            children: <Widget>[
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ],
          ),
          SliverGrid.extent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
            children: <Widget>[
              Container(color: Colors.pink),
              Container(color: Colors.indigo),
              Container(color: Colors.orange),
              Container(color: Colors.pink),
              Container(color: Colors.indigo),
              Container(color: Colors.orange),
            ],
          )
        ],
      ),
    );
  }
}
