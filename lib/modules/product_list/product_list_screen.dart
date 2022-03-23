import '../../index.dart';
import 'package:intl/intl.dart';

class ProductListScreen extends GetView<ProductListController> {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width * 0.75,
                    decoration: boxDecoration(
                        bgColor: Theme.of(context).bottomAppBarColor,
                        radius: 4.0,
                        showShadow: true),
                    child: TextField(
                      onChanged: (value) => controller.searchProduct(value),
                      controller: controller.searchController,
                      textAlignVertical: TextAlignVertical.center,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).bottomAppBarColor,
                        hintText: 'search'.tr,
                        border: InputBorder.none,
                        suffixIcon: const Icon(
                          Icons.search,
                          color: AppConfigs.appPrimaryColor,
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                      ),
                    ),
                  ),
                  Container(
                    decoration: boxDecoration(
                        bgColor: Theme.of(context).bottomAppBarColor,
                        radius: 10,
                        showShadow: true),
                    height: 50,
                    width: 50,
                    child: Center(
                        child: IconButton(
                      icon: const Icon(
                        Icons.tune,
                        color: AppConfigs.appPrimaryColor,
                      ),
                      onPressed: () {
                        Get.bottomSheet(
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 32.0,
                                      height: 4.0,
                                      margin:
                                          const EdgeInsets.only(bottom: 16.0),
                                      decoration: boxDecoration(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .color!
                                              .withOpacity(0.3),
                                          radius: 8.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'sort'.tr,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  Obx(
                                    () => Wrap(
                                      spacing: 8.0,
                                      children: controller.sortChoices
                                          .map(
                                            (e) => ChoiceChip(
                                              label: Text(e.label),
                                              selected: controller
                                                      .idSelectSortChoices
                                                      .value ==
                                                  e.id,
                                              selectedColor:
                                                  AppConfigs.appPrimaryColor,
                                              onSelected: (_) =>
                                                  controller.sortProduct(e.id),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            elevation: 20.0,
                            enableDrag: true,
                            backgroundColor:
                                Theme.of(context).bottomAppBarColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            )));
                      },
                    )),
                  ),
                ],
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () => controller.refreshProduct(),
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              child: ListView.builder(
                itemCount: controller.productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading:
                          Image.asset('assets/images/no_images_available.jpg'),
                      title: Text(controller.productList[index].productName),
                      subtitle: Row(
                        children: [
                          Text(controller.productList[index].branchId ?? ""),
                          const Spacer(),
                          Text(NumberFormat.decimalPattern(
                                  TranslationService.locale.toString())
                              .format(int.parse(
                                  controller.productList[index].price))),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            bottomNavigationBar: BubbleBottomBar(
              opacity: .2,
              currentIndex: controller.currentIndex.value,
              backgroundColor: Theme.of(context).bottomAppBarColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              elevation: 8,
              onTap: controller.changeMenu,
              hasNotch: false,
              hasInk: true,
              items: <BubbleBottomBarItem>[
                tab('Home', Icons.home_outlined, Icons.home),
                tab('Notification', Icons.mail_outline, Icons.mail),
                tab('Chart', Icons.shopping_cart_outlined, Icons.shopping_cart),
                tab('Settings', Icons.tune_outlined, Icons.tune),
              ],
            ),
          ),
        ));
  }
}

class SortChoice {
  final int id;
  final String label;

  SortChoice(this.id, this.label);
}
