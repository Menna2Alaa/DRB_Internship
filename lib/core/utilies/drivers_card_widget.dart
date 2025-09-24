import 'package:drb_internship/core/features/presentation/views/data/models/driver_model.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/drivers_view_body.dart';
import 'package:flutter/material.dart';

class DriversCardWidget extends StatelessWidget {
  const DriversCardWidget({
    super.key,
    required this.driver,
    required this.name,
    required this.licenseNumber,
    required this.status,
  });

  final Driver driver;
  final String name, licenseNumber, status;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text("License: $licenseNumber"),
        trailing: Text(
          status,
          style: TextStyle(
            fontSize: 12,
            color: status == "Available" ? Colors.green : Colors.orange,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DriverViewBody(driver: driver)),
          );
        },
      ),
    );
  }
}
