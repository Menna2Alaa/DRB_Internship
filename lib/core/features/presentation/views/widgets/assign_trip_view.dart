import 'package:drb_internship/core/features/presentation/views/widgets/drivers_details.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/trip_details.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/vehicles_details.dart';
import 'package:flutter/material.dart';
import '../data/models/driver_model.dart';
import '../data/models/vehicle_model.dart';
import '../data/models/trip_model.dart';
import 'package:drb_internship/core/utilies/widget/custome_button.dart';
import 'package:drb_internship/core/utilies/widget/custome_text_form_field.dart';

class AssignTripView extends StatefulWidget {
  const AssignTripView({super.key});
  static const String routeName = 'assignTripView';

  @override
  State<AssignTripView> createState() => _AssignTripViewState();
}

class _AssignTripViewState extends State<AssignTripView> {
  Driver? selectedDriver;
  Vehicle? selectedVehicle;

  late String fromWhere, whereTo;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final availableDrivers = drivers
        .where((driver) => driver.status == "Available")
        .toList();
    final availableVehicles = vehicles
        .where((vehicle) => vehicle.status == "Available")
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Assign Trip")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              DropdownButtonFormField<Driver>(
                style: TextStyle(fontSize: 16, color: Colors.black),
                value: availableDrivers.contains(selectedDriver)
                    ? selectedDriver
                    : null,
                hint: const Text("Select Driver"),
                menuMaxHeight: 200,
                items: availableDrivers.map((driver) {
                  return DropdownMenuItem(
                    value: driver,
                    child: Text(driver.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDriver = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Driver is required" : null,
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<Vehicle>(
                style: TextStyle(fontSize: 16, color: Colors.black),
                value: availableVehicles.contains(selectedVehicle)
                    ? selectedVehicle
                    : null,
                hint: const Text("Select Vehicle"),
                menuMaxHeight: 200,
                items: availableVehicles.map((vehicle) {
                  return DropdownMenuItem(
                    value: vehicle,
                    child: Text(vehicle.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedVehicle = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Vehicle is required" : null,
              ),
              const SizedBox(height: 16),

              CustomeTextFormField(
                hintText: "From Where",
                textInputType: TextInputType.text,
                onSaved: (value) => fromWhere = value ?? "",
              ),
              const SizedBox(height: 16),

              CustomeTextFormField(
                hintText: "Where To",
                textInputType: TextInputType.text,
                onSaved: (value) => whereTo = value ?? "",
              ),
              const SizedBox(height: 24),

              CustomeButton(onPressed: _assignTrip, text: "Assign Trip"),
            ],
          ),
        ),
      ),
    );
  }

  void _assignTrip() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (selectedDriver == null || selectedVehicle == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select driver and vehicle")),
        );
        return;
      }

      final newTrip = Trip(
        id: "T${trips.length + 1}",
        driver: selectedDriver!.name,
        vehicle: selectedVehicle!.name,
        pickup: fromWhere,
        dropoff: whereTo,
        status: "Pending",
      );

      setState(() {
        trips.add(newTrip);

        selectedDriver!.status = "On Trip";
        selectedDriver!.assignedVehicle = selectedVehicle!.name;
        selectedDriver!.ongoingTrip = newTrip.id;

        selectedVehicle!.status = "Assigned";
        selectedVehicle!.assignedDriver = selectedDriver!.name;
        selectedVehicle!.currentTrip = newTrip.id;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Trip ${newTrip.id} assigned successfully!")),
      );

      Navigator.pop(context, true);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
