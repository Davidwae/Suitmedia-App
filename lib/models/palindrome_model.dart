class PalindromeModel {
  final String sentence;

  PalindromeModel({required this.sentence});

  bool isPalindrome() {
    String cleanedText = sentence.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join('');
    return cleanedText == reversedText;
  }
}
