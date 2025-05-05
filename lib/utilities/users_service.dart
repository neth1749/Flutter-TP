// TODO-2: Import http and dart:convert

class UsersService {
  static final UsersService _singleton = UsersService._internal();
  UsersService._internal();
  static UsersService get instance => _singleton;

  // TODO-3: Add base URL

  Future<List<dynamic>> getUsers() async {
    // TODO-4: Fetch all users
  }

  Future<dynamic> updateUser(String id, Map<String, dynamic> data) async {
    // TODO-5: Update a user
  }

  Future<dynamic> createUser(Map<String, dynamic> data) async {
    // TODO-6: Create new user
  }

  Future<dynamic> deleteUser(String id) async {
    // TODO-7: Delete a user
  }
}
