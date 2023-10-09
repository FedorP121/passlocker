part of '../widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.onPressedBack,
    required this.centerTitle,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressedBack;
  final bool centerTitle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(text),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onPressedBack,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
