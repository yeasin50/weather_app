import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onTap,
    this.size = const Size.fromHeight(48),
    this.leading,
  });

  @deprecated
  factory AppButton.header({required String label, VoidCallback? onTap}) {
    return AppButton(label: label, onTap: onTap, size: const Size(220, 64));
  }

  static Widget child({required Widget child, VoidCallback? onTap}) =>
      _AppButtonV2(onTap: onTap, child: child);

  final String label;
  final VoidCallback? onTap;
  final Size size;
  final Widget? leading;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    final schema = Theme.of(context).colorScheme;

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: schema.onPrimaryFixedVariant,
        backgroundColor: schema.primaryFixedDim,
        shape: const StadiumBorder(),
        fixedSize: widget.size,
      ),
      onPressed: widget.onTap,
      label: Text(widget.label),
      icon: widget.leading,
    );
  }
}

class _AppButtonV2 extends StatelessWidget {
  const _AppButtonV2({this.onTap, required this.child});
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final border = StadiumBorder(
      side: BorderSide(color: Theme.of(context).colorScheme.primaryContainer),
    );
    return Material(
      shape: border,
      child: InkWell(
        customBorder: border,
        onTap: onTap,
        child: Padding(
          padding: const .symmetric(horizontal: 16, vertical: 12),
          child: child,
        ),
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({super.key, required this.icon, this.onTap});
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: icon);
  }
}
