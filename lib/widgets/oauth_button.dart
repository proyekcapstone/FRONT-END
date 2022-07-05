import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget OAuthButton(BuildContext context, String imagePath, String buttonName,
    double size, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      child: Card(
        // color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              height: size,
              width: size,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              buttonName,
              style: const TextStyle(
                // color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
