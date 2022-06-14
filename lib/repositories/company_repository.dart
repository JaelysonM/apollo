import 'dart:async';

import 'package:apollo/models/company_account.dart';
import 'package:apollo/shared/base_repository.dart';

class CompanyRepository extends BaseRepository<CompanyAccount> {
  CompanyRepository() : super('companies');

  @override
  Future<CompanyAccount> create(CompanyAccount model) async {
    var document = await reference.add(model.toMap());
    model.setDocumentId(document.id);
    return model;
  }

  Future<dynamic> findByEmail(String email) {
    return reference.where('email', isEqualTo: email).get().then((query) {
      if (query.docs.isEmpty) {
        return null;
      }
      return CompanyAccount.fromMap(query.docs.first);
    });
  }

  Future<bool> isCompany(String uid) {
    return reference
        .where('uid', isEqualTo: uid)
        .get()
        .then((query) => query.docs.isNotEmpty);
  }

  Future<dynamic> findByUid(String uid) {
    return reference.where('uid', isEqualTo: uid).get().then((query) {
      if (query.docs.isEmpty) {
        return null;
      }
      return CompanyAccount.fromMap(query.docs.first);
    });
  }

  @override
  Future<void> delete(String id) {
    return reference.doc(id).delete();
  }

  @override
  Future<CompanyAccount> get(String id) {
    return reference.doc(id).get().then((document) {
      return CompanyAccount.fromMap(document);
    });
  }

  @override
  Future<List<CompanyAccount>> getAll() {
    return reference.get().then((query) {
      return query.docs.map((document) {
        return CompanyAccount.fromMap(document);
      }).toList();
    });
  }

  @override
  Future<CompanyAccount> update(CompanyAccount model) {
    return reference.doc(model.documentId()).update(model.toMap()).then((_) {
      return model;
    });
  }
}
