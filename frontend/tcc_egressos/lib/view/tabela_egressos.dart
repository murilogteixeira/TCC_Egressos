import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class List extends StatefulWidget {
  @override
  ListState createState() => ListState();
}

class ListState extends State<List> {
  final _words = ['Gustavo', 'Filipe', 'Aline', 'Ramon', 'Murilo'];
  final _colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return _buildRow(index);
      },
      itemCount: _words.length,
    );
  }

  Widget _buildRow(int index) {
    return Container(
      height: MediaQuery.of(context).size.width < 768 ? 160 : 119,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Container(
                  width: 59.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Text('${index + 1}.'),
                ),
              ),
              Expanded(
                  flex: 0,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
//                          border: Border.all(
//                            color: Colors.red,
//                            width: 5.0,
//                          ),
                      color: _colors[index],
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      height: 70.0,
                      width: 70.0,
//                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2.5,
                          ),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              image: AssetImage('terry.jpg'),
                              fit: BoxFit.fill)),
                    ),
                  )),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                          child: Text('${_words[index]}',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20.0))),
                      Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width*0.8/2,
                              maxHeight: MediaQuery.of(context).size.height*1.0
                            ),
                            child: AutoSizeText(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            group: AutoSizeGroup(),
                          ),
                          )
                      ),
                      Text('Profissão')
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            indent: 20.0,
          ),
        ],
      ),
    );
  }
}