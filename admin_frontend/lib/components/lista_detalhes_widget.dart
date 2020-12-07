import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';

class ListaDetalhesWidget extends StatelessWidget {
  const ListaDetalhesWidget({Key key, this.index, this.curriculo})
      : super(key: key);

  final int index;
  final CurriculoLattes curriculo;

  @override
  Widget build(BuildContext context) {
    final _colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.yellow
    ];

    return Container(
      height: MediaQuery.of(context).size.width < 768 ? 175 : 119,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
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
                    //  border: Border.all(
                    //    color: Colors.red,
                    //    width: 5.0,
                    //  ),
                    color: _colors[index],
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    //  alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2.5,
                      ),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://www.bauducco.com.br/wp-content/uploads/2017/09/default-placeholder-1-2.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                          child: Text('${curriculo.nome}',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20.0))),
                      Container(
                          child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.of(context).size.width * 0.8 / 2,
                            maxHeight:
                                MediaQuery.of(context).size.height * 1.0),
                        child: AutoSizeText(
                          '${'Ramonzinho monstro!'}',
                          group: AutoSizeGroup(),
                        ),
                      )),
                      Text('${"Ramonzinho monstro!"}')
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            endIndent: 20.0,
            indent: 20.0,
          ),
        ],
      ),
    );
  }
}
