import 'package:flutter/material.dart';
import 'available_ports_selection_route.dart';
import 'available_ports_selection_view.dart';

/// Controller for [AvailablePortsSelectionRoute].
class AvailablePortsSelectionController extends State<AvailablePortsSelectionRoute> {
  @override
  Widget build(BuildContext context) => AvailablePortsSelectionView(this);
}
