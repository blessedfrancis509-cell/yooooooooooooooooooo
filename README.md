# ZenCash Banking App

A Flutter 3.24, Material 3, null-safe recreation of the provided ZenCash mobile banking design. The UI focuses on pixel-close spacing, purple glassmorphism, a custom-painted balance card, reusable feature widgets, responsive phone layouts, and subtle entrance/press animations.

## Features

- Feature-based architecture under `lib/features/home`.
- Material 3 app shell with Inter via `google_fonts`.
- Reusable widgets for:
  - Balance card
  - Quick actions
  - Account and service cards
  - Custom bottom navigation
  - Transfers, Payments, Cards, Investments, Account Details, Secure Sign-in, and Support pages
- Balance card built with `Stack`, `BackdropFilter`, `CustomPainter`, gradients, reflections, and layered shadows.
- Responsive scaling for compact Android phones and iPhones.
- SVG brand/card assets, `iconsax` icons, and glass effects.

## Getting Started

```bash
flutter pub get
flutter run
```

## Project Structure

```text
lib/
  app/
  core/
    theme/
    utils/
  features/home/
    data/
    presentation/pages/
    presentation/widgets/
  auth/presentation/pages/
  accounts/presentation/pages/
  transfers/presentation/pages/
  payments/presentation/pages/
  cards/presentation/pages/
  investments/presentation/pages/
  support/presentation/pages/
  shared/presentation/widgets/
assets/
  svg/
  images/
```

## Notes

Flutter was not available in the generation environment, so formatting and analysis should be run after installing Flutter 3.24+.
