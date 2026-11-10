# Campus Store — Stateless Widget

Student: Jolex Pasignasigna

A static Flutter shopping cart lab exercise. The screen includes delivery details, three products, quantity and remove controls, a student discount, and a payment summary.

## Run

With Flutter installed, run these commands in this directory:

```sh
flutter pub get
flutter run -d edge
```

Android and web platform files are already included. To use an Android device or emulator, check `flutter devices` and run `flutter run -d <device-id>`.

## Verify

```sh
dart format lib test
flutter analyze
flutter test
```

Widget tests check products and totals, all 13 action messages, unchanged cart data after button presses, and narrow-screen layouts with normal and enlarged text.

## Lab behavior

`CampusStoreApp`, `ShoppingCartPage`, `CartItemCard`, and `_SummaryRow` are StatelessWidgets. Buttons intentionally call `debugPrint`; products, quantities, delivery details, and totals stay fixed. This is a UI exercise with no payment or order backend.

The subtotal is PHP 2,000.00. The 10% discount is PHP 200.00, delivery is PHP 50.00, and the total is PHP 1,850.00.

## Screenshot evidence

Run in debug mode. Capture the top of the cart and scroll down to capture the payment summary and Place Order button. Suggested filenames are `Pasignasigna_output_1.png` and `Pasignasigna_output_2.png`.

Click Back, Shopping bag, Change, each product's minus, plus, and delete controls, then Place Order. Capture the debug console as `Pasignasigna_console.png`. Expected messages:

```text
Back clicked
Cart clicked
Change delivery address clicked
Decrease quantity: Wireless Mouse
Increase quantity: Wireless Mouse
Remove item: Wireless Mouse
Decrease quantity: USB-C Hub
Increase quantity: USB-C Hub
Remove item: USB-C Hub
Decrease quantity: Laptop Stand
Increase quantity: Laptop Stand
Remove item: Laptop Stand
Place order clicked! Total: PHP 1850.00
```

Keep the original Dart filenames and imports in `lib/`. Exclude `build/`, `.dart_tool/`, and local machine configuration from source submissions. Follow your instructor's requirements for screenshots, PDF documentation, repository submission, and examination work.
