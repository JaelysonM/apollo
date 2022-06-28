import 'package:apollo/models/company_account.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/company_detail_app_bar.dart';
import 'package:apollo/widgets/containers/current_date_container.dart';
import 'package:apollo/widgets/containers/products_catalog.dart';
import 'package:apollo/widgets/containers/trending_products.dart';
import 'package:apollo/widgets/elements/progress_bar.dart';
import 'package:apollo/widgets/styles/default_bold_text.dart';
import 'package:flutter/material.dart';

class CompanyDetail extends StatefulWidget {
  final CompanyAccount company;
  const CompanyDetail({Key? key, required this.company}) : super(key: key);

  @override
  State<CompanyDetail> createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> {
  Widget _renderHeader() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CurrentDateContainer(layout: FlowLayout.row, fontSize: 20),
              const SizedBox(height: 8),
              Row(children: const [
                Expanded(
                  child: ProgressBar(value: 0.5),
                ),
                SizedBox(width: 14),
                DefaultBoldText(
                  content: 'Preenchido',
                  color: kProgressBarLegendText,
                  fontSize: 12,
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderTrending() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        child: TrendingProducts(company: widget.company),
      ),
    );
  }

  Widget _renderProducts() {
    return SliverToBoxAdapter(
      child: ProductsCatalog(
        company: widget.company,
        tags: ['Estética', 'Testando'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: kThemeBackground,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CompanyDetailAppBar(
                expandedHeight: 100, company: widget.company),
          ),
          _renderHeader(),
          _renderTrending(),
          _renderProducts()
        ],
      )),
    );
  }
}
