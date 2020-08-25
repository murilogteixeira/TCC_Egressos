
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class HandCursor extends MouseRegion {

  // get a reference to the body element that we previously altered 
  static final appContainer = html.window.document.getElementById('app-container');

  HandCursor({String cursor, Widget child}) : super(
    onHover: (PointerHoverEvent evt) {
      appContainer.style.cursor=cursor;
      // you can use any of these: 
      // 'help', 'wait', 'move', 'crosshair', 'text' or 'pointer'
      // more options/details here: http://www.javascripter.net/faq/stylesc.htm
    },
    onExit: (PointerExitEvent evt) {
      // set cursor's style 'default' to return it to the original state
      appContainer.style.cursor='default';
    },
    child: child
  );

}
