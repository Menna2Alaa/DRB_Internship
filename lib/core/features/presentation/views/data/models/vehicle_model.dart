class Vehicle {
  final String id;
  final String name;
  final String type;
  String status;
  String? assignedDriver;
  String? currentTrip;

  Vehicle({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    this.assignedDriver,
    this.currentTrip,
  });
}
