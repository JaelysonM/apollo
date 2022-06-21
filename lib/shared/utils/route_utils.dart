import 'package:apollo/modals/auth/shared/auth/identify_approach.dart';
import 'package:apollo/modals/auth/shared/login/login_form.dart';
import 'package:apollo/modals/payments/payments_methods.dart';
import 'package:apollo/modals/payments/spending_history.dart';
import 'package:apollo/modals/products/create_product.dart';
import 'package:apollo/modals/subscriptions/subscription_about.dart';
import 'package:apollo/screens/company/home_company.dart';
import 'package:apollo/screens/company/plans_company.dart';
import 'package:apollo/screens/logged_out/home_logged_out.dart';
import 'package:apollo/screens/logged_out/subscriptions_logged_out.dart';
import 'package:apollo/screens/user/home_user.dart';
import 'package:apollo/screens/user/profile_user.dart';
import 'package:apollo/widgets/containers/mutable_modal_content.dart';
import 'package:apollo/widgets/containers/page_not_found.dart';
import 'package:flutter/material.dart';
import 'package:apollo/modals/auth/user/register/register_form.dart'
    as userRegisterForm;
import 'package:apollo/modals/auth/company/register/register_form.dart'
    as companyRegisterForm;

class RouteUtils {
  static Widget renderPage(String route) {
    switch (route) {
      case 'home_logged_out':
        return const HomeLoggedOut();
      case 'subscriptions_logged_out':
        return const SubscriptionsLoggedOut();
      case 'home_user':
        return const HomeUser();
      case 'profile_user':
        return const ProfileUser();
      case 'home_company':
        return const HomeCompany();
      case 'plans_company':
        return const PlansCompany();
      default:
        return const Align(
          alignment: Alignment.center,
          child: PageNotFound(),
        );
    }
  }

  static void showModal(BuildContext context,
      {required String route,
      bool cleanHistory = false,
      bool company = false}) {
    switch (route) {
      case 'identify_approach':
        showOrPushModal(context,
            modalContent: IdentifyApproach(
              company: company,
            ),
            cleanHistory: cleanHistory);
        break;
      case 'login':
        showOrPushModal(context,
            modalContent: LoginForm(
              company: company,
            ),
            cleanHistory: cleanHistory);
        break;
      case 'register':
        showOrPushModal(context,
            modalContent: company
                ? const companyRegisterForm.RegisterForm()
                : const userRegisterForm.RegisterForm(),
            cleanHistory: cleanHistory);
        break;
      case 'about_subscription':
        showOrPushModal(context,
            modalContent: const SubscriptionAbout(),
            cleanHistory: cleanHistory);
        break;
      case 'spending_history':
        showOrPushModal(context,
            modalContent: const SpendingHistory(spends: []),
            cleanHistory: cleanHistory);
        break;
      case 'payment_methods':
        showOrPushModal(context,
            modalContent: PaymentsMethods(), cleanHistory: cleanHistory);
        break;

      case 'create_product':
        showOrPushModal(context,
            modalContent: CreateProduct(), cleanHistory: cleanHistory);
        break;
    }
  }

  static void showOrPushModal(BuildContext context,
      {bool cleanHistory = false,
      bool cleanAll = false,
      required Widget modalContent}) {
    if (MutableModalContent.of(context) != null) {
      if (cleanHistory) {
        MutableModalContent.of(context).cleanLastsFromHistory();
      }
      if (cleanAll) {
        MutableModalContent.of(context).clean();
      }
      MutableModalContent.of(context).push(modalContent);
    } else {
      MutableModalContent.showModal(context, modalContent);
    }
  }
}
