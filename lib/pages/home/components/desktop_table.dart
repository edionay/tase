import 'package:flutter/material.dart';
import 'package:tase/constants.dart';
import 'package:tase/models/user.dart';

class DesktopTable extends StatelessWidget {
  const DesktopTable({required this.users, Key? key}) : super(key: key);
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: DataTable(
            sortColumnIndex: 5,
            sortAscending: true,
            columns: const [
              DataColumn(
                label: Text('First name', style: tableHeaderStyle),
              ),
              DataColumn(
                label: Text('Last name', style: tableHeaderStyle),
              ),
              DataColumn(
                label: Text('Email', style: tableHeaderStyle),
              ),
              DataColumn(
                label: Text('Phone', style: tableHeaderStyle),
              ),
              DataColumn(
                label: Text('Primary group', style: tableHeaderStyle),
              ),
              DataColumn(
                label: Text('Hours studied', style: tableHeaderStyle),
                numeric: true,
              )
            ],
            rows: List.generate(
                users.length,
                (index) => DataRow(cells: [
                      DataCell(Text(users[index].firstName)),
                      DataCell(Text(users[index].lastName)),
                      DataCell(Text(users[index].email)),
                      DataCell(Text(users[index].phone)),
                      DataCell(Text(users[index].primaryGroup)),
                      DataCell(Text(users[index].hoursStudied.toString()))
                    ])),
          ),
        ),
      ),
    );
  }
}
