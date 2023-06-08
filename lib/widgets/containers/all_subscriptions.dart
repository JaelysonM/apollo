import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/repositories/subscription_plans_repository%20.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/no_results_found.dart';
import 'package:apollo/widgets/containers/subscription_plan_card.dart';
import 'package:apollo/widgets/elements/fetch_loading.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class AllSubscriptions extends StatefulWidget {
  final SubscriptionPlansRepository subscriptionPlansRepository =
      SubscriptionPlansRepository();

  AllSubscriptions({Key? key}) : super(key: key);

  @override
  State<AllSubscriptions> createState() => _AllSubscriptionsState();
}

class _AllSubscriptionsState extends State<AllSubscriptions> {
  List<SubscriptionPlan> _subscriptionPlans = [];
  bool loading = false;

  void fetchPlans() {
    setState(() {
      loading = true;
    });
    widget.subscriptionPlansRepository
        .getAll(populate: true)
        .then((subscriptionPlans) {
      setState(() {
        _subscriptionPlans = subscriptionPlans;
      });
    }).whenComplete(() => setState(() {
              loading = false;
            }));
  }

  @override
  void initState() {
    loading = true;
    fetchPlans();
    super.initState();
  }

  Widget _renderSubscriptionPlans() {
    return _subscriptionPlans.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: _subscriptionPlans.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SubscriptionPlanCard(
                  subscriptionPlan: _subscriptionPlans[index]);
            })
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: const NoResultsFound(
                iconData: Icons.star_half,
                textSize: 14,
                text: "Não existe nenhuma assinatura disponível :("));
  }

  Widget _renderAbout(BuildContext context) {
    return Row(
      children: [
        const TinyText(content: 'Não conhece esse serviço? '),
        ClickableText(
          content: "Saiba mais",
          color: kLightBlue,
          onTap: () {
            RouteUtils.showModal(context, route: 'about_subscription');
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Planos de assinaturas',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _renderAbout(context),
                ]),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        loading ? const FetchLoading() : _renderSubscriptionPlans(),
      ],
    );
  }
}
