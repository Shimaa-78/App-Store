import 'package:appstore/Models/ProductModel.dart';
import 'package:appstore/Widgets/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/GetProductsByCategoryName/get_broduct_by_category_cubit.dart';
import '../Widgets/ProductCard.dart';

class ProductsOfCategoryPage extends StatelessWidget {
  final String category;

  ProductsOfCategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    context.read<GetBroductByCategoryCubit>().getBroductByCategoryCubit(category);
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocBuilder<GetBroductByCategoryCubit, GetBroductByCategoryState>(
        builder: (context, state) {
          if (state is GetBroductByCategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetBroductByCategorySuccess) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
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
          else if(state is GetBroductByCategoryError){
            return Center(child:Text(state.errorMsg),);
          }
          return const Center(child: Text('No products available.'));
        },
      ),
    );
  }
}

