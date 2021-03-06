import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/controller/egresso/editar_perfil.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';

import '../../../globals.dart';

enum ImageOption { CAMERA, GALLERY }

class EditarPerfil extends StatefulWidget {
  static final route = '/editar_perfil';

  const EditarPerfil({Key key, this.egresso}) : super(key: key);

  final Egresso egresso;

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  EditarPerfilController _controller;
  Egresso egresso;
  var formKey = GlobalKey<FormState>();
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

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _selectImageOption() async {
    switch (await showDialog(
        context: context,
        child: SimpleDialog(
          title: Text('Escolha a origem da imagem:'),
          children: [
            SimpleDialogOption(
              child: Text(
                'Galeria',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop(ImageOption.GALLERY);
              },
            ),
            SimpleDialogOption(
              child: Text(
                'Câmera',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop(ImageOption.CAMERA);
              },
            ),
          ],
        ))) {
      case ImageOption.GALLERY:
        this.getImageFromGallery();
        break;
      case ImageOption.CAMERA:
        this.getImage();
        break;
    }
  }

  updateEgresso(BuildContext context) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      egresso = await _controller.updateEgresso();
      Navigator.of(context).pop(egresso);
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller = EditarPerfilController(widget.egresso);
    egresso = widget.egresso;

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(180),
                        child: _image == null
                            ? Image.asset(
                                'assets/placeholder-person.jpg',
                                height: 90,
                                width: 90,
                              )
                            : Image.file(
                                _image,
                                fit: BoxFit.cover,
                                height: 90,
                                width: 90,
                              ),
                      ),
                      Positioned(
                        left: 30,
                        top: 55,
                        height: 30,
                        child: RawMaterialButton(
                          child: Icon(
                            Icons.camera_alt,
                            size: 22,
                          ),
                          elevation: 2,
                          fillColor: Colors.white,
                          shape: CircleBorder(),
                          onPressed: this._selectImageOption,
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
                // SizedBox(height: verticalPadding),
                // Text(
                //   'ORCID:',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                // ),
                // TextFormField(
                //   initialValue: '',
                //   decoration: _inputDecoration,
                // ),
                SizedBox(height: verticalPadding),
                Text(
                  'Atuação:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                TextFormField(
                  initialValue: egresso.atuacao,
                  decoration: _inputDecoration,
                  onSaved: (newValue) => egresso.atuacao = newValue,
                ),
                SizedBox(height: verticalPadding),
                Text(
                  'Cargo Atual:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                TextFormField(
                  initialValue: egresso.cargoAtual,
                  decoration: _inputDecoration,
                  onSaved: (newValue) => egresso.cargoAtual = newValue,
                ),
                SizedBox(height: verticalPadding),
                Text(
                  'Empresa:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                TextFormField(
                  initialValue: egresso.empresa,
                  decoration: _inputDecoration,
                  onSaved: (newValue) => egresso.empresa = newValue,
                ),
                SizedBox(height: verticalPadding),
                Text(
                  'Contatos:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: smallVerticalPadding),
                Text(
                  'Email:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: smallVerticalPadding),
                TextFormField(
                  initialValue: _controller.egresso.email,
                  decoration: _inputDecoration,
                  onSaved: (newValue) => egresso.email = newValue,
                ),
                SizedBox(height: smallVerticalPadding),
                Text(
                  'Telefone:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: smallVerticalPadding),
                TextFormField(
                  initialValue: _controller.egresso.celular,
                  decoration: _inputDecoration,
                  onSaved: (newValue) => egresso.celular = newValue,
                ),
                SizedBox(height: smallVerticalPadding),
                // Text(
                //   'LinkedIn:',
                //   style: TextStyle(fontSize: 16.0),
                // ),
                // SizedBox(height: smallVerticalPadding),
                // TextFormField(
                //   initialValue: '',
                //   decoration: _inputDecoration,
                // ),
                // SizedBox(height: smallVerticalPadding),
                // Text(
                //   'Instagram:',
                //   style: TextStyle(fontSize: 16.0),
                // ),
                // SizedBox(height: smallVerticalPadding),
                // TextFormField(
                //   initialValue: '',
                //   decoration: _inputDecoration,
                // ),
                SizedBox(height: verticalPadding),
                Observer(
                  builder: (_) {
                    return _controller.isLoading
                        ? CircularProgressIndicator()
                        : Center(
                            child: SizedBox(
                              width: 192,
                              height: 50,
                              child: RaisedButton(
                                color: mainColor,
                                child: Text(
                                  'Salvar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                onPressed: () {
                                  updateEgresso(context);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
