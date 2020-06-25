import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tcc_egressos/controller/menu_botao_widget_controller.dart';
import 'package:tcc_egressos/extension/hand_cursor.dart';

// class MenuBotaoWidget extends StatelessWidget {
//   const MenuBotaoWidget({Key key, this.onTap, this.text}) : super(key: key);

//   final Function onTap;
//   final String text;
//   bool ativo;

//   @override
//   Widget build(BuildContext context) {
//     return HandCursor(
//       cursor: 'pointer',
//       child: GestureDetector(
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40.0),
//           child: Container(
//               color: Color(0x547DD9),
//               child: Center(
//                 child: Text(
//                   text,
//                   style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w100,
//                       decoration:
//                           ativo ? TextDecoration.underline : null),
//                 ),
//               )),
//         ),
//       ),
//     );
//   }
// }

class MenuBotaoWidget extends StatefulWidget {
  MenuBotaoWidget({Key key, this.onTap, this.text, this.controller})
      : super(key: key);

  final Function onTap;
  final String text;
  final MenuBotaoWidgetController controller;

  @override
  _MenuBotaoWidgetState createState() => _MenuBotaoWidgetState();
}

class _MenuBotaoWidgetState extends State<MenuBotaoWidget> {
  @override
  Widget build(BuildContext context) {
    return HandCursor(
      cursor: 'pointer',
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
              color: Color(0x547DD9),
              child: Center(
                child: Observer(
                  builder: (BuildContext context) {
                    return Text(
                      widget.text,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          decoration: widget.controller.ativo
                              ? TextDecoration.underline
                              : null),
                    );
                  },
                ),
              )),
        ),
      ),
    );
  }
}
