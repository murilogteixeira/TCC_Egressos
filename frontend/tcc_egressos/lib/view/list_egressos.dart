import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/controller/curriculo_controller.dart';
import 'package:tcc_egressos/controller/list_egressos_controller.dart';
import 'package:tcc_egressos/extension/hand_cursor.dart';
import 'package:tcc_egressos/model/curriculo_lattes/egresso.dart';

class ListEgressos extends StatefulWidget {
  // final ObservableList<CurriculoLattes> list;
  final ObservableList<Egresso> egressos;
  final int sizeList;
  // const ListEgressos({this.list, this.sizeList});
  const ListEgressos({this.egressos, this.sizeList});

  @override
  ListEgressosState createState() => ListEgressosState();
}

class ListEgressosState extends State<ListEgressos> {
  ListEgressosController _listController;
  CurriculoController _curriculoController;
  int indexInicial;
  int indexFinal;

  @override
  void initState() {
    _listController = ListEgressosController(context);
    _curriculoController = CurriculoController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return _buildRow(index);
      },
      itemCount: widget.sizeList,
    );
  }

  // Color _defineColor(int index) {
  Color _defineColor(String tipo) {
    // switch (widget.list[index].situacao.tipo) {
    switch (tipo) {
      case 'Regular':
        return Colors.blue;
      case 'Atrasado':
        return Colors.red;
      case 'Adiantado':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget _buildRow(int index) {
    return HandCursor(
      cursor: 'pointer',
      child: GestureDetector(
        // onTap: () => _listController.onTapCurriculo(widget.list[index]),
        onTap: () => _listController.onTapEgresso(widget.egressos[index]),
        child: Container(
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
                        color: Colors.grey,
                        // widget.egressos[index].situacao.tipo != null
                        //     ? _defineColor(widget.egressos[index].situacao.tipo)
                        //     : Colors.grey,
                        shape: BoxShape.circle,
                        // image: new DecorationImage(
                        //       image: AssetImage('web/profile.png'), fit: BoxFit.fill),
                      ),
                      child: Container(
                        height: 69.0,
                        width: 69.0,
                        // child: Image.asset("Assets/Images/profile.png"),
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 3.5,
                            ),
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://www.kirkham-legal.co.uk/wp-content/uploads/2017/02/profile-placeholder.png"),
                            )),
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
                              // child: Text('${widget.list[index].nome}',
                              child: Text('${widget.egressos[index].nome}',
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
                              /*'${'Professor na Universidade Católica de Brasília'}'*/ '${widget.egressos[index].email}',
                              group: AutoSizeGroup(),
                            ),
                          )),
                          Text(
                              /*'${"Doutor"}'*/ '${widget.egressos[index].celular}')
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
        ),
      ),
    );
  }
}
