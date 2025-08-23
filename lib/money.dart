import 'package:flutter/material.dart';

class MOneyManagement extends StatefulWidget {
  const MOneyManagement({super.key});

  @override
  State<MOneyManagement> createState() => _MOneyManagementState();
}

class _MOneyManagementState extends State<MOneyManagement>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _earning = [];
  final List<Map<String, dynamic>> _expense = [];

  void addEntry(String title, double amount, DateTime date, bool isEarning) {
    setState(() {
      if (isEarning) {
        _earning.add({"title": title, "amount": amount, "date": date});
      } else {
        _expense.add({"title": title, "amount": amount, "date": date});
      }
    });
  }

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _showFAButton(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _showForm(isEarning: true);
                },
                child: Text("add earning"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _showForm(isEarning: false);
                },
                child: Text("add Expense"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showForm({required bool isEarning}) {
    TextEditingController titleEditingController = TextEditingController();
    TextEditingController amountEditingController = TextEditingController();
    DateTime entryDate = DateTime.now();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                isEarning ? "Add Earning" : "Add Expense",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: titleEditingController,
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: amountEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "amount",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isEarning ? Colors.green : Colors.red,
                ),
                onPressed: () {
                  if (titleEditingController.text.isNotEmpty &&
                      amountEditingController.text.isNotEmpty) {
                    addEntry(
                      titleEditingController.text,
                      double.parse(amountEditingController.text),
                      entryDate,
                      isEarning,
                    );
                    Navigator.pop(
                      context,
                    ); // Close the bottom sheet after adding
                  }
                },
                child: Text(isEarning ? "Add earning" : "add expense"),
              ),
            ],
          ),
        );
      },
    );
  }

  double calculateTotalEarnings() {
    return _earning.fold(0, (sum, item) => sum + (item["amount"] as double));
  }

  double calculateTotalExpenses() {
    return _expense.fold(0, (sum, item) => sum + (item["amount"] as double));
  }

  double calculateBalance() {
    return calculateTotalEarnings() - calculateTotalExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.teal,
              child: SafeArea(
                child: Stack(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.teal),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 39,
                            backgroundImage: NetworkImage(
                              "https://scontent.fdac189-1.fna.fbcdn.net/v/t39.30808-6/498692148_2403836573324104_1909885292037843185_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeEVoUPyQnEvaf0hWgVl0Rh5QILtjBdjuYhAgu2MF2O5iPq5jpCoadpblyZnf4v4lcTRh1uy1iM4hBN7L2dkd4Ab&_nc_ohc=H3q565fx_YgQ7kNvwGvdBQG&_nc_oc=Adkdn0LQolkR1xlqEIQEF-Efx7nDtijEstoZOi4qEOf-YUQHuajQugz-SF9xCRNc1CY&_nc_zt=23&_nc_ht=scontent.fdac189-1.fna&_nc_gid=GyR5ExO4TXsMJBa5fpU7Cg&oh=00_AfVob-7ivuLLT36KPX_j26DOlnoZi1AhN0tvBjqZsFQV1w&oe=68AFB9CC",
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Mir Riazul",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "mirriazul859@.com",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Balance: ₹${calculateBalance().toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 53,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Earning: ₹${calculateTotalEarnings().toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Earning: ₹${calculateTotalExpenses().toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Add other drawer items here
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            "Money Management",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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
                value: calculateTotalEarnings(),
                color: Colors.teal,
              ),
              _buildsummarycard(
                title: 'Expense',
                value: calculateTotalExpenses(),
                color: Colors.teal,
              ),
              _buildsummarycard(
                title: 'Balance',
                value: calculateBalance(),
                color: Colors.teal,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildlist(_earning, Colors.green, true),
                _buildlist(_expense, Colors.red, false),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFAButton(context),
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
              value.toStringAsFixed(2), // Format to 2 decimal places
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

Widget _buildlist(
  List<Map<String, dynamic>> items,
  Color color,
  bool isEarning,
) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.5),
            child: Icon(isEarning ? Icons.arrow_upward : Icons.arrow_downward),
          ),
          title: Text(items[index]["title"]),
          subtitle: Text(items[index]["date"].toString()),
          trailing: Text(
            items[index]["amount"].toString(),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    },
  );
}
