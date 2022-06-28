import 'package:apollo/models/company_account.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/repositories/products_repository.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/debounce.dart';

import 'package:apollo/widgets/containers/no_results_found.dart';
import 'package:apollo/widgets/containers/product_card.dart';
import 'package:apollo/widgets/containers/tag.dart';
import 'package:apollo/widgets/elements/circle_icon_button.dart';
import 'package:apollo/widgets/elements/fetch_loading.dart';
import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:flutter/material.dart';

class ProductsCatalog extends StatefulWidget {
  final CompanyAccount company;
  final TextEditingController _controller = TextEditingController();
  final ProductRepository productRepository = ProductRepository();

  final List<String> tags;

  ProductsCatalog({Key? key, required this.tags, required this.company})
      : super(key: key);

  @override
  State<ProductsCatalog> createState() => _ProductsCatalogState();
}

class _ProductsCatalogState extends State<ProductsCatalog> {
  List<Product> _products = [];
  bool loading = false;

  final Debounce _debounce = Debounce(const Duration(milliseconds: 400));

  void setProducts(List<Product> _products) {
    setState(() {
      this._products = _products;
    });
    toggleLoading();
  }

  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void fetchProducts() async {
    searchProducts('');
  }

  void searchProducts(String text) async {
    toggleLoading();
    List<Product> products = text.isNotEmpty
        ? await widget.productRepository
            .searchFromCompany(text, widget.company.documentId())
        : await widget.productRepository
            .getAllFromCompany(widget.company.documentId());
    setProducts(products);
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  Widget _renderTagsListView() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.tags.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.all(5),
            child: Tag(
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
                borderRadius: 30,
                backgroundColor: kTagUnselectedColor,
                content: widget.tags[index]));
      },
    );
  }

  Widget _renderSearchSection() {
    return Container(
        margin: const EdgeInsets.only(top: 18, bottom: 18, left: 20),
        child: Row(
          children: [
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 220),
                child: RoundedTextField(
                  label: "Do que você precisa?",
                  labelFontSize: 15,
                  labelFontWeight: FontWeight.w400,
                  controller: widget._controller,
                  icon: Icons.search,
                  borderRadius: 25,
                  onChanged: (text) {
                    _debounce(() {
                      searchProducts(text);
                    });
                  },
                  validator: (text) => null,
                )),
            Expanded(
                child: Container(
                    height: 35,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: _renderTagsListView())),
          ],
        ));
  }

  Widget _renderProducts() {
    return _products.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: _products.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Stack(
                clipBehavior: Clip.none,
                fit: StackFit.passthrough,
                children: [
                  ProductCard(
                      creatorVision: false,
                      product: _products[index],
                      onTap: () {}),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CircleIconButton(
                        onPressed: () {},
                        icon: Icons.add_task,
                        size: 20,
                        padding: 8,
                        buttonColor: kFastScheduleColor),
                  ),
                ],
              );
            })
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: const NoResultsFound(
                iconData: Icons.search_off,
                textSize: 14,
                text:
                    "Não foi encontrado nenhum produto a partir desta busca"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 19),
            child: Text(
              'Produtos',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _renderSearchSection(),
        Flexible(child: loading ? const FetchLoading() : _renderProducts()),
      ],
    );
  }
}
