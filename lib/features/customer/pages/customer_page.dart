import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/customer_controller.dart';
import '../widgets/customer_empty.dart';
import '../widgets/customer_form_sheet.dart';
import '../widgets/customer_search.dart';
import '../widgets/customer_tile.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CustomerController(),
      child: const _CustomerView(),
    );
  }
}

class _CustomerView extends StatelessWidget {
  const _CustomerView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CustomerController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Customer")),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.clearForm();

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => CustomerFormSheet(controller: controller),
          );
        },
      ),

      body: Column(
        children: [
          CustomerSearch(
            controller: controller.searchController,
            onChanged: controller.search,
          ),

          Expanded(
            child: StreamBuilder(
              stream: controller.customers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const CustomerEmpty();
                }

                final customers = snapshot.data!;

                return ListView.builder(
                  itemCount: customers.length,
                  itemBuilder: (_, index) {
                    final customer = customers[index];

                    return CustomerTile(
                      customer: customer,
                      onDelete: () {
                        controller.deleteCustomer(customer.id);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
