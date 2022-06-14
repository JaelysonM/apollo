import 'package:apollo/models/schedule.dart';
import 'package:apollo/widgets/containers/mean_time.dart';
import 'package:apollo/widgets/containers/schedule_status_pill.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final Schedule schedule;
  final Function? onTap;
  const ScheduleCard({Key? key, required this.schedule, this.onTap})
      : super(key: key);

  Widget _renderCardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              schedule.product.name,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white),
            ),
            const SizedBox(
              width: 8,
            ),
            MeanTime(
              meanTime: schedule.product.duration,
              fontSize: 10,
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        ScheduleStatusPill(
          status: schedule.status,
        ),
      ],
    );
  }

  Widget _renderCardBody() {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              schedule.product.company.name,
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
            const SizedBox(
              width: 8,
            ),
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(schedule.product.company.imageURL!),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap?.call(),
            child: Container(
                child: DottedBorder(
              strokeWidth: 0.5,
              dashPattern: const [2],
              borderType: BorderType.RRect,
              color: Colors.white,
              radius: const Radius.circular(25),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                    children: [_renderCardHeader(), _renderCardBody()],
                  )),
            ))));
  }
}
