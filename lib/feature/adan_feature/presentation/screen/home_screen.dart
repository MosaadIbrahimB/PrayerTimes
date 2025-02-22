import 'package:flutter/material.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/body_home_widget.dart';
import '../widget/app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackGroundHomeScreenWidget(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBarWidget(),
            body:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: BodyHomeWidget(),
              ),
            ),
          ),
        ),
    );
  }
}

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
