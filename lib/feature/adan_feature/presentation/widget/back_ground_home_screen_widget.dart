import 'package:flutter/material.dart';
class BackGroundHomeScreenWidget extends StatelessWidget {
  final Widget child;

  const BackGroundHomeScreenWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Directionality(textDirection: TextDirection.rtl, child: child),
    );
  }
}
