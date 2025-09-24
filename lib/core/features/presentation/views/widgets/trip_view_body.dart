import 'package:drb_internship/core/features/presentation/views/data/models/trip_model.dart';
import 'package:flutter/material.dart';

class TripViewBody extends StatefulWidget {
  final Trip trip;

  const TripViewBody({super.key, required this.trip});
  static const String routeName = 'tripViewBody';

  @override
  State<TripViewBody> createState() => _TripViewBodyState();
}

class _TripViewBodyState extends State<TripViewBody> {
  late String status;

  @override
  void initState() {
    super.initState();
    status = widget.trip.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trip ${widget.trip.id}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trip ID: ${widget.trip.id}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Driver: ${widget.trip.driver}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Vehicle: ${widget.trip.vehicle}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Pickup: ${widget.trip.pickup}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Drop-off: ${widget.trip.dropoff}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Status: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: status,
                  items: const [
                    DropdownMenuItem(value: "Pending", child: Text("Pending")),
                    DropdownMenuItem(
                      value: "In Progress",
                      child: Text("In Progress"),
                    ),
                    DropdownMenuItem(
                      value: "Completed",
                      child: Text("Completed"),
                    ),
                  ],
                  onChanged: (newValue) {
                    if (newValue != null) {
                      updateStatus(newValue);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void updateStatus(String newValue) {
    setState(() {
      status = newValue;
      widget.trip.status = newValue;
    });

    Navigator.pop(context, true);
  }
}
