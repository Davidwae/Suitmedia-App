part of 'pages.dart';

class ThirdScreen extends StatelessWidget {
  final UserViewModel userViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Obx(() {
        if (userViewModel.isLoading.value && userViewModel.users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userViewModel.users.isEmpty) {
          return const Center(child: Text('No Users Found'));
        }

        return RefreshIndicator(
          onRefresh: () async {
            userViewModel.refreshUsers();
          },
          child: Column(
            children: [
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: userViewModel.users.length +
                      (userViewModel.hasMore.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < userViewModel.users.length) {
                      UserModel user = userViewModel.users[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            UserCardWidget(
                              avatar: user.avatar,
                              firstName: user.firstName,
                              lastName: user.lastName,
                              email: user.email,
                              onTap: () {
                                userViewModel.selectUser(user);
                                Get.back();
                              },
                            ),
                
                            const Divider(), // Menambahkan divider di bawah setiap item
                          ],
                        ),
                      );
                    } else if (userViewModel.hasMore.value) {
                      // Tampilkan CircularProgressIndicator saat memuat halaman berikutnya
                      userViewModel
                          .fetchUsers(); // Load lebih banyak data saat mencapai akhir list
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Container(); // Tidak menampilkan apa pun jika tidak ada lagi data
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
