import 'package:flutter/material.dart';
import '../design/design_principles.dart';

/// App Button Component
/// A reusable button component that follows the design principles
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  final bool isFullWidth;
  final double? width;
  final double? height;

  const AppButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.icon,
    this.isFullWidth = true,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Widget button;
    
    switch (variant) {
      case AppButtonVariant.primary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignPrinciples.buttonBorderRadius),
            ),
            padding: DesignPrinciples.buttonPadding,
            minimumSize: Size(
              isFullWidth ? double.infinity : (width ?? 0),
              height ?? DesignPrinciples.buttonHeight,
            ),
            textStyle: const TextStyle(
              fontSize: DesignPrinciples.fontSizeBase,
              fontWeight: DesignPrinciples.fontWeightSemiBold,
              fontFamily: DesignPrinciples.fontFamilyPrimary,
            ),
          ),
          child: _buildButtonContent(),
        );
        break;
        
      case AppButtonVariant.secondary:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: theme.colorScheme.primary,
            backgroundColor: Colors.transparent,
            side: BorderSide(
              color: theme.colorScheme.primary,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignPrinciples.buttonBorderRadius),
            ),
            padding: DesignPrinciples.buttonPadding,
            minimumSize: Size(
              isFullWidth ? double.infinity : (width ?? 0),
              height ?? DesignPrinciples.buttonHeight,
            ),
            textStyle: const TextStyle(
              fontSize: DesignPrinciples.fontSizeBase,
              fontWeight: DesignPrinciples.fontWeightSemiBold,
              fontFamily: DesignPrinciples.fontFamilyPrimary,
            ),
          ),
          child: _buildButtonContent(),
        );
        break;
        
      case AppButtonVariant.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: theme.colorScheme.primary,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignPrinciples.buttonBorderRadius),
            ),
            padding: DesignPrinciples.buttonPadding,
            minimumSize: Size(
              isFullWidth ? double.infinity : (width ?? 0),
              height ?? DesignPrinciples.buttonHeight,
            ),
            textStyle: const TextStyle(
              fontSize: DesignPrinciples.fontSizeBase,
              fontWeight: DesignPrinciples.fontWeightSemiBold,
              fontFamily: DesignPrinciples.fontFamilyPrimary,
            ),
          ),
          child: _buildButtonContent(),
        );
        break;
        
      case AppButtonVariant.danger:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: DesignPrinciples.errorRed,
            foregroundColor: DesignPrinciples.neutralWhite,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignPrinciples.buttonBorderRadius),
            ),
            padding: DesignPrinciples.buttonPadding,
            minimumSize: Size(
              isFullWidth ? double.infinity : (width ?? 0),
              height ?? DesignPrinciples.buttonHeight,
            ),
            textStyle: const TextStyle(
              fontSize: DesignPrinciples.fontSizeBase,
              fontWeight: DesignPrinciples.fontWeightSemiBold,
              fontFamily: DesignPrinciples.fontFamilyPrimary,
            ),
          ),
          child: _buildButtonContent(),
        );
        break;
    }
    
    return button;
  }
  
  Widget _buildButtonContent() {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == AppButtonVariant.primary || variant == AppButtonVariant.danger
                ? DesignPrinciples.neutralWhite
                : DesignPrinciples.primaryBlue,
          ),
        ),
      );
    }
    
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: DesignPrinciples.spacing2),
          Text(text),
        ],
      );
    }
    
    return Text(text);
  }
}

/// Button variants
enum AppButtonVariant {
  primary,
  secondary,
  text,
  danger,
} 