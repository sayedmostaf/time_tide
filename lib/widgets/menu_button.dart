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

  final String image;
  final String title;
  final MenuInfo currentMenuInfo;

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, value, Widget? child) {
        return GestureDetector(
          onTap: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
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
            padding: const EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width / 5,
            child: Column(
              children: [
                Image.asset(
                  currentMenuInfo.imageSource!,
                  scale: 1.7,
                ),
                const SizedBox(height: 16),
                Text(
                  currentMenuInfo.title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
