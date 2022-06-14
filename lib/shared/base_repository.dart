import 'package:apollo/shared/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRepository<T extends BaseModel> {
  late CollectionReference _reference;

  BaseRepository(String collection) {
    _reference = FirebaseFirestore.instance.collection(collection);
  }
  CollectionReference get reference => _reference;

  Future<T> get(String id);

  Future<List<T>> getAll();
  Future<T> create(T model);
  Future<T> update(T model);
  Future<void> delete(String id);
}
