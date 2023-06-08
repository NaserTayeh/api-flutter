// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_api/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, provider, x) {
          return Column(
            children: [
              Container(
                height: 70,
                child: provider.categories == null
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                provider.selectCategory('all');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: provider.selectedCategory == 'all'
                                        ? Colors.amber
                                        : Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.categories?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    provider.selectCategory(
                                        provider.categories![index]);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: provider.categories != null
                                            ? provider.categories![index] ==
                                                    provider.selectedCategory
                                                ? Colors.amber
                                                : Colors.blue
                                            : Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      provider.categories![index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
              ),
              Expanded(
                  child: provider.products == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: provider.products!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                provider.getOneProduct(
                                    provider.products![index].id!);
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetails();
                                  },
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: Image.network(
                                        provider.products![index].image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            provider.products![index].title!,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            provider
                                                .products![index].description!,
                                            maxLines: 1,
                                          ),
                                          Text(
                                            provider.products![index].price!
                                                .toString(),
                                            maxLines: 1,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ))
            ],
          );
        },
      ),
    );
  }
}
