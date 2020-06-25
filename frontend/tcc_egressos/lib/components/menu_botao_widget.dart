import 'package:flutter/material.dart';
import 'package:tcc_egressos/extension/hand_cursor.dart';

class MenuBotaoWidget extends StatelessWidget {
  const MenuBotaoWidget({Key key, this.onTap, this.text}) : super(key: key);

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return HandCursor(
      cursor: 'pointer',
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
              color: Color(0x547DD9),
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
      ),
    );
  }
}
