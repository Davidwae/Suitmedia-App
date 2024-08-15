part of 'widgets.dart';

class TextfieldCustom extends StatelessWidget {
  final String hintText;
  final onChanged;

  const TextfieldCustom({super.key, required this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: greyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          contentPadding: const EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
