import 'package:tase/models/user.dart';

class HomeBrain {
  List<User> filterUsers(String inputFilter, List<User> users) {
    inputFilter = sanitizeInput(inputFilter);

    return users.where((user) {
      return user.email.toLowerCase().contains(inputFilter) ||
          user.primaryGroup.toLowerCase().contains(inputFilter);
    }).toList();
  }

  sortUsers(List<User> users, bool isAscending) {
    users.sort((userA, userB) {
      userA.hoursStudied.compareTo(userB.hoursStudied);
      if (userA.hoursStudied < userB.hoursStudied) {
        return isAscending ? -1 : 1;
      } else if (userA.hoursStudied > userB.hoursStudied) {
        return isAscending ? 1 : -1;
      } else {
        return 0;
      }
    });
  }

  sanitizeInput(String input) => input.trim().toLowerCase();
}
