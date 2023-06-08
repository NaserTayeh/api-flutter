import 'dart:developer';

import 'package:ecommerce_api/dio_helper.dart';
import 'package:ecommerce_api/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('all product'),
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, provider, x) {
          return Center(
            child: ElevatedButton(
                onPressed: () async {
                  List<String> categories =
                      await DioHelper.dioHelper.getAllCategories();
                  log(categories.toString());
                },
                child: Text('get All categories')),
          );
          // return ListView.builder(
          // itemCount: provider.products?.length ?? 0,
          // itemBuilder: (context, index) {

          //  SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: 150,
          //         width: MediaQuery.of(context).size.width,
          //         child:
          //             Image.network(provider.products?[index].image ?? ''),
          //       ),
          //       Text(provider.products?[index].title ?? '')
          //     ],
          //   ),
          // );
          // },
          // );
        },
      ),
    );
  }
}
