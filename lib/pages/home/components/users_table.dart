import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tase/models/user.dart';
import 'package:tase/pages/home/components/mobile_table.dart';
import 'package:tase/pages/home/home_brain.dart';
import 'package:tase/providers/filter_provider.dart';
import 'package:tase/providers/responsive_provider.dart';
import 'package:tase/services/api.dart';

import 'desktop_table.dart';

class UsersTable extends StatefulWidget {
  const UsersTable({Key? key}) : super(key: key);

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  List<User> users = [];
  List<User> filteredUsers = [];
  HomeBrain homeBrain = HomeBrain();

  String firstName = '';
  String lastName = '';
  String phone = '';
  String email = '';
  String primaryGroup = '';
  String hoursStudied = '';

  final hoursInputController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    hoursInputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    API.getUsers().then((value) {
      setState(() {
        users = value;
        filteredUsers = value;
        homeBrain.sortUsers(filteredUsers, true);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool tableView = context.watch<ResponsiveProvider>().tableView;

    return Column(
      children: [
        Consumer<FilterProvider>(builder: (context, provider, child) {
          provider.addListener(() {
            setState(() {
              homeBrain.sortUsers(users, provider.isAscending);
              filteredUsers =
                  homeBrain.filterUsers(provider.inputFilter, users);
            });
          });

          return ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: Column(
              children: [
                TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'First name: ',
                    ),
                    onChanged: (String input) {
                      firstName = input;
                    }),
                TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Last name: ',
                    ),
                    onChanged: (String input) {
                      lastName = input;
                    }),
                TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Phone: ',
                    ),
                    onChanged: (String input) {
                      phone = input;
                    }),
                TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email: ',
                    ),
                    onChanged: (String input) {
                      email = input;
                    }),
                TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Primary group: ',
                    ),
                    onChanged: (String input) {
                      primaryGroup = input;
                    }),
                TextFormField(
                    controller: hoursInputController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Hours studied: ',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    onChanged: (String input) {
                      try {
                        int.parse(input);
                        hoursStudied = input;
                      } catch (error) {
                        hoursInputController.text = '';
                      }
                    }),
                TextButton(
                    onPressed: () {
                      User newUser = User(
                          email: email,
                          firstName: firstName,
                          lastName: lastName,
                          primaryGroup: primaryGroup,
                          hoursStudied: int.parse(hoursStudied),
                          phone: phone);

                      setState(() {
                        filteredUsers.add(newUser);
                      });
                    },
                    child: const Text('Submit')),
                if (tableView) DesktopTable(users: filteredUsers),
                if (!tableView) MobileTable(users: filteredUsers)
              ],
            ),
          );
        }),
      ],
    );
  }
}
