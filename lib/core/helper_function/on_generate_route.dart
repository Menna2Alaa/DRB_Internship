import 'package:drb_internship/core/features/presentation/views/widgets/assign_trip_view.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/drivers_view.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/home_view.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/trip_view.dart';
import 'package:drb_internship/core/features/presentation/views/widgets/vehicles_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DriversView.routeName:
      return MaterialPageRoute(builder: (_) => DriversView());

    case VehiclesView.routeName:
      return MaterialPageRoute(builder: (_) => VehiclesView());

    case TripsView.routeName:
      return MaterialPageRoute(builder: (_) => TripsView());

    case AssignTripView.routeName:
      return MaterialPageRoute(builder: (_) => AssignTripView());

    default:
      return MaterialPageRoute(builder: (_) => HomeView());
  }
}
