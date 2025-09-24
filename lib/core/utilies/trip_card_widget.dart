import 'package:drb_internship/core/features/presentation/views/data/models/trip_model.dart';
import 'package:flutter/material.dart';
import '../features/presentation/views/widgets/trip_view_body.dart';

class TripCardWidget extends StatelessWidget {
  const TripCardWidget({
    super.key,
    required this.trip,
    required this.onUpdated,
  });

  final Trip trip;
  final VoidCallback onUpdated;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Trip ${trip.id}"),
        subtitle: Text(
          "${trip.pickup} → ${trip.dropoff}\nDriver: ${trip.driver}, Vehicle: ${trip.vehicle}",
        ),
        trailing: Text(
          trip.status,
          style: TextStyle(
            color: trip.status == "Pending"
                ? Colors.orange
                : trip.status == "In Progress"
                ? Colors.blue
                : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => TripViewBody(trip: trip)),
          );

          if (result == true) {
            onUpdated();
          }
        },
      ),
    );
  }
}
