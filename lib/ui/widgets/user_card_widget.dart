part of 'widgets.dart';

class UserCardWidget extends StatelessWidget {
  final String avatar, firstName, lastName, email;
  final VoidCallback? onTap;

  const UserCardWidget({super.key, required this.avatar, required this.firstName, required this.lastName, required this.email, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(avatar),
      ),
      title: Text('${firstName} ${lastName}'),
      subtitle: Text(email),
      onTap: onTap,
    );
  }
}
