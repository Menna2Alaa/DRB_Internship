import 'package:drb_internship/core/features/presentation/views/data/models/vehicle_model.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/vehicles_view_body.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key,
    required this.vehicle,
    required this.id,
    required this.name,
    required this.type,
    required this.status,
  });

  final Vehicle vehicle;
  final String id, name, type, status;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("$id - $name"),
        subtitle: Text("Type: $type"),
        trailing: Text(
          status,
          style: TextStyle(
            fontSize: 12,
            color: status == "Available" ? Colors.green : Colors.red,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VehicleViewBody(vehicle: vehicle),
            ),
          );
        },
      ),
    );
  }
}
