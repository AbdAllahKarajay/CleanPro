import 'package:flutter/material.dart';

/// Design Principles Configuration
/// This file contains all the design tokens and principles for the cleaning services app
class DesignPrinciples {
  // ==================== BRAND VALUES ====================
  static const String brandName = 'CleanPro';
  static const String brandTagline = 'Professional Cleaning Services';
  
  // ==================== COLOR PALETTE ====================
  
  // Primary Colors
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color primaryBlueLight = Color(0xFF3B82F6);
  static const Color primaryBlueDark = Color(0xFF1D4ED8);
  
  // Secondary Colors
  static const Color secondaryGreen = Color(0xFF10B981);
  static const Color secondaryGreenLight = Color(0xFF34D399);
  static const Color secondaryGreenDark = Color(0xFF059669);
  
  // Accent Colors
  static const Color accentOrange = Color(0xFFF59E0B);
  static const Color accentOrangeLight = Color(0xFFFBBF24);
  static const Color accentOrangeDark = Color(0xFFD97706);
  
  // Neutral Colors
  static const Color neutralWhite = Color(0xFFFFFFFF);
  static const Color neutralGray50 = Color(0xFFF9FAFB);
  static const Color neutralGray100 = Color(0xFFF3F4F6);
  static const Color neutralGray200 = Color(0xFFE5E7EB);
  static const Color neutralGray300 = Color(0xFFD1D5DB);
  static const Color neutralGray400 = Color(0xFF9CA3AF);
  static const Color neutralGray500 = Color(0xFF6B7280);
  static const Color neutralGray600 = Color(0xFF4B5563);
  static const Color neutralGray700 = Color(0xFF374151);
  static const Color neutralGray800 = Color(0xFF1F2937);
  static const Color neutralGray900 = Color(0xFF111827);
  static const Color neutralBlack = Color(0xFF000000);
  
  // Semantic Colors
  static const Color successGreen = Color(0xFF10B981);
  static const Color warningYellow = Color(0xFFF59E0B);
  static const Color errorRed = Color(0xFFEF4444);
  static const Color infoBlue = Color(0xFF3B82F6);
  
  // ==================== TYPOGRAPHY ====================
  
  // Font Families
  static const String fontFamilyPrimary = 'Inter';
  static const String fontFamilySecondary = 'Roboto';
  
  // Font Sizes
  static const double fontSizeXs = 12.0;
  static const double fontSizeSm = 14.0;
  static const double fontSizeBase = 16.0;
  static const double fontSizeLg = 18.0;
  static const double fontSizeXl = 20.0;
  static const double fontSize2xl = 24.0;
  static const double fontSize3xl = 30.0;
  static const double fontSize4xl = 36.0;
  static const double fontSize5xl = 48.0;
  
  // Font Weights
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightNormal = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;
  static const FontWeight fontWeightExtraBold = FontWeight.w800;
  
  // Line Heights
  static const double lineHeightTight = 1.25;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.75;
  
  // ==================== SPACING ====================
  
  // Spacing Scale (4px base)
  static const double spacing0 = 0.0;
  static const double spacing1 = 4.0;
  static const double spacing2 = 8.0;
  static const double spacing3 = 12.0;
  static const double spacing4 = 16.0;
  static const double spacing5 = 20.0;
  static const double spacing6 = 24.0;
  static const double spacing8 = 32.0;
  static const double spacing10 = 40.0;
  static const double spacing12 = 48.0;
  static const double spacing16 = 64.0;
  static const double spacing20 = 80.0;
  static const double spacing24 = 96.0;
  static const double spacing32 = 128.0;
  
  // ==================== BORDER RADIUS ====================
  
  static const double borderRadiusNone = 0.0;
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusBase = 8.0;
  static const double borderRadiusMd = 12.0;
  static const double borderRadiusLg = 16.0;
  static const double borderRadiusXl = 24.0;
  static const double borderRadiusFull = 9999.0;
  
  // ==================== SHADOWS ====================
  
  static const List<BoxShadow> shadowSm = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];
  
  static const List<BoxShadow> shadowBase = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];
  
  static const List<BoxShadow> shadowMd = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
  ];
  
  static const List<BoxShadow> shadowLg = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 10),
      blurRadius: 15,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ];
  
  // ==================== ANIMATION DURATIONS ====================
  
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);
  
  // ==================== DESIGN PRINCIPLES ====================
  
  // Clean and Professional
  static const String principleClean = 'Clean and Professional';
  static const String principleCleanDescription = 'Minimal design with clear hierarchy and ample white space';
  
  // Trustworthy
  static const String principleTrustworthy = 'Trustworthy';
  static const String principleTrustworthyDescription = 'Use of professional colors and clear communication';
  
  // Accessible
  static const String principleAccessible = 'Accessible';
  static const String principleAccessibleDescription = 'High contrast ratios and readable typography';
  
  // Consistent
  static const String principleConsistent = 'Consistent';
  static const String principleConsistentDescription = 'Uniform spacing, typography, and color usage';
  
  // User-Friendly
  static const String principleUserFriendly = 'User-Friendly';
  static const String principleUserFriendlyDescription = 'Intuitive navigation and clear call-to-actions';
  
  // ==================== COMPONENT SPECIFICATIONS ====================
  
  // Button Specifications
  static const double buttonHeight = 48.0;
  static const double buttonBorderRadius = borderRadiusBase;
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: spacing6,
    vertical: spacing3,
  );
  
  // Input Field Specifications
  static const double inputFieldHeight = 48.0;
  static const double inputFieldBorderRadius = borderRadiusBase;
  static const EdgeInsets inputFieldPadding = EdgeInsets.symmetric(
    horizontal: spacing4,
    vertical: spacing3,
  );
  
  // Card Specifications
  static const double cardBorderRadius = borderRadiusLg;
  static const EdgeInsets cardPadding = EdgeInsets.all(spacing6);
  
  // App Bar Specifications
  static const double appBarHeight = 64.0;
  static const double appBarElevation = 0.0;
  
  // ==================== RESPONSIVE BREAKPOINTS ====================
  
  static const double breakpointMobile = 480.0;
  static const double breakpointTablet = 768.0;
  static const double breakpointDesktop = 1024.0;
  static const double breakpointWide = 1440.0;
} 