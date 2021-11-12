import 'dart:ui';

import 'package:flutter/material.dart';
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
