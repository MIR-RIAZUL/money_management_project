import 'package:flutter/material.dart';

class MOneyManagement extends StatefulWidget {
  const MOneyManagement({super.key});

  @override
  State<MOneyManagement> createState() => _MOneyManagementState();
}

class _MOneyManagementState extends State<MOneyManagement>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Money Management",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "Earning",
              icon: Icon(Icons.arrow_upward, color: Colors.white),
            ),
            Tab(
              text: "Expanse",
              icon: Icon(Icons.arrow_downward, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              _buildsummarycard(
                title: 'Earning',
                value: 2000,
                color: Colors.green,
              ),
              _buildsummarycard(
                title: 'Expance',
                value: 100,
                color: Colors.redAccent,
              ),
              _buildsummarycard(
                title: 'balence',
                value: 2000,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget _buildsummarycard({
  required String title,
  required double value,
  required Color color,
}) {
  return Expanded(
    child: Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
