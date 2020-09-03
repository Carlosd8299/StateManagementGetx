import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/global_controller.dart';
import 'package:getxdemo/models/products.dart';

class ProducList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GlobalController>();
    return GetBuilder<GlobalController>(
        id: 'products',
        builder: (_) => ListView.builder(
              itemBuilder: (__, index) {
                final Product p = _.getProducts[index];
                return ListTile(
                  title: Text(p.nombre),
                  subtitle: Text(p.price.toString()),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: p.isfavorited ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        _.onFavorited(index, !p.isfavorited);
                      }),
                );
              },
              itemCount: _.getProducts.length,
            ));
  }
}
