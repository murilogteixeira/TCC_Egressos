import 'package:flutter/material.dart';

class MenuBotaoWidget extends StatelessWidget {
  const MenuBotaoWidget({Key key, this.onTap, this.text}) : super(key: key);

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                ),
              ),
            )),
      ),
    );
  }
}
