import 'package:drb_internship/core/features/presentation/views/widgets/drivers_details.dart';
import 'package:drb_internship/core/utilies/drivers_card_widget.dart';
import 'package:drb_internship/core/utilies/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class DriversView extends StatefulWidget {
  const DriversView({super.key});
  static const String routeName = 'driversView';

  @override
  State<DriversView> createState() => _DriversViewState();
}

class _DriversViewState extends State<DriversView> {
  String searchTitle = '';
  @override
  Widget build(BuildContext context) {
    final filteredDrivers = drivers.where((driver) {
      final searchLower = searchTitle.toLowerCase();
      return driver.name.toLowerCase().contains(searchLower) ||
          driver.licenseNumber.toLowerCase().contains(searchLower) ||
          driver.status.toLowerCase().contains(searchLower);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Drivers")),
      body: Column(
        children: [
          SearchBarWidget(
            hintText: 'Search by name, license, or status',
            onChanged: (value) {
              setState(() {
                searchTitle = value;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDrivers.length,
              itemBuilder: (context, index) {
                final driver = filteredDrivers[index];
                return DriversCardWidget(
                  driver: driver,
                  name: driver.name,
                  licenseNumber: driver.licenseNumber,
                  status: driver.status,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
