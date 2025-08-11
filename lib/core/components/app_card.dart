import 'package:flutter/material.dart';
import '../design/design_principles.dart';

/// App Card Component
/// A reusable card component that follows the design principles
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final bool isInteractive;

  const AppCard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation,
    this.backgroundColor,
    this.borderRadius,
    this.onTap,
    this.isInteractive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget card = Card(
      color: backgroundColor ?? theme.colorScheme.surface,
      elevation: elevation ?? 0,
      shadowColor: theme.colorScheme.shadow,
      shape: RoundedRectangleBorder(
        borderRadius:
            borderRadius ??
            BorderRadius.circular(DesignPrinciples.cardBorderRadius),
      ),
      margin: margin ?? const EdgeInsets.all(DesignPrinciples.spacing4),
      child: Padding(
        padding: padding ?? DesignPrinciples.cardPadding,
        child: child,
      ),
    );

    if (isInteractive || onTap != null) {
      card = InkWell(
        onTap: onTap,
        borderRadius:
            borderRadius ??
            BorderRadius.circular(DesignPrinciples.cardBorderRadius),
        child: card,
      );
    }

    return card;
  }
}

