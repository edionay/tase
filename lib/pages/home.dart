import 'package:flutter/material.dart';
import 'package:tase/models/user.dart';
import 'package:tase/services/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAscending = true;
  List<User> users = [];
  List<User> filteredUsers = [];
  List<DataRow> userRows = [];

  onSort(int columnIndex, bool ascending) {
    setState(() {
      isAscending = ascending;
    });

    setState(() {
      filteredUsers.sort((userA, userB) {
        userA.hoursStudied.compareTo(userB.hoursStudied);
        if (userA.hoursStudied < userB.hoursStudied) {
          return isAscending ? -1 : 1;
        } else if (userA.hoursStudied > userB.hoursStudied) {
          return isAscending ? 1 : -1;
        } else {
          return 0;
        }
      });
    });
  }

  sanitizeInput(String input) => input.trim().toLowerCase();

  filter(String input) {
    input = sanitizeInput(input);

    setState(() {
      filteredUsers = users.where((user) {
        return user.email.toLowerCase().contains(input) ||
            user.primaryGroup.toLowerCase().contains(input);
      }).toList();
    });
  }

  @override
  void initState() {
    API.getUsers().then((users) {
      this.users = users;
      setState(() {
        filteredUsers = users;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search by Email ou Primary Group',
                  ),
                  onChanged: (String input) {
                    filter(input);
                  }),
            ),
            DataTable(
              sortColumnIndex: 5,
              sortAscending: isAscending,
              columns: [
                const DataColumn(
                  label: Text('First name'),
                ),
                const DataColumn(
                  label: Text('Last name'),
                ),
                const DataColumn(
                  label: Text('Email'),
                ),
                const DataColumn(
                  label: Text('Phone'),
                ),
                const DataColumn(
                  label: Text('Primary group'),
                ),
                DataColumn(
                    label: const Text('Hours studied'),
                    numeric: true,
                    onSort: onSort)
              ],
              rows: List.generate(
                  filteredUsers.length,
                  (index) => DataRow(cells: [
                        DataCell(Text(filteredUsers[index].firstName)),
                        DataCell(Text(filteredUsers[index].lastName)),
                        DataCell(Text(filteredUsers[index].email)),
                        DataCell(Text(filteredUsers[index].phone)),
                        DataCell(Text(filteredUsers[index].primaryGroup)),
                        DataCell(
                            Text(filteredUsers[index].hoursStudied.toString()))
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
