import 'package:get/get.dart';
import '../models/palindrome_model.dart';

class PalindromeViewModel extends GetxController {
  var name = ''.obs;
  var sentence = ''.obs;
  var result = false.obs;

  void checkPalindrome() {
    PalindromeModel palindrome = PalindromeModel(sentence: sentence.value);
    result.value = palindrome.isPalindrome();
  }
}
