import 'package:flutter/material.dart';
import 'package:appstore/Models/ProductModel.dart';
import 'package:appstore/Widgets/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Cubits/productCubit/allproducts_cubit.dart';
import '../Cubits/productCubit/product_cubit.dart';
import '../Widgets/ProductCard.dart';

class AllProductsPage extends StatelessWidget {


  AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AllproductsCubit>().getAllProducts();
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocBuilder<AllproductsCubit, AllproductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsSuccess) {
            return Padding(////
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All Products",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          else if(state is ProductsError){
            return Center(child:Text(state.errorMsg),);
          }
          return const Center(child: Text(''));
        },
      ),
    );
  }
}

