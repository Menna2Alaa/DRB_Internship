import 'package:drb_internship/core/features/presentation/views/data/models/driver_model.dart';
import 'package:flutter/material.dart';

class DriverViewBody extends StatelessWidget {
  final Driver driver;

  const DriverViewBody({super.key, required this.driver});
  static const String routeName = 'driversViewBody';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(driver.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${driver.name}", style: const TextStyle(fontSize: 18)),
            Text(
              "License: ${driver.licenseNumber}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Status: ${driver.status}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              "Assigned Vehicle: ${driver.assignedVehicle ?? 'None'}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Ongoing Trip: ${driver.ongoingTrip ?? 'None'}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
