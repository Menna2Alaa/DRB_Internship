import 'package:drb_internship/core/features/presentation/views/data/models/vehicle_model.dart';
import 'package:flutter/material.dart';

class VehicleViewBody extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleViewBody({super.key, required this.vehicle});
  static const String routeName = 'vehicleViewBody';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(vehicle.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vehicle ID: ${vehicle.id}",
              style: const TextStyle(fontSize: 18),
            ),
            Text("Type: ${vehicle.type}", style: const TextStyle(fontSize: 18)),
            Text(
              "Status: ${vehicle.status}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              "Assigned Driver: ${vehicle.assignedDriver ?? 'None'}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Current Trip: ${vehicle.currentTrip ?? 'None'}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
