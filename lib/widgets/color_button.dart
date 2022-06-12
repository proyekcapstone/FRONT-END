import 'package:capstone_project_jti/common/style.dart';
import 'package:flutter/material.dart';

Widget colorButton(BuildContext context, String name, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: primaryColor),
      child: Center(
        child: Text(name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            )),
      ),
    ),
  );
}
