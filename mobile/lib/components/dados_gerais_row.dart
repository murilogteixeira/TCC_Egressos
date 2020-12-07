import 'package:flutter/material.dart';

class DadosGeraisRowData {
  String title;
  List<String> data;

  DadosGeraisRowData({this.title, this.data});
}

class DadosGeraisRow extends StatefulWidget {
  final DadosGeraisRowData rowData;

  DadosGeraisRow({this.rowData});

  @override
  _DadosGeraisColumnRowState createState() => _DadosGeraisColumnRowState();
}

class _DadosGeraisColumnRowState extends State<DadosGeraisRow> {
  Widget pointIndicator = Container(
    width: 10,
    height: 10,
    decoration: new BoxDecoration(
      color: Color(0xFFB4AFED),
      shape: BoxShape.circle,
    ),
  );

  Widget horizontalSeparator = Container(
    width: 363.23,
    height: 1,
    decoration: BoxDecoration(
      color: Color(0xFFD1D1D1),
      shape: BoxShape.rectangle,
    ),
  );

  Widget verticalSeparator = Container(
    width: 2,
    height: 32.25,
    decoration: BoxDecoration(
      color: Color(0xFFEBEAF2),
      shape: BoxShape.rectangle,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return widget.rowData.data == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Text(
                    widget.rowData.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF547DD9),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
              ),
              Column(
                children: widget.rowData.data
                    .map(
                      (data) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.rowData.data.length > 1 &&
                                  widget.rowData.data.first != data
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, top: 5, bottom: 5),
                                  child: verticalSeparator,
                                )
                              : Container(),
                          Row(
                            children: [
                              pointIndicator,
                              SizedBox(width: 26),
                              Text(
                                data,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFF4A4A4A), fontSize: 20.0),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 27, 40, 27),
                child: horizontalSeparator,
              ),
            ],
          );
    return widget.rowData.data == null
        ? Container()
        : Column(
            children: [
              Row(
                children: [
                  pointIndicator,
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 8, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 9),
                            child: Text(widget.rowData.title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFF547DD9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                          ),
                          Column(
                            children: widget.rowData.data
                                .map(
                                  (e) => Text(
                                    e,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xFF4A4A4A),
                                        fontSize: 20.0),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 27, 40, 27),
                child: horizontalSeparator,
              ),
            ],
          );
  }
}
