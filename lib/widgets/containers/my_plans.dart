import 'package:apollo/modals/plans/create_plan.dart';
import 'package:apollo/modals/plans/delete_plan.dart';
import 'package:apollo/modals/plans/edit_plan.dart';
import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/repositories/subscription_plans_repository%20.dart';
import 'package:apollo/services/auth_service.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/no_results_found.dart';
import 'package:apollo/widgets/containers/plan_card.dart';
import 'package:apollo/widgets/elements/fetch_loading.dart';
import 'package:apollo/widgets/elements/tad_button.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPlans extends StatefulWidget {
  final SubscriptionPlansRepository subscriptionPlansRepository =
      SubscriptionPlansRepository();
  MyPlans({
    Key? key,
  }) : super(key: key);

  @override
  State<MyPlans> createState() => MyPlansState();
}

class MyPlansState extends State<MyPlans> {
  late AuthService authService;

  List<SubscriptionPlan> _subscriptionPlans = [];
  bool loading = false;

  void setProducts(List<SubscriptionPlan> _subscriptionPlans) {
    setState(() {
      this._subscriptionPlans = _subscriptionPlans;
    });
    toggleLoading();
  }

  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void fetchSubscriptionPlans() async {
    toggleLoading();
    try {
      List<SubscriptionPlan> subscriptionPlans = await widget
          .subscriptionPlansRepository
          .getAllFromCompany(authService.account!.documentId());
      setProducts(subscriptionPlans);
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    authService = Provider.of<AuthService>(context);
    fetchSubscriptionPlans();
    super.didChangeDependencies();
  }

  Widget _renderPlans() {
    return _subscriptionPlans.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: _subscriptionPlans.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return PlanCard(
                  plan: _subscriptionPlans[index],
                  onTapDelete: () {
                    RouteUtils.showOrPushModal(
                      context,
                      modalContent: DeletePlan(
                        myPlansState: this,
                        plan: _subscriptionPlans[index],
                      ),
                    );
                  },
                  onTapEdit: () {
                    RouteUtils.showOrPushModal(context,
                        modalContent: EditPlan(
                          myPlansState: this,
                          plan: _subscriptionPlans[index],
                        ));
                  });
            })
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: const NoResultsFound(
                iconData: Icons.production_quantity_limits,
                textSize: 14,
                text: "Você não tem nenhum plano :("));
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
            child: Column(children: [
              Row(
                children: [
                  const Text(
                    'Seus planos',
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
                        modalContent: CreatePlan(
                          myPlansState: this,
                        ),
                      );
                    },
                  )
                ],
              ),
              _renderAbout(context)
            ]),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Flexible(child: loading ? const FetchLoading() : _renderPlans()),
      ],
    );
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
}
