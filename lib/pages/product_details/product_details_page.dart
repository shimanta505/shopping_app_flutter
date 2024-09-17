import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/image_path/image_path.dart';
import 'package:shopping_app/utils/size_utils.dart';
import 'package:shopping_app/widget/support_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //image
            SizedBox(
              height: 400.adaptSize,
              width: double.maxFinite,
              // color: Colors.blue,
              child: Stack(
                children: [
                  Positioned(
                    top: 60,
                    left: 20,
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.all(10.v),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(30.v),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      ImagePath.headphone_2,
                      height: 350.adaptSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            //details
            productDetails(),
          ],
        ),
      ),
    );
  }

  Widget productDetails() {
    print(Get.height);
    print(Get.width);

    return Container(
      padding: EdgeInsets.only(left: 10.h, right: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Headphone',
                style: AppWidget.boldTextFieldStyle,
              ),
              Text(
                '\$300',
                style: AppWidget.boldTextFieldStyle
                    .copyWith(color: const Color(0xFFfd6f3e)),
              ),
            ],
          ),
          SizedBox(
            height: 30.v,
          ),
          Text(
            'Details',
            style: AppWidget.boldTextFieldStyle,
          ),
          SizedBox(
            height: 20.v,
          ),
          Text(
            'this is random details dlfkld kdmggdkgm fgmfkgmk,f fmgkfmgfkgmfmgkf fkgmfkgmfcb f gfmgfkmbf,gmgmfg,mfg fgmfkg f fkbfkmf bfg fmfkbmfgmkfmfb f fkbmfkmf fbmfkmf fkbmfkhmfkb fkb fb fmfkbmfkbmfb fkbmbfkbmfb fbfkfbppgvmfkmf fbmfkbfbmbfbfmk ',
            style: AppWidget.lightTextFieldStyle,
          ),
          SizedBox(
            height: 40.v,
          ),
          Container(
            height: 50,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 30.h, right: 30.h),
            decoration: BoxDecoration(
              color: const Color(0xFFfd6f3e),
              borderRadius: BorderRadius.circular(10.v),
            ),
            child: Center(
              child: Text(
                'Buy Now',
                style: AppWidget.semiBoldTextFieldStyle
                    .copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
