import 'package:apollo/modals/products/create_product.dart';
import 'package:apollo/modals/products/delete_product.dart';
import 'package:apollo/modals/products/edit_product.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/repositories/products_repository.dart';
import 'package:apollo/services/auth_service.dart';
import 'package:apollo/shared/utils/debounce.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/no_results_found.dart';
import 'package:apollo/widgets/containers/product_card.dart';
import 'package:apollo/widgets/elements/fetch_loading.dart';
import 'package:apollo/widgets/elements/tad_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProducts extends StatefulWidget {
  final ProductRepository productRepository = ProductRepository();

  MyProducts({Key? key}) : super(key: key);

  @override
  State<MyProducts> createState() => MyProductsState();
}

class MyProductsState extends State<MyProducts> {
  late AuthService authService;

  List<Product> _products = [];
  bool loading = false;

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
    toggleLoading();
    try {
      List<Product> products = await widget.productRepository
          .getAllFromCompany(authService.account!.documentId());
      setProducts(products);
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authService = Provider.of<AuthService>(context);
    fetchProducts();
  }

  Widget _renderProducts() {
    return _products.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: _products.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductCard(
                product: _products[index],
                onTapDelete: () {
                  RouteUtils.showOrPushModal(
                    context,
                    modalContent: DeleteProduct(
                      myProductsState: this,
                      product: _products[index],
                    ),
                  );
                },
                onTapEdit: () {
                  RouteUtils.showOrPushModal(context,
                      modalContent: EditProduct(
                        myProductsState: this,
                        product: _products[index],
                      ));
                },
              );
            })
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: const NoResultsFound(
                iconData: Icons.production_quantity_limits,
                textSize: 14,
                text: "Você não tem nenhum produto :("));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Row(
              children: [
                const Text(
                  'Seus produtos',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                TADButton(
                  onPressed: () {
                    RouteUtils.showOrPushModal(
                      context,
                      modalContent: CreateProduct(
                        myProductsState: this,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        Flexible(child: loading ? const FetchLoading() : _renderProducts()),
      ],
    );
  }
}
