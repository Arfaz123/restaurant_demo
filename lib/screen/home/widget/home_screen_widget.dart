import 'package:flutter/material.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';

class HomeScreenWidget extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final void Function()? addOnTap;
  final void Function()? deleteOnTap;

  const HomeScreenWidget({super.key, required this.image, required this.name, required this.price, this.addOnTap, this.deleteOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.whiteColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Color(0xFF00000040)
                )
              ]
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(image,height: size.height(143),width: size.width(158),fit: BoxFit.fill,),
              Positioned(
                bottom: 10,
                right: 10,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: addOnTap,
                      child: Container(
                        padding:EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  color: Color(0xFF00000040)
                              )
                            ]
                        ),
                        child: Icon(Icons.add,color: AppColor.blackColor,),
                      ),
                    ),
                    size.widthSpace(10),
                    GestureDetector(
                      onTap: deleteOnTap,
                      child: Container(
                        padding:EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  color: Color(0xFF00000040)
                              )
                            ]
                        ),
                        child: Icon(Icons.delete_outline,color: AppColor.blackColor,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          size.heightSpace(10),
          Text(name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
          size.heightSpace(5),
          Text(price,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}
