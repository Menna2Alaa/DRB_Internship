class Trip {
  final String id;
  final String driver;
  final String vehicle;
  final String pickup;
  final String dropoff;
  String status;

  Trip({
    required this.id,
    required this.driver,
    required this.vehicle,
    required this.pickup,
    required this.dropoff,
    required this.status,
  });
}
