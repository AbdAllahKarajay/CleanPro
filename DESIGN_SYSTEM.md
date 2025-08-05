# CleanPro Design System

A comprehensive design system for the CleanPro cleaning services app, built with Flutter and following Material Design 3 principles.

## 🎨 Design Principles

### Brand Values
- **CleanPro** - Professional Cleaning Services
- **Clean and Professional** - Minimal design with clear hierarchy and ample white space
- **Trustworthy** - Use of professional colors and clear communication
- **Accessible** - High contrast ratios and readable typography
- **Consistent** - Uniform spacing, typography, and color usage
- **User-Friendly** - Intuitive navigation and clear call-to-actions

## 🎯 Color Palette

### Primary Colors
- **Primary Blue**: `#2563EB` - Main brand color
- **Primary Blue Light**: `#3B82F6` - Secondary brand color
- **Primary Blue Dark**: `#1D4ED8` - Dark variant

### Secondary Colors
- **Secondary Green**: `#10B981` - Success states
- **Secondary Green Light**: `#34D399` - Light success variant
- **Secondary Green Dark**: `#059669` - Dark success variant

### Accent Colors
- **Accent Orange**: `#F59E0B` - Warning states
- **Accent Orange Light**: `#FBBF24` - Light warning variant
- **Accent Orange Dark**: `#D97706` - Dark warning variant

### Neutral Colors
- **White**: `#FFFFFF`
- **Gray 50**: `#F9FAFB`
- **Gray 100**: `#F3F4F6`
- **Gray 200**: `#E5E7EB`
- **Gray 300**: `#D1D5DB`
- **Gray 400**: `#9CA3AF`
- **Gray 500**: `#6B7280`
- **Gray 600**: `#4B5563`
- **Gray 700**: `#374151`
- **Gray 800**: `#1F2937`
- **Gray 900**: `#111827`
- **Black**: `#000000`

### Semantic Colors
- **Success Green**: `#10B981`
- **Warning Yellow**: `#F59E0B`
- **Error Red**: `#EF4444`
- **Info Blue**: `#3B82F6`

## 📝 Typography

### Font Family
- **Primary**: Inter
- **Secondary**: Roboto

### Font Sizes
- **XS**: 12px
- **SM**: 14px
- **Base**: 16px
- **LG**: 18px
- **XL**: 20px
- **2XL**: 24px
- **3XL**: 30px
- **4XL**: 36px
- **5XL**: 48px

### Font Weights
- **Light**: 300
- **Normal**: 400
- **Medium**: 500
- **SemiBold**: 600
- **Bold**: 700
- **ExtraBold**: 800

## 📏 Spacing

Based on a 4px grid system:
- **0**: 0px
- **1**: 4px
- **2**: 8px
- **3**: 12px
- **4**: 16px
- **5**: 20px
- **6**: 24px
- **8**: 32px
- **10**: 40px
- **12**: 48px
- **16**: 64px
- **20**: 80px
- **24**: 96px
- **32**: 128px

## 🔲 Border Radius

- **None**: 0px
- **SM**: 4px
- **Base**: 8px
- **MD**: 12px
- **LG**: 16px
- **XL**: 24px
- **Full**: 9999px

## 🧩 Components

### AppButton
A reusable button component with multiple variants.

```dart
AppButton(
  text: 'Sign In',
  onPressed: () {},
  variant: AppButtonVariant.primary,
  isLoading: false,
  icon: Icons.login,
)
```

**Variants:**
- `primary` - Filled button with primary color
- `secondary` - Outlined button with primary color
- `text` - Text button with primary color
- `danger` - Filled button with error color

### AppTextField
A reusable text field component with consistent styling.

```dart
AppTextField(
  label: 'Email',
  hint: 'Enter your email',
  controller: emailController,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  },
)
```

**Pre-configured variants:**
- `AppTextFieldWithConfig.phone()` - Phone number field
- `AppTextFieldWithConfig.password()` - Password field
- `AppTextFieldWithConfig.email()` - Email field
- `AppTextFieldWithConfig.name()` - Name field
- `AppTextFieldWithConfig.address()` - Address field

### AppCard
A reusable card component for displaying content.

```dart
AppCard(
  child: Text('Card content'),
  onTap: () {},
  isInteractive: true,
)
```

**Pre-configured variants:**
- `AppCardWithConfig.service()` - Service information card
- `AppCardWithConfig.booking()` - Booking information card
- `AppCardWithConfig.profile()` - User profile card
- `AppCardWithConfig.info()` - General information card

## 🎨 Theme Configuration

The app uses Material Design 3 with custom theming:

### Light Theme
- Clean white background
- Professional blue primary color
- High contrast text
- Subtle shadows and borders

### Dark Theme
- Dark gray background
- Light blue primary color
- Maintained contrast ratios
- Appropriate dark mode colors

## 📱 Usage Guidelines

### Importing Components
```dart
import 'package:cleaning_services_app/core/components/components.dart';
import 'package:cleaning_services_app/core/design/design.dart';
```

### Using Design Principles
```dart
import 'package:cleaning_services_app/core/design/design_principles.dart';

// Use spacing
const SizedBox(height: DesignPrinciples.spacing6);

// Use colors
Container(
  color: DesignPrinciples.primaryBlue,
)

// Use typography
Text(
  'Hello',
  style: TextStyle(
    fontSize: DesignPrinciples.fontSizeLg,
    fontWeight: DesignPrinciples.fontWeightSemiBold,
  ),
)
```

### Using Theme
```dart
final theme = Theme.of(context);

Text(
  'Hello',
  style: theme.textTheme.headlineLarge,
)
```

## 🔧 Customization

### Adding New Colors
1. Add the color to `DesignPrinciples` class
2. Update the theme in `AppTheme` class
3. Use the color in components

### Adding New Components
1. Create the component in `lib/core/components/`
2. Follow the existing naming convention
3. Add to the components index file
4. Document the component

### Adding New Spacing Values
1. Add to `DesignPrinciples` class
2. Use consistently across the app
3. Update documentation

## 📋 Best Practices

1. **Consistency**: Always use the design system components and tokens
2. **Accessibility**: Ensure proper contrast ratios and readable text
3. **Responsiveness**: Design for different screen sizes
4. **Performance**: Use efficient widgets and avoid unnecessary rebuilds
5. **Maintainability**: Keep components simple and reusable

## 🚀 Getting Started

1. Import the design system:
```dart
import 'package:cleaning_services_app/core/design/design.dart';
import 'package:cleaning_services_app/core/components/components.dart';
```

2. Use the theme in your app:
```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  // ...
)
```

3. Use components in your widgets:
```dart
AppButton(
  text: 'Click me',
  onPressed: () {},
)
```

## 📚 Additional Resources

- [Material Design 3 Guidelines](https://m3.material.io/)
- [Flutter Design Patterns](https://flutter.dev/docs/development/ui/widgets)
- [Accessibility Guidelines](https://flutter.dev/docs/development/accessibility-and-localization/accessibility)

---

*This design system is maintained by the CleanPro development team and should be updated as the app evolves.* 