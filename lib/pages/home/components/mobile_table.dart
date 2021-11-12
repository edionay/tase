import 'package:flutter/material.dart';
import 'package:tase/models/user.dart';
import 'mobile_tile.dart';

class MobileTable extends StatelessWidget {
  const MobileTable({required this.users, Key? key}) : super(key: key);
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          users.length, (index) => MobileTile(user: users[index])),
    );
  }
}
