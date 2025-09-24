import 'package:drb_internship/core/features/presentation/views/widgets/home_view.dart';
import 'package:drb_internship/core/helper_function/on_generate_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DRBInternship());
}

class DRBInternship extends StatelessWidget {
  const DRBInternship({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: HomeView.routeName,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
