import 'package:e_commerce_admin/provider/product_provider.dart';
import 'package:e_commerce_admin/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewProductPage extends StatefulWidget {
  static const String routeName = '/new_product_page';
  const NewProductPage({Key? key}) : super(key: key);

  @override
  State<NewProductPage> createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
  final TextEditingController salePriceTextEditingController =
      TextEditingController();

  final TextEditingController purchaseDateTextEditingController =
      TextEditingController();
  final TextEditingController quantityTextEditingController =
      TextEditingController();

  String? _dropdownValue;

  @override
  void dispose() {
    // TODO: implement dispose
    nameTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    salePriceTextEditingController.dispose();
    purchaseDateTextEditingController.dispose();
    quantityTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Product'),
      ),
      body: Form(
        child: ListView(
          children: [
            CustomTextFormField(
                controller: nameTextEditingController,
                labelText: 'Product Name'),
            CustomTextFormField(
                controller: descriptionTextEditingController,
                labelText: 'Product Description'),
            CustomTextFormField(
              controller: salePriceTextEditingController,
              labelText: 'Sale Price',
              textInputType: TextInputType.number,
            ),
            CustomTextFormField(
              controller: purchaseDateTextEditingController,
              labelText: 'Purchase Price',
              textInputType: TextInputType.number,
            ),
            CustomTextFormField(
              controller: quantityTextEditingController,
              labelText: 'Quantity',
              textInputType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<ProductProvider>(
              builder: (context, provider, child) => DropdownButtonFormField<String>(
                value: _dropdownValue,
                hint: const Text('Select'),
                items: provider.categoryList
                    .map(
                      (model) => DropdownMenuItem<String>(
                        value: model.catName,
                        child: Text(model.catName!),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _dropdownValue = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(nameTextEditingController.text);
                print(descriptionTextEditingController.text);
                print(salePriceTextEditingController.text);
                print(purchaseDateTextEditingController.text);
                print(quantityTextEditingController.text);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
