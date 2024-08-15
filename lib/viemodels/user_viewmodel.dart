import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/user_model.dart';

class UserViewModel extends GetxController {
  var selectedUserName = ''.obs;
  var users = <UserModel>[].obs;
  var page = 1.obs;
  var isLoading = false.obs;
  var hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    if (isLoading.value) return;
    isLoading.value = true;

    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=${page.value}&per_page=10'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<UserModel> loadedUsers = (data['data'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList();

      if (loadedUsers.isNotEmpty) {
        users.addAll(loadedUsers);
        page.value++;
      } else {
        hasMore.value = false;
      }
    }

    isLoading.value = false;
  }

  void selectUser(UserModel user) {
    selectedUserName.value = '${user.firstName} ${user.lastName}';
  }

  void refreshUsers() async{
    users.clear();
    page.value = 1;
    hasMore.value = true;
    isLoading.value = false;
    fetchUsers();
  }
}