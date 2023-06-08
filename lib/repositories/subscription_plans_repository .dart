import 'package:apollo/models/company_account.dart';
import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/repositories/company_repository.dart';
import 'package:apollo/shared/base_repository.dart';

class SubscriptionPlansRepository extends BaseRepository<SubscriptionPlan> {
  final CompanyRepository companyRepository = CompanyRepository();

  SubscriptionPlansRepository() : super('subscription_plans');

  @override
  Future<SubscriptionPlan> create(SubscriptionPlan model) async {
    var document = await reference.add(model.toMap());
    model.setDocumentId(document.id);
    return model;
  }

  @override
  Future<void> delete(String id) {
    return reference.doc(id).delete();
  }

  @override
  Future<SubscriptionPlan> get(String id, {bool populate = false}) {
    return reference.doc(id).get().then((document) {
      return SubscriptionPlan.fromMap(document);
    });
  }

  @override
  Future<List<SubscriptionPlan>> getAll({bool populate = false}) {
    return reference.snapshots().asyncMap((snapshot) async {
      final list = snapshot.docs.map((document) async {
        SubscriptionPlan subscriptionPlan = SubscriptionPlan.fromMap(document);
        if (populate) {
          CompanyAccount companyAccount =
              await companyRepository.get(subscriptionPlan.companyId);
          subscriptionPlan.setCompany(companyAccount);
        }

        return subscriptionPlan;
      }).toList();
      return await Future.wait(list);
    }).first;
  }

  Future<List<SubscriptionPlan>> getAllFromCompany(String companyId) async {
    var company = await companyRepository.get(companyId);
    return reference
        .where('companyId', isEqualTo: company.documentId())
        .get()
        .then((query) {
      return query.docs.map((document) {
        return SubscriptionPlan.fromMap(document);
      }).toList();
    });
  }

  Future<List<SubscriptionPlan>> searchFromCompany(
      String query, String? companyId,
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
        SubscriptionPlan subscriptionPlan = SubscriptionPlan.fromMap(document);
        if (populate) {
          CompanyAccount companyAccount =
              await companyRepository.get(subscriptionPlan.companyId);
          subscriptionPlan.setCompany(companyAccount);
        }

        return subscriptionPlan;
      }).toList();
      return await Future.wait(list);
    }).first;
  }

  @override
  Future<SubscriptionPlan> update(SubscriptionPlan model) {
    return reference.doc(model.documentId()).update(model.toMap()).then((_) {
      return model;
    });
  }
}
