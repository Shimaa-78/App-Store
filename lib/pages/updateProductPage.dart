import 'package:appstore/Widgets/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubits/productCubit/product_cubit.dart';
import '../Widgets/CustomTextField.dart';

class UpdateProductPage extends StatefulWidget {
  final int id;

  UpdateProductPage({super.key, required this.id});

  @override
  _UpdateProductPageState createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  double price = 0.0;
  String description = '';
  String category = '';
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Allows form to scroll when keyboard appears
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Title',
                      onChanged: (value) => title = value,
                    ),
                    CustomTextField(
                      label: 'Price',
                      onChanged: (value) =>
                      price = double.tryParse(value) ?? 0.0,
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextField(
                      label: 'Description',
                      onChanged: (value) => description = value,
                    ),
                    CustomTextField(
                      label: 'Category',
                      onChanged: (value) => category = value,
                    ),
                    CustomTextField(
                      label: 'Image URL',
                      onChanged: (value) => imageUrl = value,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ProductCubit>().updateProduct(
                            widget.id,
                            title,
                            price,
                            description,
                            category,
                            imageUrl,
                          );
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Text('Update Product',
                        style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
