import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'data_controller.dart';

class Home extends StatelessWidget {
  Controller controller = Get.put(Controller());

  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Top Up Tweak Point")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Mau Top-Up Berapa ?'),
            const Text('Tweak points mu gak bakalan kadaluarsa kok !!'),
            const Text('1 Tweak Points senilai dengan Rp.1000'),
            Expanded(
              child: GetBuilder<Controller>(
                  builder: (controller) => ListView.builder(
                      itemCount: controller.listTopUp.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            print('sudah di click');
                            controller.selectedTopup(i);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: controller.selected == i
                                        ? Colors.green
                                        : Colors.grey,
                                  )),
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                  top: i == 0 ? 10 : 0),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.money,
                                          color: Colors.yellow),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(controller.listTopUp[i].toString()),
                                    ],
                                  ),
                                  Text(
                                      NumberFormat.currency(
                                              decimalDigits: 3, symbol: 'Rp ')
                                          .format(controller.listTopUp[i]),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                        );
                      })),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: const Text('Lanjutkan =>'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
