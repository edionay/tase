import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tase/constants.dart';
import 'package:tase/providers/filter_provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1000;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: Flex(
        direction: isScreenWide ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment:
            isScreenWide ? CrossAxisAlignment.end : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(bottom: isScreenWide ? 0.0 : kDefaultPadding),
            child: const Image(
              image: AssetImage(
                'assets/logo.png',
              ),
              width: 200.0,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Center(
            child: SizedBox(
              width: 500,
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
          ),
        ],
      ),
    );
  }
}
