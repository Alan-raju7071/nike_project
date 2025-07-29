import 'package:flutter/material.dart';

class two_symbol extends StatelessWidget {
  const two_symbol({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Container(
                width: 41,
                height: 14,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/bluetick.png"))
                ),
              ),
              SizedBox(width: 10),
               Container(
                width: 37,
                height: 34,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/maninblue.png"))
                ),
              )
            ],
          );
  }
}