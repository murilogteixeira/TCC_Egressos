import 'package:flutter/material.dart';
import 'package:mobile/controller/editar_perfil.controller.dart';
import 'package:mobile/image_picker.view.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';

class EditarPerfil extends StatefulWidget {
  static final route = '/editar_perfil';

  const EditarPerfil({Key key, this.egresso}) : super(key: key);

  final Egresso egresso;

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  EditarPerfilController _controller;
  var verticalPadding = 20.0;
  var smallVerticalPadding = 10.0;

  var _inputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(color: Color(0xFF547DD9), width: 2.0),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(color: Color(0xFFDCDDE0), width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(color: Colors.red, width: 2.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    _controller = EditarPerfilController(widget.egresso);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(180),
                      child: Image.network(
                        'https://www.pngitem.com/pimgs/m/421-4212617_person-placeholder-image-transparent-hd-png-download.png',
                        height: 90,
                        width: 90,
                      ),
                    ),
                    Positioned(
                      left: 50,
                      top: 50,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () {
                          Navigator.of(context).pushNamed(MyHomePage.route);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: verticalPadding),
              Align(
                alignment: Alignment.center,
                child: Text(
                  _controller.egresso.nome,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Color(0xFF547DD9),
                  ),
                ),
              ),
              SizedBox(height: verticalPadding),
              Text(
                'ID Lattes:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(
                _controller.egresso.idLattes,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
              SizedBox(height: verticalPadding),
              Text(
                'Nome de Citação:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(
                _controller.egresso.nomeCitacoes,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
              SizedBox(height: verticalPadding),
              Text(
                'Atuação:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              TextFormField(
                initialValue: 'Docencia',
                decoration: _inputDecoration,
              ),
              SizedBox(height: verticalPadding),
              Text(
                'Cargo Atual:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              TextFormField(
                initialValue: 'Professor Universitario',
                decoration: _inputDecoration,
              ),
              SizedBox(height: verticalPadding),
              Text(
                'Contatos:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              TextFormField(
                initialValue: _controller.egresso.email,
                decoration: _inputDecoration,
              ),
              SizedBox(height: smallVerticalPadding),
              TextFormField(
                initialValue: 'Linkedin@mario-braga',
                decoration: _inputDecoration,
              ),
              SizedBox(height: smallVerticalPadding),
              TextFormField(
                initialValue: '@mariobragaucb',
                decoration: _inputDecoration,
              ),
              SizedBox(height: smallVerticalPadding),
              TextFormField(
                initialValue: _controller.egresso.celular,
                decoration: _inputDecoration,
              ),
              SizedBox(height: verticalPadding),
              Center(
                child: RaisedButton(
                  child: Text('Salvar'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
