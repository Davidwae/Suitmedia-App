part of 'pages.dart';

class SecondScreen extends StatelessWidget {
  final PalindromeViewModel palindromeViewModel = Get.find();
  final UserViewModel userViewModel = Get.put(UserViewModel());

  SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: reguler),
                  ),
                  Text(
                    palindromeViewModel.name.value,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 222,
            ),
            Center(
                child: Obx(() => Text(
                      userViewModel.selectedUserName.value,
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    )))
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButtonWidget(
          buttonText: 'Choose a User',
          onTap: () {
            Get.to(ThirdScreen());
          },
        ),
      ),
    );
  }
}
