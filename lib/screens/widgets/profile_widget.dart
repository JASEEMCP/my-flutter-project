
import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  Function()? onTapped;
    ProfileWidget({
    Key? key,
    required this.icon,
    required this.title,
      this.onTapped,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Constants.blackColor.withOpacity(.5),
                  size: 24,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Constants.blackColor.withOpacity(.4),
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}