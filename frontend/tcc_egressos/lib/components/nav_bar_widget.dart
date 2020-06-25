import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _nome;

    _consultar() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        if (_nome.isEmpty) {
          return;
        }
        // pr.show();
        // _controller.consultar(_nome, () => pr.hide());
      }
    }

    return Container(
        color: Color(0xFF7A9EEF),
        height: 87,
        child: Padding(
          padding: const EdgeInsets.only(right: 250),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    height: 60,
                    width: 300,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      width: 268,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextFormField(
                          key: _formKey,
                          decoration: InputDecoration(
                            hintText: "Pesquise pelo engresso",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (nome) {
                            _nome = nome;
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 236,
                      child: MaterialButton(
                    color: Color(0xFF547DD9),
                    height: 50,
                    minWidth: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      _consultar();
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 15,
                    ),
                  ))
                ],
              )
            ],
          ),
        ));
  }
}
