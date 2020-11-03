import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/controller/editar_perfil.controller.dart';
import 'package:mobile/main.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';

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
          title: Text('Selecione a opção para escolha da imagem:'),
          children: [
            SimpleDialogOption(
              child: Text('Galeria'),
              onPressed: () {
                Navigator.of(context).pop(ImageOption.GALLERY);
              },
            ),
            SimpleDialogOption(
              child: Text('Câmera'),
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

  @override
  Widget build(BuildContext context) {
    _controller = EditarPerfilController(widget.egresso);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
        backgroundColor: mainColor,
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
                      child: _image == null
                          ? Image.network(
                              'https://www.pngitem.com/pimgs/m/421-4212617_person-placeholder-image-transparent-hd-png-download.png',
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
              SizedBox(height: verticalPadding),
              Text(
                'ORCID:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              TextFormField(
                initialValue: '',
                decoration: _inputDecoration,
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
                      Navigator.of(context).pop();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
