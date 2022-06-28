import 'dart:async';

import 'package:apollo/models/company_account.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/repositories/company_repository.dart';
import 'package:apollo/shared/base_repository.dart';

class ProductRepository extends BaseRepository<Product> {
  final CompanyRepository companyRepository = CompanyRepository();

  ProductRepository() : super('products');

  @override
  Future<Product> create(Product model) async {
    var document = await reference.add(model.toMap());
    model.setDocumentId(document.id);
    return model;
  }

  @override
  Future<void> delete(String id) {
    return reference.doc(id).delete();
  }

  @override
  Future<Product> get(String id, {bool populate = false}) {
    return reference.doc(id).get().then((document) {
      return Product.fromMap(document);
    });
  }

  @override
  Future<List<Product>> getAll({bool populate = false}) {
    return reference.get().then((query) {
      return query.docs.map((document) {
        return Product.fromMap(document);
      }).toList();
    });
  }

  Future<List<Product>> getAllFromCompany(String companyId) async {
    var company = await companyRepository.get(companyId);
    return reference
        .where('companyId', isEqualTo: company.documentId())
        .get()
        .then((query) {
      return query.docs.map((document) {
        return Product.fromMap(document);
      }).toList();
    });
  }

  Future<List<Product>> searchFromCompany(String query, String? companyId,
      {bool populate = false}) {
    return reference
        .where('name', isGreaterThanOrEqualTo: query, isLessThan: query + 'z')
        .where('description',
            isGreaterThanOrEqualTo: query, isLessThan: query + 'z')
        .where(
          'companyId',
        )
        .snapshots()
        .asyncMap((snapshot) async {
      final list = snapshot.docs.map((document) async {
        Product product = Product.fromMap(document);
        if (populate) {
          CompanyAccount companyAccount =
              await companyRepository.get(product.companyId);
          product.setCompany(companyAccount);
        }

        return Product.fromMap(document);
      }).toList();
      return await Future.wait(list);
    }).first;
  }

  @override
  Future<Product> update(Product model) {
    return reference.doc(model.documentId()).update(model.toMap()).then((_) {
      return model;
    });
  }
}
