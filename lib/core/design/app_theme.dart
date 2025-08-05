import 'package:flutter/material.dart';
import 'design_principles.dart';

/// App Theme Configuration
/// This file contains the complete theme configuration for the cleaning services app
class AppTheme {
  // ==================== LIGHT THEME ====================
  
  static ThemeData get lightTheme {
    return ThemeData(
      // ==================== COLOR SCHEME ====================
      colorScheme: const ColorScheme.light(
        // Primary colors
        primary: DesignPrinciples.primaryBlue,
        primaryContainer: DesignPrinciples.primaryBlueLight,
        onPrimary: DesignPrinciples.neutralWhite,
        onPrimaryContainer: DesignPrinciples.neutralGray900,
        
        // Secondary colors
        secondary: DesignPrinciples.secondaryGreen,
        secondaryContainer: DesignPrinciples.secondaryGreenLight,
        onSecondary: DesignPrinciples.neutralWhite,
        onSecondaryContainer: DesignPrinciples.neutralGray900,
        
        // Tertiary colors
        tertiary: DesignPrinciples.accentOrange,
        tertiaryContainer: DesignPrinciples.accentOrangeLight,
        onTertiary: DesignPrinciples.neutralWhite,
        onTertiaryContainer: DesignPrinciples.neutralGray900,
        
        // Surface colors
        surface: DesignPrinciples.neutralWhite,
        surfaceContainerHighest: DesignPrinciples.neutralGray50,
        surfaceContainerHigh: DesignPrinciples.neutralGray100,
        surfaceContainer: DesignPrinciples.neutralGray200,
        surfaceContainerLow: DesignPrinciples.neutralGray300,
        surfaceContainerLowest: DesignPrinciples.neutralGray400,
        onSurface: DesignPrinciples.neutralGray900,
        onSurfaceVariant: DesignPrinciples.neutralGray700,
        
        // Background colors
        background: DesignPrinciples.neutralWhite,
        onBackground: DesignPrinciples.neutralGray900,
        
        // Error colors
        error: DesignPrinciples.errorRed,
        errorContainer: Color(0xFFFEE2E2),
        onError: DesignPrinciples.neutralWhite,
        onErrorContainer: DesignPrinciples.errorRed,
        
        // Outline colors
        outline: DesignPrinciples.neutralGray300,
        outlineVariant: DesignPrinciples.neutralGray200,
        
        // Shadow colors
        shadow: Color(0x1A000000),
        scrim: Color(0x52000000),
        
        // Inverse colors
        inversePrimary: DesignPrinciples.primaryBlueLight,
        inverseSurface: DesignPrinciples.neutralGray900,
        onInverseSurface: DesignPrinciples.neutralWhite,
      ),
      
      // ==================== TYPOGRAPHY ====================
      textTheme: const TextTheme(
        // Display styles
        displayLarge: TextStyle(
          fontSize: DesignPrinciples.fontSize5xl,
          fontWeight: DesignPrinciples.fontWeightBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralGray900,
        ),
        displayMedium: TextStyle(
          fontSize: DesignPrinciples.fontSize4xl,
          fontWeight: DesignPrinciples.fontWeightBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralGray900,
        ),
        displaySmall: TextStyle(
          fontSize: DesignPrinciples.fontSize3xl,
          fontWeight: DesignPrinciples.fontWeightSemiBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralGray900,
        ),
        
        // Headline styles
        headlineLarge: TextStyle(
          fontSize: DesignPrinciples.fontSize2xl,
          fontWeight: DesignPrinciples.fontWeightSemiBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralGray900,
        ),
        headlineMedium: TextStyle(
          fontSize: DesignPrinciples.fontSizeXl,
          fontWeight: DesignPrinciples.fontWeightSemiBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralGray900,
        ),
        headlineSmall: TextStyle(
          fontSize: DesignPrinciples.fontSizeLg,
          fontWeight: DesignPrinciples.fontWeightSemiBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralGray900,
        ),
        
        // Title styles
        titleLarge: TextStyle(
          fontSize: DesignPrinciples.fontSizeLg,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray900,
        ),
        titleMedium: TextStyle(
          fontSize: DesignPrinciples.fontSizeBase,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray900,
        ),
        titleSmall: TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray700,
        ),
        
        // Body styles
        bodyLarge: TextStyle(
          fontSize: DesignPrinciples.fontSizeBase,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray900,
        ),
        bodyMedium: TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray700,
        ),
        bodySmall: TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray600,
        ),
        
