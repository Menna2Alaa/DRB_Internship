class Driver {
  final String name;
  final String licenseNumber;
  String status;
  String? assignedVehicle;
  String? ongoingTrip;

  Driver({
    required this.name,
    required this.licenseNumber,
    required this.status,
    this.assignedVehicle,
    this.ongoingTrip,
  });
}
