import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tide/constants/colors.dart';
import 'package:time_tide/models/menu_info.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.image,
    required this.title,
    required this.currentMenuInfo,
  });
  final String image, title;
  final MenuInfo currentMenuInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Consumer<MenuInfo>(
        builder: (context, value, child) {
          return GestureDetector(
            onTap: () {
              var menuInfo = Provider.of<MenuInfo>(context,
                  listen: false); // listen: false for get data only
              menuInfo.updateMenu(menuInfo);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: currentMenuInfo.menuType == value.menuType
                    ? darkBlue
                    : Colors.transparent,
              ),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 4.3,
              child: Column(
                children: [
                  Image.asset(
                    currentMenuInfo.imageSource!,
                    scale: 1.5,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    currentMenuInfo.title!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
