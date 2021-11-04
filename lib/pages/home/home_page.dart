import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tase/pages/home/components/users_table.dart';
import 'package:tase/providers/filter_provider.dart';

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
            const UsersTable()
          ],
        ),
      ),
    );
  }
}