        // Label styles
        labelLarge: TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray700,
        ),
        labelMedium: TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray600,
        ),
        labelSmall: TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray500,
        ),
      ),
      
      // ==================== COMPONENT THEMES ====================
      
      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: DesignPrinciples.neutralWhite,
        foregroundColor: DesignPrinciples.neutralGray900,
        elevation: DesignPrinciples.appBarElevation,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: DesignPrinciples.fontSizeLg,
          fontWeight: DesignPrinciples.fontWeightSemiBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          color: DesignPrinciples.neutralGray900,
        ),
        iconTheme: IconThemeData(
          color: DesignPrinciples.neutralGray700,
          size: 24.0,
        ),
        actionsIconTheme: IconThemeData(
          color: DesignPrinciples.neutralGray700,
          size: 24.0,
        ),
      ),
      
      // Card Theme
      cardTheme: CardTheme(
        color: DesignPrinciples.neutralWhite,
        elevation: 0,
        shadowColor: DesignPrinciples.neutralGray900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.cardBorderRadius),
        ),
        margin: const EdgeInsets.all(DesignPrinciples.spacing4),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DesignPrinciples.primaryBlue,
          foregroundColor: DesignPrinciples.neutralWhite,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignPrinciples.buttonBorderRadius),
          ),
          padding: DesignPrinciples.buttonPadding,
          minimumSize: const Size(double.infinity, DesignPrinciples.buttonHeight),
          textStyle: const TextStyle(
            fontSize: DesignPrinciples.fontSizeBase,
            fontWeight: DesignPrinciples.fontWeightSemiBold,
            fontFamily: DesignPrinciples.fontFamilyPrimary,
          ),
        ),
      ),
      
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: DesignPrinciples.primaryBlue,
          backgroundColor: Colors.transparent,
          side: const BorderSide(
            color: DesignPrinciples.primaryBlue,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignPrinciples.buttonBorderRadius),
          ),
          padding: DesignPrinciples.buttonPadding,
          minimumSize: const Size(double.infinity, DesignPrinciples.buttonHeight),
          textStyle: const TextStyle(
            fontSize: DesignPrinciples.fontSizeBase,
            fontWeight: DesignPrinciples.fontWeightSemiBold,
            fontFamily: DesignPrinciples.fontFamilyPrimary,
          ),
        ),
      ),
      
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: DesignPrinciples.primaryBlue,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignPrinciples.buttonBorderRadius),
          ),
          padding: DesignPrinciples.buttonPadding,
          minimumSize: const Size(double.infinity, DesignPrinciples.buttonHeight),
          textStyle: const TextStyle(
            fontSize: DesignPrinciples.fontSizeBase,
            fontWeight: DesignPrinciples.fontWeightSemiBold,
            fontFamily: DesignPrinciples.fontFamilyPrimary,
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DesignPrinciples.neutralGray50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
          borderSide: const BorderSide(
            color: DesignPrinciples.neutralGray300,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
          borderSide: const BorderSide(
            color: DesignPrinciples.neutralGray300,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
          borderSide: const BorderSide(
            color: DesignPrinciples.primaryBlue,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
          borderSide: const BorderSide(
            color: DesignPrinciples.errorRed,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
          borderSide: const BorderSide(
            color: DesignPrinciples.errorRed,
            width: 2.0,
          ),
        ),
        contentPadding: DesignPrinciples.inputFieldPadding,
        labelStyle: const TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          color: DesignPrinciples.neutralGray600,
        ),
        hintStyle: const TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          color: DesignPrinciples.neutralGray500,
        ),
        errorStyle: const TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          color: DesignPrinciples.errorRed,
        ),
      ),
      
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: DesignPrinciples.neutralWhite,
        selectedItemColor: DesignPrinciples.primaryBlue,
        unselectedItemColor: DesignPrinciples.neutralGray500,
        selectedLabelStyle: TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: DesignPrinciples.primaryBlue,
        foregroundColor: DesignPrinciples.neutralWhite,
        elevation: 6,
        shape: CircleBorder(),
      ),
      
      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: DesignPrinciples.neutralGray100,
        selectedColor: DesignPrinciples.primaryBlue,
        disabledColor: DesignPrinciples.neutralGray200,
        labelStyle: const TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.borderRadiusFull),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: DesignPrinciples.spacing3,
          vertical: DesignPrinciples.spacing1,
        ),
      ),
      
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: DesignPrinciples.neutralGray200,
        thickness: 1.0,
        space: 1.0,
      ),
      
      // Icon Theme
      iconTheme: const IconThemeData(
        color: DesignPrinciples.neutralGray700,
        size: 24.0,
      ),
      
      // Primary Icon Theme
      primaryIconTheme: const IconThemeData(
        color: DesignPrinciples.primaryBlue,
        size: 24.0,
      ),
      
      // ==================== OTHER THEME PROPERTIES ====================
      
      useMaterial3: true,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
  
  // ==================== DARK THEME ====================
  
  static ThemeData get darkTheme {
    return ThemeData(
      // ==================== COLOR SCHEME ====================
      colorScheme: const ColorScheme.dark(
        // Primary colors
        primary: DesignPrinciples.primaryBlueLight,
        primaryContainer: DesignPrinciples.primaryBlue,
        onPrimary: DesignPrinciples.neutralWhite,
        onPrimaryContainer: DesignPrinciples.neutralWhite,
        
        // Secondary colors
        secondary: DesignPrinciples.secondaryGreenLight,
        secondaryContainer: DesignPrinciples.secondaryGreen,
        onSecondary: DesignPrinciples.neutralBlack,
        onSecondaryContainer: DesignPrinciples.neutralWhite,
        
        // Tertiary colors
        tertiary: DesignPrinciples.accentOrangeLight,
        tertiaryContainer: DesignPrinciples.accentOrange,
        onTertiary: DesignPrinciples.neutralBlack,
        onTertiaryContainer: DesignPrinciples.neutralWhite,
        
        // Surface colors
        surface: DesignPrinciples.neutralGray900,
        surfaceContainerHighest: DesignPrinciples.neutralGray800,
        surfaceContainerHigh: DesignPrinciples.neutralGray700,
        surfaceContainer: DesignPrinciples.neutralGray600,
        surfaceContainerLow: DesignPrinciples.neutralGray500,
        surfaceContainerLowest: DesignPrinciples.neutralGray400,
        onSurface: DesignPrinciples.neutralWhite,
        onSurfaceVariant: DesignPrinciples.neutralGray300,
        
        // Background colors
        background: DesignPrinciples.neutralBlack,
        onBackground: DesignPrinciples.neutralWhite,
        
        // Error colors
        error: DesignPrinciples.errorRed,
        errorContainer: Color(0xFF7F1D1D),
        onError: DesignPrinciples.neutralWhite,
        onErrorContainer: Color(0xFFFECACA),
        
        // Outline colors
        outline: DesignPrinciples.neutralGray600,
        outlineVariant: DesignPrinciples.neutralGray700,
        
        // Shadow colors
        shadow: Color(0x00000000),
        scrim: Color(0x52000000),
        
        // Inverse colors
        inversePrimary: DesignPrinciples.primaryBlue,
        inverseSurface: DesignPrinciples.neutralWhite,
        onInverseSurface: DesignPrinciples.neutralBlack,
      ),
      
      // ==================== TYPOGRAPHY ====================
      textTheme: const TextTheme(
        // Display styles
        displayLarge: TextStyle(
          fontSize: DesignPrinciples.fontSize5xl,
          fontWeight: DesignPrinciples.fontWeightBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralWhite,
        ),
        displayMedium: TextStyle(
          fontSize: DesignPrinciples.fontSize4xl,
          fontWeight: DesignPrinciples.fontWeightBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralWhite,
        ),
        displaySmall: TextStyle(
          fontSize: DesignPrinciples.fontSize3xl,
          fontWeight: DesignPrinciples.fontWeightSemiBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralWhite,
        ),
        
        // Headline styles
        headlineLarge: TextStyle(
          fontSize: DesignPrinciples.fontSize2xl,
          fontWeight: DesignPrinciples.fontWeightSemiBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralWhite,
        ),
        headlineMedium: TextStyle(
          fontSize: DesignPrinciples.fontSizeXl,
          fontWeight: DesignPrinciples.fontWeightSemiBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralWhite,
        ),
        headlineSmall: TextStyle(
          fontSize: DesignPrinciples.fontSizeLg,
          fontWeight: DesignPrinciples.fontWeightSemiBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightTight,
          color: DesignPrinciples.neutralWhite,
        ),
        
        // Title styles
        titleLarge: TextStyle(
          fontSize: DesignPrinciples.fontSizeLg,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralWhite,
        ),
        titleMedium: TextStyle(
          fontSize: DesignPrinciples.fontSizeBase,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralWhite,
        ),
        titleSmall: TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray300,
        ),
        
        // Body styles
        bodyLarge: TextStyle(
          fontSize: DesignPrinciples.fontSizeBase,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralWhite,
        ),
        bodyMedium: TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray300,
        ),
        bodySmall: TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray400,
        ),
        
        // Label styles
        labelLarge: TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray300,
        ),
        labelMedium: TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray400,
        ),
        labelSmall: TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          height: DesignPrinciples.lineHeightNormal,
          color: DesignPrinciples.neutralGray500,
        ),
      ),
      
      // ==================== COMPONENT THEMES ====================
      
      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: DesignPrinciples.neutralGray900,
        foregroundColor: DesignPrinciples.neutralWhite,
        elevation: DesignPrinciples.appBarElevation,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: DesignPrinciples.fontSizeLg,
          fontWeight: DesignPrinciples.fontWeightSemiBold,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          color: DesignPrinciples.neutralWhite,
        ),
        iconTheme: IconThemeData(
          color: DesignPrinciples.neutralGray300,
          size: 24.0,
        ),
        actionsIconTheme: IconThemeData(
          color: DesignPrinciples.neutralGray300,
          size: 24.0,
        ),
      ),
      
      // Card Theme
      cardTheme: CardTheme(
        color: DesignPrinciples.neutralGray800,
        elevation: 0,
        shadowColor: DesignPrinciples.neutralBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.cardBorderRadius),
        ),
        margin: const EdgeInsets.all(DesignPrinciples.spacing4),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DesignPrinciples.primaryBlueLight,
          foregroundColor: DesignPrinciples.neutralBlack,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignPrinciples.buttonBorderRadius),
          ),
          padding: DesignPrinciples.buttonPadding,
          minimumSize: const Size(double.infinity, DesignPrinciples.buttonHeight),
          textStyle: const TextStyle(
            fontSize: DesignPrinciples.fontSizeBase,
            fontWeight: DesignPrinciples.fontWeightSemiBold,
            fontFamily: DesignPrinciples.fontFamilyPrimary,
          ),
        ),
      ),
      
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: DesignPrinciples.primaryBlueLight,
          backgroundColor: Colors.transparent,
          side: const BorderSide(
            color: DesignPrinciples.primaryBlueLight,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignPrinciples.buttonBorderRadius),
          ),
          padding: DesignPrinciples.buttonPadding,
          minimumSize: const Size(double.infinity, DesignPrinciples.buttonHeight),
          textStyle: const TextStyle(
            fontSize: DesignPrinciples.fontSizeBase,
            fontWeight: DesignPrinciples.fontWeightSemiBold,
            fontFamily: DesignPrinciples.fontFamilyPrimary,
          ),
        ),
      ),
      
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: DesignPrinciples.primaryBlueLight,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignPrinciples.buttonBorderRadius),
          ),
          padding: DesignPrinciples.buttonPadding,
          minimumSize: const Size(double.infinity, DesignPrinciples.buttonHeight),
          textStyle: const TextStyle(
            fontSize: DesignPrinciples.fontSizeBase,
            fontWeight: DesignPrinciples.fontWeightSemiBold,
            fontFamily: DesignPrinciples.fontFamilyPrimary,
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DesignPrinciples.neutralGray800,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
          borderSide: const BorderSide(
            color: DesignPrinciples.neutralGray600,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
          borderSide: const BorderSide(
            color: DesignPrinciples.neutralGray600,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
          borderSide: const BorderSide(
            color: DesignPrinciples.primaryBlueLight,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
          borderSide: const BorderSide(
            color: DesignPrinciples.errorRed,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.inputFieldBorderRadius),
          borderSide: const BorderSide(
            color: DesignPrinciples.errorRed,
            width: 2.0,
          ),
        ),
        contentPadding: DesignPrinciples.inputFieldPadding,
        labelStyle: const TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          color: DesignPrinciples.neutralGray400,
        ),
        hintStyle: const TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          color: DesignPrinciples.neutralGray500,
        ),
        errorStyle: const TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
          color: DesignPrinciples.errorRed,
        ),
      ),
      
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: DesignPrinciples.neutralGray900,
        selectedItemColor: DesignPrinciples.primaryBlueLight,
        unselectedItemColor: DesignPrinciples.neutralGray500,
        selectedLabelStyle: TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightMedium,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: DesignPrinciples.fontSizeXs,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: DesignPrinciples.primaryBlueLight,
        foregroundColor: DesignPrinciples.neutralBlack,
        elevation: 6,
        shape: CircleBorder(),
      ),
      
      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: DesignPrinciples.neutralGray700,
        selectedColor: DesignPrinciples.primaryBlueLight,
        disabledColor: DesignPrinciples.neutralGray600,
        labelStyle: const TextStyle(
          fontSize: DesignPrinciples.fontSizeSm,
          fontWeight: DesignPrinciples.fontWeightNormal,
          fontFamily: DesignPrinciples.fontFamilyPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignPrinciples.borderRadiusFull),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: DesignPrinciples.spacing3,
          vertical: DesignPrinciples.spacing1,
        ),
      ),
      
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: DesignPrinciples.neutralGray600,
        thickness: 1.0,
        space: 1.0,
      ),
      
      // Icon Theme
      iconTheme: const IconThemeData(
        color: DesignPrinciples.neutralGray300,
        size: 24.0,
      ),
      
      // Primary Icon Theme
      primaryIconTheme: const IconThemeData(
        color: DesignPrinciples.primaryBlueLight,
        size: 24.0,
      ),
      
      // ==================== OTHER THEME PROPERTIES ====================
      
      useMaterial3: true,
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
} 