part of 'widgets.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;

  const CustomButtonWidget({super.key, this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 41,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: darkSlateGrayColor
        ),child: Center(child: Text(buttonText, style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium),)),
      ),
    );
  }
}
