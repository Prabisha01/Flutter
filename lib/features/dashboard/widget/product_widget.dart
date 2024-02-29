import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:flutter/material.dart';



class ProductWidget extends StatelessWidget {
  final List<NursyEntity> productList;
  const ProductWidget({super.key, required this.productList});


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Put this otherwise it will take all the space
      shrinkWrap: true,
      itemCount: productList.length,
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.5),
      itemBuilder: (context, index) {
        return Card(
            color: Colors.green[100],
            child: Center(
              child: Text(
                productList[index].plantName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        );
      },
    );
  }
}
