import 'package:apollo/dtos/plan_dto.dart';
import 'package:apollo/modals/plans/plan_success.dart';
import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/repositories/subscription_plans_repository%20.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/containers/my_plans.dart';
import 'package:apollo/widgets/elements/fetch_loading.dart';
import 'package:flutter/material.dart';

enum PlanAction { delete, create, edit }

class PlanProcessing extends StatefulWidget {
  final PlanAction action;
  final PlanDto planDto;
  final MyPlansState? myPlansState;

  final SubscriptionPlansRepository subscriptionPlansRepository =
      SubscriptionPlansRepository();

  PlanProcessing({
    Key? key,
    required this.action,
    required this.planDto,
    this.myPlansState,
  }) : super(key: key);

  @override
  State<PlanProcessing> createState() => _PlanProcessingState();
}

class _PlanProcessingState extends State<PlanProcessing> {
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
      case PlanAction.create:
        SubscriptionPlan subscriptionPlan = SubscriptionPlan.create({
          'name': widget.planDto.name,
          'description': null,
          'price': widget.planDto.price,
          'interval': widget.planDto.interval,
          'recurrenceRule': widget.planDto.recurrenceRule.name,
          'companyId': widget.myPlansState?.authService.account?.documentId(),
        });
        await widget.subscriptionPlansRepository.create(subscriptionPlan);
        if (widget.myPlansState != null) {
          widget.myPlansState?.fetchSubscriptionPlans();
        }
        setState(() {
          loading = false;
        });
        break;
      case PlanAction.delete:
        await widget.subscriptionPlansRepository.delete(widget.planDto.id!);
        if (widget.myPlansState != null) {
          widget.myPlansState?.fetchSubscriptionPlans();
        }
        setState(() {
          loading = false;
        });
        break;
      case PlanAction.edit:
        SubscriptionPlan subscriptionPlan =
            await widget.subscriptionPlansRepository.get(widget.planDto.id!);
        subscriptionPlan.name = widget.planDto.name;
        subscriptionPlan.price = widget.planDto.price;
        subscriptionPlan.interval = widget.planDto.interval;
        subscriptionPlan.recurrenceRule = widget.planDto.recurrenceRule;

        await widget.subscriptionPlansRepository.update(subscriptionPlan);
        if (widget.myPlansState != null) {
          widget.myPlansState?.fetchSubscriptionPlans();
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
        return PlanSuccess(action: widget.action);
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
