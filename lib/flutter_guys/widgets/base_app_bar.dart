import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? centerTitle;
  final Color? backgroundColor;
  final Widget title;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  final Size preferredSize;
  const BaseAppBar({super.key, this.preferredSize = const Size.fromHeight(kToolbarHeight), this.centerTitle, this.backgroundColor, required this.title, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle ?? true,
      backgroundColor: backgroundColor ?? Colors.greenAccent,
      title: title,
      leading: leading,
      actions: actions,
    );
  }
}
