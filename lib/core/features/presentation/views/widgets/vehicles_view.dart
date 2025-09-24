import 'package:drb_internship/core/features/presentation/views/widgets/vehicles_details.dart';
import 'package:drb_internship/core/utilies/vehicles_card_widget.dart';
import 'package:drb_internship/core/utilies/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class VehiclesView extends StatefulWidget {
  const VehiclesView({super.key});
  static const String routeName = 'vehiclesView';

  @override
  State<VehiclesView> createState() => _VehiclesViewState();
}

class _VehiclesViewState extends State<VehiclesView> {
  String searchTitle = '';
  @override
  Widget build(BuildContext context) {
    final filteredVehicles = vehicles.where((vehicle) {
      final searchLower = searchTitle.toLowerCase();
      return vehicle.name.toLowerCase().contains(searchLower) ||
          vehicle.type.toLowerCase().contains(searchLower) ||
          vehicle.status.toLowerCase().contains(searchLower);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Vehicles")),
      body: Column(
        children: [
          SearchBarWidget(
            hintText: 'Search by name, type, or status',
            onChanged: (value) {
              setState(() {
                searchTitle = value;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredVehicles.length,
              itemBuilder: (context, index) {
                final vehicle = filteredVehicles[index];
                return CardDetails(
                  vehicle: vehicle,
                  id: vehicle.id,
                  name: vehicle.name,
                  type: vehicle.type,
                  status: vehicle.status,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
