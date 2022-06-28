import 'package:apollo/dtos/product_dto.dart';
import 'package:apollo/modals/products/product_success.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/repositories/products_repository.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/containers/my_products.dart';
import 'package:apollo/widgets/elements/fetch_loading.dart';
import 'package:flutter/material.dart';

enum ProductAction { delete, create, edit }

class ProductProcessing extends StatefulWidget {
  final ProductAction action;
  final ProductDto productDto;
  final MyProductsState? myProductsState;

  final ProductRepository productRepository = ProductRepository();

  ProductProcessing({
    Key? key,
    required this.action,
    required this.productDto,
    this.myProductsState,
  }) : super(key: key);

  @override
  State<ProductProcessing> createState() => _ProductProcessingState();
}

class _ProductProcessingState extends State<ProductProcessing> {
  late bool loading = true;
  late bool loaded = false;
  late String? error;

  @override
  void initState() {
    super.initState();
    error = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!loaded) {
      _executeAction();
    }
  }

  void _executeAction() async {
    switch (widget.action) {
      case ProductAction.create:
        Product product = Product.create({
          'name': widget.productDto.name,
          'description': null,
          'price': widget.productDto.price,
          'duration': widget.productDto.duration,
          'companyId':
              widget.myProductsState?.authService.account?.documentId(),
        });
        await widget.productRepository.create(product);
        if (widget.myProductsState != null) {
          widget.myProductsState?.fetchProducts();
        }
        setState(() {
          loading = false;
        });
        break;
      case ProductAction.delete:
        await widget.productRepository.delete(widget.productDto.id!);
        if (widget.myProductsState != null) {
          widget.myProductsState?.fetchProducts();
        }
        setState(() {
          loading = false;
        });
        break;
      case ProductAction.edit:
        Product product =
            await widget.productRepository.get(widget.productDto.id!);
        product.name = widget.productDto.name;
        product.price = widget.productDto.price;
        product.duration = widget.productDto.duration;
        await widget.productRepository.update(product);
        if (widget.myProductsState != null) {
          widget.myProductsState?.fetchProducts();
        }
        setState(() {
          loading = false;
        });
        break;
    }
  }

  Widget _renderResult() {
    if (loading) {
      return const Padding(padding: EdgeInsets.all(25), child: FetchLoading());
    } else {
      if (error == null) {
        return ProductSuccess(action: widget.action);
      } else {
        return Align(
          alignment: Alignment.center,
          child: Text(error!),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultModalContainer(child: _renderResult());
  }
}
