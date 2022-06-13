import 'dart:async';

import 'package:apollo/models/user.dart';
import 'package:apollo/shared/base_repository.dart';

class UserRepository extends BaseRepository<User> {
  UserRepository() : super('users');

  @override
  Future<User> create(User model) async {
    var document = await reference.add(model.toMap());
    model.setDocumentId(document.id);
    return model;
  }

  Future<dynamic> findByEmail(String email) {
    return reference.where('email', isEqualTo: email).get().then((query) {
      if (query.docs.isEmpty) {
        return null;
      }
      return User.fromMap(query.docs.first);
    });
  }

  @override
  Future<void> delete(String id) {
    return reference.doc(id).delete();
  }

  @override
  Future<User> get(String id) {
    return reference.doc(id).get().then((document) {
      return User.fromMap(document);
    });
  }

  @override
  Future<List<User>> getAll() {
    return reference.get().then((query) {
      return query.docs.map((document) {
        return User.fromMap(document);
      }).toList();
    });
  }

  @override
  Future<User> update(User model) {
    return reference.doc(model.documentId()).update(model.toMap()).then((_) {
      return model;
    });
  }
}
