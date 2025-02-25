import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utls/app_style.dart';

class PrayerItemWidget extends StatelessWidget {
  final String name;
  final String timingModel;

  const PrayerItemWidget(
      {super.key, required this.timingModel, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration:
        BoxDecoration(

            border: Border.all(color: Colors.white38, width: .2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(

                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2).r,
                color: Colors.black38,
                alignment: Alignment.center,
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.bodySmall!,
                )),
            Container(
// height: 70.h,
              color: Colors.white70,
              child: Column(
                children: [
                  Text(
                    timingModel.substring(0, 5),
                    style: Theme.of(context).textTheme.bodyMedium!
                        .copyWith(color: Colors.black87),
                  ),
                  Text(timingModel.substring(5),
                      style: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: Colors.black87)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
