import 'package:drb_internship/core/features/presentation/views/widgets/drivers_view.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/trip_view.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/vehicles_view.dart';
import 'package:drb_internship/core/utilies/widget/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DRB Internship")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            homeCardWidget(
              context,
              icon: Icons.person,
              label: "Drivers",
              color: Colors.blue,
              onTap: () {
                Navigator.pushNamed(context, DriversView.routeName);
              },
            ),
            homeCardWidget(
              context,
              icon: FontAwesomeIcons.car,
              label: "Vehicles",
              color: Colors.green,
              onTap: () {
                Navigator.pushNamed(context, VehiclesView.routeName);
              },
            ),
            homeCardWidget(
              context,
              icon: FontAwesomeIcons.road,
              label: "Trips",
              color: Colors.orange,
              onTap: () {
                Navigator.pushNamed(context, TripsView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
