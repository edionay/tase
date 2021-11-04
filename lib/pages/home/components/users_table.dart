import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tase/constants.dart';
import 'package:tase/models/user.dart';
import 'package:tase/pages/home/home_brain.dart';
import 'package:tase/providers/filter_provider.dart';
import 'package:tase/services/api.dart';

class UsersTable extends StatefulWidget {
  const UsersTable({Key? key}) : super(key: key);

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  bool isAscending = true;
  List<User> users = [];
  List<User> filteredUsers = [];
  HomeBrain homeBrain = HomeBrain();

  filter(String input) {
    setState(() {
      filteredUsers = homeBrain.filterUsers(input, users);
    });
  }

  onSort(int columnIndex, bool ascending) {
    setState(() {
      isAscending = ascending;
      homeBrain.sortUsers(filteredUsers, ascending);
    });
  }

  @override
  void initState() {
    setState(() {
      filteredUsers = users;
    });

    API.getUsers().then((value) {
      setState(() {
        users = value;
        filteredUsers = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        child: Consumer<FilterProvider>(builder: (context, provider, child) {
          provider.addListener(() {
            filter(provider.inputFilter);
          });

          return ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                sortColumnIndex: 5,
                sortAscending: isAscending,
                columns: [
                  const DataColumn(
                    label: Text('First name', style: tableHeaderStyle),
                  ),
                  const DataColumn(
                    label: Text('Last name', style: tableHeaderStyle),
                  ),
                  const DataColumn(
                    label: Text('Email', style: tableHeaderStyle),
                  ),
                  const DataColumn(
                    label: Text('Phone', style: tableHeaderStyle),
                  ),
                  const DataColumn(
                    label: Text('Primary group', style: tableHeaderStyle),
                  ),
                  DataColumn(
                      label:
                          const Text('Hours studied', style: tableHeaderStyle),
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
                          DataCell(Text(
                              filteredUsers[index].hoursStudied.toString()))
                        ])),
              ),
            ),
          );
        }),
      ),
    );
  }
}
