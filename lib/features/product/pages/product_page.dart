import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_empty.dart';
import '../widgets/product_form_sheet.dart';
import '../widgets/product_tile.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ProductController>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Layanan"), centerTitle: true),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add),
        label: const Text("Tambah"),
        onPressed: () {
          controller.clearForm();

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => ChangeNotifierProvider.value(
              value: controller,
              child: const ProductFormSheet(),
            ),
          );
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            TextField(
              controller: controller.searchController,
              onChanged: controller.searchProduct,
              decoration: InputDecoration(
                hintText: "Cari layanan...",
                prefixIcon: const Icon(Icons.search),

                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: controller.clearSearch,
                ),

                filled: true,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            Expanded(
              child: controller.filteredProducts.isEmpty
                  ? const ProductEmpty()
                  : ListView.separated(
                      itemCount: controller.products.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, index) {
                        final product = controller.products[index];

                        return ProductTile(
                          product: product,
                          onEdit: () {
                            controller.setForm(product);

                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (_) => ChangeNotifierProvider.value(
                                value: controller,
                                child: ProductFormSheet(product: product),
                              ),
                            );
                          },
                          onDelete: () {
                            controller.confirmDelete(context, product);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
