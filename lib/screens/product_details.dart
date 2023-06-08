import 'package:ecommerce_api/provider/products_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../models/get_products_response_model.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(builder: (context, provider, w) {
      return Scaffold(
        appBar: AppBar(
          title: provider.selectedProduct == null
              ? Text('loading')
              : Text(provider.selectedProduct!.title ?? ''),
        ),
        body: provider.selectedProduct == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(provider.selectedProduct!.image ?? ''),
                  ),
                  Text(provider.selectedProduct!.title ?? ''),
                  Text(provider.selectedProduct!.description ?? ''),
                  Text(provider.selectedProduct!.price.toString()),
                ],
              ),
      );
    });
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../models/get_products_response_model.dart';

// class ProductDetails extends StatelessWidget {
//   Product product;
//   ProductDetails({required this.product});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.title.toString()),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 300,
//             width: double.infinity,
//             child: Image.network(product.image ?? ''),
//           ),
//           Text(product.title ?? ''),
//           Text(product.description ?? ''),
//           Text(product.price.toString()),
//         ],
//       ),
//     );
//   }
// }
