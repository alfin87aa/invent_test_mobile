import '../../index.dart';

class ProductListScreen extends GetView<ProductListController> {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: ListView.builder(
            itemCount: controller.productList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(controller.productList[index].productName),
                ),
              );
            },
          ),
        ));
  }
}
