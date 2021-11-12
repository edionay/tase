import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tase/constants.dart';
import 'package:tase/providers/filter_provider.dart';
import 'package:tase/providers/responsive_provider.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1000;

    return Flex(
      direction: isScreenWide ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment:
          isScreenWide ? CrossAxisAlignment.end : CrossAxisAlignment.center,
      mainAxisAlignment: isScreenWide
          ? MainAxisAlignment.spaceAround
          : MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Provider.of<FilterProvider>(context, listen: false).toggleSorting();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sort by hours studied'),
              Consumer<FilterProvider>(builder: (context, provider, child) {
                return Column(
                  children: [
                    if (provider.isAscending) const Icon(Icons.arrow_drop_up),
                    if (!provider.isAscending) const Icon(Icons.arrow_drop_down)
                  ],
                );
              }),
            ],
          ),
        ),
        Row(
          mainAxisAlignment:
              isScreenWide ? MainAxisAlignment.end : MainAxisAlignment.center,
          children: [
            const Text('View mode: '),
            IconButton(
                onPressed: () {
                  Provider.of<ResponsiveProvider>(context, listen: false)
                      .tableView = false;
                },
                icon: const Icon(Icons.phone_android)),
            IconButton(
                onPressed: () {
                  Provider.of<ResponsiveProvider>(context, listen: false)
                      .tableView = true;
                },
                icon: const Icon(Icons.desktop_windows)),
            const SizedBox(
              width: kDefaultPadding * 2,
            )
          ],
        ),
      ],
    );
  }
}
