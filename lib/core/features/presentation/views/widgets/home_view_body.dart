import 'package:drb_internship/core/features/presentation/views/widgets/drivers_view.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/trip_view.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/vehicles_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            buildHomeCard(
              context,
              icon: Icons.person,
              label: "Drivers",
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DriversView()),
                );
              },
            ),
            buildHomeCard(
              context,
              icon: FontAwesomeIcons.car,
              label: "Vehicles",
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const VehiclesView()),
                );
              },
            ),
            buildHomeCard(
              context,
              icon: FontAwesomeIcons.road,
              label: "Trips",
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TripsView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHomeCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 30, color: color),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
