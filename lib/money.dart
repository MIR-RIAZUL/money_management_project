import 'package:flutter/material.dart';

class MOneyManagement extends StatefulWidget {
  const MOneyManagement({super.key});

  @override
  State<MOneyManagement> createState() => _MOneyManagementState();
}

class _MOneyManagementState extends State<MOneyManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Money Management",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
