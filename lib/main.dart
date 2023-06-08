import 'package:ecommerce_api/all_product_screen.dart';
import 'package:ecommerce_api/dio_helper.dart';
import 'package:ecommerce_api/provider/products_provider.dart';
import 'package:ecommerce_api/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductsProvider>(
            create: (context) {
              return ProductsProvider();
            },
          )
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomeScreen()
            //  AllProducts(),
            )
        //MyHome()),
        );
  }
}

class MyHome extends StatelessWidget {
  String response = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  DioHelper.dioHelper.getAllProducts();
                },
                child: Text('press ')),
            Text(response)
          ],
        ),
      ),
    );
  }
}
