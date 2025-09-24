import 'package:drb_internship/core/features/presentation/views/widgets/assign_trip_view.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/trip_details.dart';
import 'package:drb_internship/core/utilies/trip_card_widget.dart';
import 'package:drb_internship/core/utilies/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  const TripsView({super.key});
  static const String routeName = 'tripView';

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  String searchTitle = '';
  @override
  Widget build(BuildContext context) {
    final filteredTrips = trips.where((trip) {
      final searchLower = searchTitle.toLowerCase();
      return trip.driver.toLowerCase().contains(searchLower) ||
          trip.vehicle.toLowerCase().contains(searchLower) ||
          trip.status.toLowerCase().contains(searchLower);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Trips")),

      body: Column(
        children: [
          SearchBarWidget(
            hintText: 'Search trips by driver, vehicle, or status',
            onChanged: (value) {
              setState(() {
                searchTitle = value;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTrips.length,
              itemBuilder: (context, index) {
                final trip = filteredTrips[index];
                return TripCardWidget(
                  trip: trip,
                  onUpdated: () {
                    setState(() {});
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            AssignTripView.routeName,
          );
          if (result == true) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
