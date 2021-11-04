import 'package:tase/models/user.dart';

class API {
  static final List<User> _users = [
    User(
        email: "pam@dm.co",
        firstName: "Pam",
        lastName: "Beesly",
        phone: "054-886-1503",
        primaryGroup: "Sales",
        hoursStudied: 700),
    User(
      email: "jim@dm.co",
      firstName: "Jim",
      lastName: "Halpert",
      phone: "626-927-8328",
      primaryGroup: "Sales",
      hoursStudied: 470,
    ),
    User(
      email: "dwight@dm.co",
      firstName: "Dwight",
      lastName: "Schrute",
      phone: "371-632-4438",
      primaryGroup: "Sales",
      hoursStudied: 590,
    ),
    User(
        email: "stanley@dm.co",
        firstName: "Stanley",
        lastName: "Hudson",
        phone: "972-137-4248",
        primaryGroup: "Sales",
        hoursStudied: 590),
    User(
      email: "kevin@dm.co",
      firstName: "Kevin",
      lastName: "Malone",
      phone: "852-765-4104",
      primaryGroup: "Accounting",
      hoursStudied: 800,
    ),
    User(
      email: "meredith@dm.co",
      firstName: "Meredith",
      lastName: "Palmer",
      phone: "807-952-1123",
      primaryGroup: "Accounting",
      hoursStudied: 300,
    ),
    User(
      email: "phyllis@dm.co",
      firstName: "Phyllis",
      lastName: "Vance",
      phone: "353-001-0420",
      primaryGroup: "Sales",
      hoursStudied: 600,
    ),
    User(
      email: "angela@dm.co",
      firstName: "Angela",
      lastName: "Martin",
      phone: "400-494-5610",
      primaryGroup: "Accounting",
      hoursStudied: 1000,
    ),
    User(
      email: "michael@dm.co",
      firstName: "Michael",
      lastName: "Scott",
      phone: "432-809-6180",
      primaryGroup: "Regional Manager",
      hoursStudied: 630,
    ),
    User(
      email: "oscar@dm.co",
      firstName: "Oscar",
      lastName: "Martinez",
      phone: "990-874-9028",
      primaryGroup: "Accounting",
      hoursStudied: 450,
    ),
    User(
      email: "kelly@dm.co",
      firstName: "Kelly",
      lastName: "Kapoor",
      phone: "977-524-6768",
      primaryGroup: "Customer Service",
      hoursStudied: 510,
    ),
    User(
      email: "creed@dm.co",
      firstName: "Creed",
      lastName: "Bratton",
      phone: "738-004-3739",
      primaryGroup: "Quality & Assurance",
      hoursStudied: 810,
    ),
    User(
      email: "ryan@dm.co",
      firstName: "Ryan",
      lastName: "Howard",
      phone: "760-732-0563",
      primaryGroup: "Sales",
      hoursStudied: 940,
    )
  ];

  final instance = API();

  static Future<List<User>> getUsers() async {
    return _users;
  }
}
