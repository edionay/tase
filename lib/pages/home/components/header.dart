import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tase/providers/filter_provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Image(
            image: AssetImage(
              'assets/logo.png',
            ),
            width: 200.0,
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            // constraints: const BoxConstraints(maxWidth: 500),
            child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search by Email ou Primary Group',
                ),
                onChanged: (String input) {
                  Provider.of<FilterProvider>(context, listen: false).input =
                      input;
                }),
          ),
        ],
      ),
    );
  }
}
