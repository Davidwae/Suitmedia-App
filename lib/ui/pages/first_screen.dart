part of 'pages.dart';

class FirstScreen extends StatelessWidget {
  final PalindromeViewModel viewModel = Get.put(PalindromeViewModel());

  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background.png'), // Ganti dengan path gambar kamu
            fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran layar
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/ic_photo.png',
                  scale: 2.5,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextfieldCustom(
                  hintText: 'Name',
                  onChanged: (value) {
                    viewModel.name.value = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextfieldCustom(
                  hintText: 'Palindrome',
                  onChanged: (value) {
                    viewModel.sentence.value = value;
                  },
                ),
                const SizedBox(
                  height: 45,
                ),
                CustomButtonWidget(
                  buttonText: 'CHECK',
                  onTap: () {
                    viewModel.checkPalindrome();
                    Get.defaultDialog(
                      title: 'Result',
                      middleText: viewModel.result.value
                          ? 'isPalindrome'
                          : 'not palindrome',
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButtonWidget(
                  buttonText: 'NEXT',
                  onTap: () {
                    Get.to(SecondScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
