import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tase/pages/home/components/users_table.dart';
import 'package:tase/pages/home/components/header.dart';
import 'components/options.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1050),
                child: Column(
                  children: const [
                    Header(),
                    Options(),
                    UsersTable(),
                    // if (!tableView) const MobileTable()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


