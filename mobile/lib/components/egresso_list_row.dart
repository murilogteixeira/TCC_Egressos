import 'package:flutter/material.dart';

import 'circle_image.dart';

class EgressoListRow extends StatelessWidget {
  final String imagemURL;
  final Color corBordaImagem;
  final String nome;
  final String cargo;
  final String grau;
  final bool isFirst;
  final Function onPressed;

  EgressoListRow({
    this.imagemURL,
    this.corBordaImagem,
    this.nome,
    this.cargo,
    this.grau,
    this.isFirst,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      splashColor: Colors.transparent,
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              CircleImage(
                  imageURL: imagemURL, size: 60, borderColor: corBordaImagem),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF547DD9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 110,
                      ),
                      child: Text(
                        cargo,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF696969),
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                    Text(
                      grau,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF696969),
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              height: 1,
              color: Color(0xFFD1D1D1),
            ),
          ),
        ],
      ),
    );
  }
}