# BePay Wallet - Architecture Documentation

## Project Structure

```
lib/
├── core/
│   └── theme/
│       ├── app_colors.dart       # Color constants
│       ├── app_text_styles.dart  # Text style definitions (12sp-30sp with various weights)
│       └── app_theme.dart        # Material theme configuration
│
└── modules/
    └── wallet/
        ├── data/
        │   └── repositories/
        │       └── mock_wallet_repository.dart  # Mock API implementation
        │
        ├── domain/
        │   ├── models/
        │   │   └── wallet_model.dart           # Data models (WalletModel, TransactionModel, ServiceModel)
        │   └── repositories/
        │       └── wallet_repository.dart      # Repository interface
        │
        └── presentation/
            ├── bloc/
            │   ├── wallet_bloc.dart            # Business logic
            │   ├── wallet_event.dart           # Events
            │   └── wallet_state.dart           # States
            │
            └── ui/
                └── screens/
                    ├── main_navigation_screen.dart   # Bottom nav container
                    └── wallet_home_screen.dart       # Main wallet screen
```

## Key Features

### 1. **BLoC Pattern Architecture**
- **Events**: `LoadWalletData`, `ToggleBalanceVisibility`, `LoadServices`, `ChangeTab`
- **States**: `WalletInitial`, `WalletLoading`, `WalletLoaded`, `WalletError`
- Clean separation of business logic from UI

### 2. **Responsive Design with ScreenUtil**
- `.sp` - for font sizes
- `.w` - for widths
- `.h` - for heights
- `.r` - for border radius
- Design size: 390x844 (iPhone standard)

### 3. **Mock API Repository**
- Returns wallet balance: "1450.08 USD"
- Returns 9 service cards
- Simulates network delay (1 second for wallet data)

### 4. **Models**
- **WalletModel**: Balance, currency, visibility, transactions
- **TransactionModel**: Transaction history
- **ServiceModel**: Service cards with icons

### 5. **Theme System**
- **Colors**:
  - Primary Black: `#080808`
  - Black with 20% opacity: `#08080833`
  - Background Pure White: `#FFFFFF`
  - Card Widget Background: `#C0C0C026`
  
- **Typography**: Montserrat font family
  - Text sizes: 12, 14, 16, 18, 20, 22, 24, 26, 28, 30
  - Weights: Light (300), Regular (400), Medium (500), SemiBold (600), Bold (700)

### 6. **SVG Icons**
All service icons are in `assets/icons/` as SVGs:
- qr_scan.svg
- cashout.svg
- gift.svg
- bitcoin_loan.svg
- travel.svg
- gift_card.svg
- cloud.svg
- map.svg
- more.svg

### 7. **Bottom Navigation**
Using `persistent_bottom_nav_bar` with style 15:
- Wallet (main screen with BLoC)
- Card (placeholder)
- Scan & Pay (placeholder)
- Explore (placeholder)
- Reward (placeholder)

## Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.6          # State management
  flutter_svg: ^2.0.10+1        # SVG rendering
  flutter_screenutil: ^5.9.3    # Responsive sizing
  equatable: ^2.0.7             # Value equality
  google_fonts: ^7.0.0          # Montserrat font
  persistent_bottom_nav_bar: ^6.2.1  # Bottom navigation
```

## How to Run

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Run the app:
   ```bash
   flutter run
   ```

## Usage Example

### Using BLoC in widgets:
```dart
// Trigger event
context.read<WalletBloc>().add(const LoadWalletData());

// Listen to state
BlocBuilder<WalletBloc, WalletState>(
  builder: (context, state) {
    if (state is WalletLoaded) {
      return Text(state.wallet.balance);
    }
    return CircularProgressIndicator();
  },
)
```

### Using ScreenUtil:
```dart
// Responsive sizing
Container(
  width: 100.w,      // 100 responsive width
  height: 50.h,      // 50 responsive height
  padding: EdgeInsets.all(16.w),
  child: Text(
    'Hello',
    style: TextStyle(fontSize: 14.sp),  // 14 responsive font size
  ),
)
```

### Using Text Styles:
```dart
Text(
  'Hello World',
  style: AppTextStyles.text16Medium,  // 16sp, Medium weight
)

Text(
  'Title',
  style: AppTextStyles.text24Bold,    // 24sp, Bold weight
)
```

## Future Enhancements

1. Connect to real API endpoints
2. Add authentication
3. Implement remaining tabs (Card, Scan & Pay, Explore, Reward)
4. Add transaction history screen
5. Implement service card actions
6. Add animations and transitions
7. Add error handling and retry logic
8. Implement dark mode
