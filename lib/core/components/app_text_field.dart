import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../design/design_principles.dart';

/// App Text Field Component
/// A reusable text field component that follows the design principles
class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isRequired;
  final String? initialValue;

  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.isRequired = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Row(
            children: [
              Text(
                label!,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: DesignPrinciples.fontWeightMedium,
                ),
              ),
              if (isRequired) ...[
                const SizedBox(width: DesignPrinciples.spacing1),
                Text(
                  '*',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: DesignPrinciples.errorRed,
                    fontWeight: DesignPrinciples.fontWeightBold,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: DesignPrinciples.spacing2),
        ],
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          keyboardType: keyboardType,
          obscureText: obscureText,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: maxLines,
          maxLength: maxLength,
          textInputAction: textInputAction,
          onTap: onTap,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          validator: validator,
          inputFormatters: inputFormatters,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: enabled ? theme.colorScheme.onSurface : theme.colorScheme.onSurface.withOpacity(0.6),
          ),
          decoration: InputDecoration(
            hintText: hint,
            helperText: helperText,
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: enabled 
                ? theme.colorScheme.surfaceContainerLowest
                : theme.colorScheme.surfaceContainerLow,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
              borderSide: BorderSide(
                color: theme.colorScheme.outline,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
              borderSide: BorderSide(
                color: theme.colorScheme.outline,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
              borderSide: BorderSide(
                color: DesignPrinciples.errorRed,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
              borderSide: BorderSide(
                color: DesignPrinciples.errorRed,
                width: 2.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
              borderSide: BorderSide(
                color: theme.colorScheme.outline.withOpacity(0.3),
                width: 1.0,
              ),
            ),
            contentPadding: DesignPrinciples.inputFieldPadding,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            helperStyle: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            errorStyle: theme.textTheme.bodySmall?.copyWith(
              color: DesignPrinciples.errorRed,
            ),
            counterStyle: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

/// App Text Field with specific configurations for common use cases
class AppTextFieldWithConfig {
  /// Phone number text field
  static AppTextField phone({
    Key? key,
    String? label,
    String? hint,
    String? errorText,
    TextEditingController? controller,
    bool enabled = true,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    bool isRequired = false,
  }) {
    return AppTextField(
      key: key,
      label: label ?? 'Phone Number',
      hint: hint ?? 'Enter your phone number',
      errorText: errorText,
      controller: controller,
      keyboardType: TextInputType.phone,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      isRequired: isRequired,
      prefixIcon: const Icon(Icons.phone),
    );
  }

  /// Password text field
  static AppTextField password({
    Key? key,
    String? label,
    String? hint,
    String? errorText,
    TextEditingController? controller,
    bool enabled = true,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    bool isRequired = false,
  }) {
    return AppTextField(
      key: key,
      label: label ?? 'Password',
      hint: hint ?? 'Enter your password',
      errorText: errorText,
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      isRequired: isRequired,
      prefixIcon: const Icon(Icons.lock),
    );
  }

  /// Email text field
  static AppTextField email({
    Key? key,
    String? label,
    String? hint,
    String? errorText,
    TextEditingController? controller,
    bool enabled = true,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    bool isRequired = false,
  }) {
    return AppTextField(
      key: key,
      label: label ?? 'Email',
      hint: hint ?? 'Enter your email',
      errorText: errorText,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      isRequired: isRequired,
      prefixIcon: const Icon(Icons.email),
    );
  }

  /// Name text field
  static AppTextField name({
    Key? key,
    String? label,
    String? hint,
    String? errorText,
    TextEditingController? controller,
    bool enabled = true,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    bool isRequired = false,
  }) {
    return AppTextField(
      key: key,
      label: label ?? 'Name',
      hint: hint ?? 'Enter your name',
      errorText: errorText,
      controller: controller,
      keyboardType: TextInputType.name,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      isRequired: isRequired,
      prefixIcon: const Icon(Icons.person),
    );
  }

  /// Address text field
  static AppTextField address({
    Key? key,
    String? label,
    String? hint,
    String? errorText,
    TextEditingController? controller,
    bool enabled = true,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    bool isRequired = false,
  }) {
    return AppTextField(
      key: key,
      label: label ?? 'Address',
      hint: hint ?? 'Enter your address',
      errorText: errorText,
      controller: controller,
      keyboardType: TextInputType.streetAddress,
      maxLines: 3,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      isRequired: isRequired,
      prefixIcon: const Icon(Icons.location_on),
    );
  }
} 