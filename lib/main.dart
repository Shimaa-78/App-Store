import 'package:appstore/Cubits/CategoryCubit/category_cubit.dart';
import 'package:appstore/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubits/GetProductsByCategoryName/get_broduct_by_category_cubit.dart';
import 'Cubits/productCubit/allproducts_cubit.dart';
import 'Cubits/productCubit/product_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          AllproductsCubit()
            ..getAllProducts(),
        ),
        BlocProvider(
          create: (context) =>
          ProductCubit()

        ),
        BlocProvider(
          create: (context) => CategoryCubit()..getAllCategories(),
        ),
        BlocProvider(
          create: (context) => GetBroductByCategoryCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),

      ),
    );
  }
}
