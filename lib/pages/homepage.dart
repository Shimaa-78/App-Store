import 'package:appstore/pages/allProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubits/CategoryCubit/category_cubit.dart';
import '../Widgets/CategoryWidjet.dart';
import '../Widgets/methods.dart';
import 'CategoryProductPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<IconData> icons = [
    Icons.devices,
    Icons.diamond_outlined,
    Icons.male,
    Icons.female,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CategorySuccess) {
            return _buildCategoryList(context, state.categories);
          } else if (state is CategoryError) {
            return _buildErrorState(context);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context, List<String> categories) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Categories",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length + 1, // Add one for the "All" button
              itemBuilder: (context, index) {
                if (index < categories.length) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsOfCategoryPage(category: categories[index]),
                        ),
                      );
                    },
                    child: CategoryWidjet(
                      icon: icons[index],
                      categoryName: categories[index],
                    ),
                  );
                } else {
                  // "All Products" button
                  return _buildAllProductsButton(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllProductsButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AllProductsPage(),
          ),
        );
      },
      child: CategoryWidjet(
        icon: Icons.all_out_outlined,
        categoryName: "All Products",
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Error fetching categories",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<CategoryCubit>().getAllCategories(); // Assuming this method exists
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
