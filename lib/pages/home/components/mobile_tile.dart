import 'package:flutter/material.dart';
import 'package:tase/constants.dart';
import 'package:tase/models/user.dart';

class MobileTile extends StatelessWidget {

  const MobileTile({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(user.firstName),
              Text(' ${user.lastName}'),
            ],
          ),
          Text(user.hoursStudied.toString())
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Email:'), Text(user.email)],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Phone:'), Text(user.phone)],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Primary group:'), Text(user.primaryGroup)],
          ),
        )
      ],
    );
  }
}
