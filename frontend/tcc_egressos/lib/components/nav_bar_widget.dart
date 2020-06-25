import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _nome = "Murilo";
    return Container(
        color: Colors.blue,
        height: 87,
        child: Padding(
          padding: const EdgeInsets.only(right: 250),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 268,
                height: 31,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Pesquise pelo engresso",
                      enabledBorder: new UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Icon(Icons.search),
                      ),
                    ),
                    onSaved: (nome) {
                      _nome = nome;
                    },
                  ),
                ),
              ),
              MaterialButton(
                color: Color(0xFF547DD9),
                height: 53,
                minWidth: 53,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  // _consultar();
                },
                child: Icon(
                  Icons.search, color: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
