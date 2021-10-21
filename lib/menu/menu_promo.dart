import 'package:flutter/material.dart';
import 'package:flutter_app/menu/widgets/controllers/purchase.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import 'dashboard_menu.dart';

class HomePage extends StatelessWidget {
  final purchase = Get.put(Purchase());

  get cart => null; // controller inti

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()))
        ),
        title: Text("Food Promo"),
        centerTitle: true,
      ),
      bottomSheet: const SafeArea(
        child: Card(
          elevation: 12.0,
          margin: EdgeInsets.zero,
        ),
      ),
      body: Container(
        child: GetX<Purchase>(builder: (controller) {
          return ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        controller.products[index].productImage,
                        fit: BoxFit.cover,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.products[index].productName,
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  Text(
                                      controller.products[index]
                                          .productDescription,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12.0)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.green),
                              ),
                                onPressed: () => cart
                                    .addToCart(controller.products[index]),
                                child: const Text(
                                  'Shop Now',
                                  style:
                                  TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.0),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        }),
      ),
    );
  }
}
