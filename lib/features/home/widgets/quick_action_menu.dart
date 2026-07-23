import 'package:flutter/material.dart';
import '../../product/pages/product_page.dart';
import 'quick_action_item.dart';

class QuickActionMenu extends StatelessWidget {
  const QuickActionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuickActionItem(
          icon: Icons.add_circle_outline,
          title: "Order",
          onTap: () {},
        ),

        QuickActionItem(
          icon: Icons.people_alt_outlined,
          title: "Customer",
          onTap: () {},
        ),

        QuickActionItem(
          icon: Icons.local_offer_outlined,
          title: "Layanan",
          onTap: () {
            Navigator.pushNamed(context, '/products');
          },
        ),

        QuickActionItem(
          icon: Icons.qr_code_scanner,
          title: "Scan",
          onTap: () {},
        ),
      ],
    );
  }
}
