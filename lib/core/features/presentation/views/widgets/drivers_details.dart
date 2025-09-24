import 'package:drb_internship/core/features/presentation/views/data/models/driver_model.dart';

final List<Driver> drivers = [
  Driver(name: "Ahmed Ali", licenseNumber: "DL-12345", status: "Available"),
  Driver(
    name: "Sara Hassan",
    licenseNumber: "DL-67890",
    status: "On Trip",
    assignedVehicle: "Van B",
    ongoingTrip: "Trip #456",
  ),
  Driver(name: "Mohamed Salah", licenseNumber: "DL-54321", status: "Available"),
  Driver(
    name: "Khaled Al-Shehri",
    licenseNumber: "DL-09876",
    status: "On Trip",
  ),
  Driver(
    name: "Ibrahim Mohamed",
    licenseNumber: "DL-60001",
    status: "On Trip",
    assignedVehicle: "Van B",
    ongoingTrip: "Trip #456",
  ),
  Driver(
    name: "Mohab Al-Mansour",
    licenseNumber: "DL-12457",
    status: "Available",
  ),
  Driver(name: "Sohib Mohamed", licenseNumber: "DL-00095", status: "Available"),
  Driver(
    name: "Mazen Hassan",
    licenseNumber: "DL-65423",
    status: "Available",
    assignedVehicle: "Van B",
    ongoingTrip: "Trip #456",
  ),
  Driver(name: "Reyad Ali", licenseNumber: "DL-99845", status: "On Trip"),
];
