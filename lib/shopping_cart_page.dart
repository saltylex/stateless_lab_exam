import 'package:flutter/material.dart';

const _blue = Color(0xFF1D5FF2);
const _ink = Color(0xFF142044);
const _paleBlue = Color(0xFFD9E9FF);

BoxDecoration _cardDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFDEE3ED)),
    );

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F5FA),
        surfaceTintColor: Colors.transparent,
        foregroundColor: _ink,
        centerTitle: true,
        title: const Text('My Cart',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          tooltip: 'Back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => debugPrint('Back clicked'),
        ),
        actions: [
          IconButton(
            tooltip: 'Shopping bag',
            onPressed: () => debugPrint('Cart clicked'),
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_bag_outlined),
                Positioned(
                  top: -7,
                  right: -8,
                  child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: _blue, shape: BoxShape.circle),
                    child: const Text('3',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: _paleBlue,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text('CAMPUS STORE',
                          style: TextStyle(
                              color: _blue,
                              fontSize: 11,
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Ready for checkout',
                      style: TextStyle(
                          color: _ink,
                          fontSize: 27,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  const Text('Review your items before placing your order.',
                      style: TextStyle(color: Color(0xFF536078), fontSize: 13)),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
                    decoration: _cardDecoration(),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: _blue),
                        const SizedBox(width: 12),
                        const Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Deliver to Jolex Pasignasigna',
                                style: TextStyle(
                                    color: _ink,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 3),
                            Text('Matina, Davao City',
                                style: TextStyle(fontSize: 12)),
                          ],
                        )),
                        TextButton(
                          onPressed: () =>
                              debugPrint('Change delivery address clicked'),
                          child: const Text('Change',
                              style: TextStyle(
                                  color: _blue, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Row(children: [
                    Expanded(
                        child: Text('Order Items',
                            style: TextStyle(
                                color: _ink,
                                fontSize: 17,
                                fontWeight: FontWeight.w800))),
                    Text('3 items',
                        style:
                            TextStyle(color: Color(0xFF536078), fontSize: 13)),
                  ]),
                  const SizedBox(height: 10),
                  const CartItemCard(
                      productName: 'Wireless Mouse',
                      price: 450,
                      quantity: 1,
                      icon: Icons.mouse_outlined),
                  const SizedBox(height: 10),
                  const CartItemCard(
                      productName: 'USB-C Hub',
                      price: 850,
                      quantity: 1,
                      icon: Icons.usb),
                  const SizedBox(height: 10),
                  const CartItemCard(
                      productName: 'Laptop Stand',
                      price: 700,
                      quantity: 1,
                      icon: Icons.laptop_mac_outlined),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: _paleBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(children: [
                      Icon(Icons.sell_outlined, color: _blue),
                      SizedBox(width: 12),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('STUDENT10 applied',
                                style: TextStyle(
                                    color: _ink, fontWeight: FontWeight.bold)),
                            Text('10% discount on items',
                                style: TextStyle(fontSize: 12)),
                          ])),
                      Icon(Icons.check_circle, color: _blue),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: _cardDecoration(),
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Payment Summary',
                              style: TextStyle(
                                  color: _ink,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          _SummaryRow(
                              label: 'Subtotal', amount: 'PHP 2,000.00'),
                          _SummaryRow(
                              label: 'Discount (10%)',
                              amount: '\u2212 PHP 200.00'),
                          _SummaryRow(
                              label: 'Delivery Fee', amount: 'PHP 50.00'),
                          Divider(height: 18, color: Color(0xFFDEE3ED)),
                          _SummaryRow(
                              label: 'Total',
                              amount: 'PHP 1,850.00',
                              isTotal: true),
                        ]),
                  ),
                  const SizedBox(height: 14),
                  ElevatedButton.icon(
                    onPressed: () =>
                        debugPrint('Place order clicked! Total: PHP 1850.00'),
                    icon: const Icon(Icons.lock, size: 21),
                    label: const Text('Place Order'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50),
                      elevation: 0,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  final String productName;
  final double price;
  final int quantity;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: _cardDecoration(),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 60,
          height: 66,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: _paleBlue, borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, size: 37, color: const Color(0xFF124881)),
        ),
        const SizedBox(width: 12),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(productName,
              style: const TextStyle(
                  color: _ink, fontSize: 14, fontWeight: FontWeight.w800)),
          const SizedBox(height: 3),
          Text('PHP ${price.toStringAsFixed(2)}',
              style: const TextStyle(
                  color: _blue, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 6,
              runSpacing: 4,
              children: [
                _quantityButton(Icons.remove, 'Decrease quantity',
                    () => debugPrint('Decrease quantity: $productName')),
                SizedBox(
                    width: 26,
                    child: Text('$quantity',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: _ink, fontWeight: FontWeight.bold))),
                _quantityButton(Icons.add, 'Increase quantity',
                    () => debugPrint('Increase quantity: $productName')),
              ]),
        ])),
        IconButton(
          tooltip: 'Remove $productName',
          onPressed: () => debugPrint('Remove item: $productName'),
          icon: const Icon(Icons.delete_outline,
              size: 21, color: Color(0xFF777E8C)),
          constraints: const BoxConstraints(minWidth: 32, minHeight: 36),
          padding: EdgeInsets.zero,
        ),
      ]),
    );
  }

  Widget _quantityButton(
      IconData buttonIcon, String label, VoidCallback callback) {
    return SizedBox(
      width: 34,
      height: 30,
      child: OutlinedButton(
        onPressed: callback,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: _blue,
          side: const BorderSide(color: _blue),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Semantics(
            label: '$label: $productName', child: Icon(buttonIcon, size: 18)),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow(
      {required this.label, required this.amount, this.isTotal = false});

  final String label;
  final String amount;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        color: _ink,
        fontSize: isTotal ? 16 : 13,
        fontWeight: isTotal ? FontWeight.w800 : FontWeight.normal);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: Text(label, style: style)),
        const SizedBox(width: 12),
        Flexible(child: Text(amount, textAlign: TextAlign.right, style: style)),
      ]),
    );
  }
}
