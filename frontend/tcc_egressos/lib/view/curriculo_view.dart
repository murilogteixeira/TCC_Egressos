import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/components/detalhes_curriculo_widget.dart';
import 'package:tcc_egressos/components/menu_botao_widget.dart';
import 'package:tcc_egressos/components/nav_bar_widget.dart';
import 'package:tcc_egressos/components/screenSize.dart';
import 'package:tcc_egressos/controller/curriculo_controller.dart';
import 'package:tcc_egressos/controller/menu_botao_widget_controller.dart';
import 'package:tcc_egressos/model/Charts/OrganizeCharts.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:tcc_egressos/model/lista_detalhes.dart';

class CurriculoView extends StatefulWidget {
  static var route = "/curriculo";

  CurriculoView({Key key}) : super(key: key);

  final title = "Curriculo";
  @override
  _CurriculoViewState createState() => _CurriculoViewState();
}

class _CurriculoViewState extends State<CurriculoView> {
  double _maxWidth;
  BoxConstraints _constraints;
  ScreenSize _screenSize;
  CurriculoLattes _curriculo;
  CurriculoController _controller;

  MenuBotaoWidget _atualBotao;

  @override
  void initState() {
    _controller = CurriculoController();

    _dadosGeraisBotao = _setDadosGeraisBotao();
    _formacaoBotao = _setFormacaoBotao();
    _atuacaoBotao = _setAtuacaoBotao();
    _producoesBotao = _setProducoesBotao();
    _eventosBotao = _setEventosBotao();
    _bancasBotao = _setBancasBotao();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var curriculo = ModalRoute.of(context).settings.arguments;
    if (curriculo != null) {
      _curriculo = curriculo;
    }

    _getCurriculo();

    return LayoutBuilder(builder: (context, constraints) {
      _maxWidth = constraints.maxWidth;

      if (_maxWidth < 576) {
        _screenSize = ScreenSize.xs;
      } else if (_maxWidth >= 576 && _maxWidth < 768) {
        _screenSize = ScreenSize.sm;
      } else if (_maxWidth >= 768 && _maxWidth < 992) {
        _screenSize = ScreenSize.md;
      } else if (_maxWidth >= 992 && _maxWidth < 1200) {
        _screenSize = ScreenSize.lg;
      } else {
        _screenSize = ScreenSize.xl;
      }
      return Scaffold(
        appBar: _criarAppBar(),
        body: _body(),
        backgroundColor: Color(0xFFEAEDF2),
      );
    });
  }

  _getCurriculo() async {
    var prefs = await SharedPreferences.getInstance();
    var json = prefs.getString("curriculo");
    _curriculo = CurriculoLattes().fromJson(jsonDecode(json));
  }

  _criarAppBar() {
    return kIsWeb
        ? null
        : AppBar(
            title: Text(widget.title ?? ""),
          );
  }

  Widget _body() {
    _cofigurarConstraints();
    return _mostrarLayout();
  }

  _cofigurarConstraints() {
    switch (_screenSize) {
      case ScreenSize.xl:
        _constraints = BoxConstraints(maxWidth: 1140);
        break;
      case ScreenSize.lg:
        _constraints = BoxConstraints(maxWidth: 960);
        break;
      case ScreenSize.md:
        _constraints = BoxConstraints(maxWidth: 720);
        break;
      case ScreenSize.sm:
        _constraints = BoxConstraints(maxWidth: 540);
        break;
      case ScreenSize.xs:
        _constraints = BoxConstraints(maxWidth: _maxWidth - 20);
        break;
    }
  }

  _foto() {
    return Container(
      // color: Colors.green,
      width: 90,
      height: 90,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue
        // image: DecorationImage(
        //   fit: BoxFit.fill,
        //   image: NetworkImage("https://picsum.photos/250"),
        // ),
      ),
    );
  }

  _nomeStatus() {
    var nome = Text(
      _curriculo.nome,
      style: TextStyle(fontSize: 22),
    );
    var status = Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Container(
        width: 198,
        height: 31,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Text(
          "${_curriculo.situacao.tipo}",
          style: TextStyle(fontSize: 14, color: Color(0xFFFDFDFD)),
        )),
      ),
    );
    var row = Row(
      children: <Widget>[nome, status],
    );
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[nome, status],
    );
    if (_screenSize == ScreenSize.lg ||
        _screenSize == ScreenSize.md ||
        _screenSize == ScreenSize.xl) {
      return row;
    } else {
      return column;
    }
  }

  _formacaoCargo() {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Container(
        constraints: BoxConstraints(maxWidth: _constraints.maxWidth * 0.8),
        // color: Colors.blue,
        child: Text(
          "Especialização em TECNOLOGIA INDUSTRIAL FARMACEUTICA pela Universidade Federal de Minas Gerais, Brasil(1961)Professor titular da Pontifícia Universidade Católica do Paraná , Brasil",
        ),
      ),
    );
  }

  _descricao() {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Container(
        child: Text(
          "FARMACÊUTICO, DOUTOR e LIVRE-DOCENTE pela Universidade Federal do Paraná. É avaliador do INEP/MEC, membro da Comissão de Ensino do Conselho Federal de Farmácia e auditor técnico para empresas farmacêuticas da SGS Certificadora. É professor aposentado da UFPR e da PUCPR. Tem experiência na área de Farmácia, com ênfase em Farmacotécnica e Farmacognosia, atuando principalmente nos seguintes temas: reconhecimento de curso, controle de qualidade, farmacognosia, autorização de curso e fitoquímica. É presidente da Associação Brasileira de Ensino Farmacêutico e Bioquímico - ABENFARBIO, Gestão 2007-2011 e Membro da Comissão de Ensino Farmacêutico do Conselho Federal de Farmácia, Gestão 2010-2011. (Texto informado pelo autor)",
        ),
      ),
    );
  }

  _setAtualMenu(container) {
    _controller.container = container;
  }

  _setAtualBotao(botao) {
    _atualBotao.controller.ativo = false;
    _atualBotao = botao;
    _atualBotao.controller.ativo = true;
  }

  MenuBotaoWidget _dadosGeraisBotao;
  _setDadosGeraisBotao() {
    return MenuBotaoWidget(
      onTap: () {
        _setAtualMenu(_dadosGeraisContainer());
        // _setAtualBotao(_dadosGeraisBotao);
      },
      text: "Dados Gerais",
      controller: MenuBotaoWidgetController(ativo: true),
    );
  }

  MenuBotaoWidget _formacaoBotao;
  _setFormacaoBotao() {
    return MenuBotaoWidget(
      onTap: () {
        _setAtualMenu(_formacaoContainer());
        // _setAtualBotao(_formacaoBotao);
      },
      text: "Formação",
      controller: MenuBotaoWidgetController(ativo: false),
    );
  }

  MenuBotaoWidget _atuacaoBotao;
  _setAtuacaoBotao() {
    return MenuBotaoWidget(
      onTap: () {
        _setAtualMenu(_atuacaoContainer());
        // _setAtualBotao(_atuacaoBotao);
      },
      text: "Atuação",
      controller: MenuBotaoWidgetController(ativo: false),
    );
  }

  MenuBotaoWidget _producoesBotao;
  _setProducoesBotao() {
    return MenuBotaoWidget(
      onTap: () {
        _setAtualMenu(_producoesContainer());
        // _setAtualBotao(_producoesBotao);
      },
      text: "Produções",
      controller: MenuBotaoWidgetController(ativo: false),
    );
  }

  MenuBotaoWidget _eventosBotao;
  _setEventosBotao() {
    return MenuBotaoWidget(
      onTap: () {
        _setAtualMenu(_eventosContainer());
        // _setAtualBotao(_eventosBotao);
      },
      text: "Eventos",
      controller: MenuBotaoWidgetController(ativo: false),
    );
  }

  MenuBotaoWidget _bancasBotao;
  _setBancasBotao() {
    return MenuBotaoWidget(
      onTap: () {
        _setAtualMenu(_bancasContainer());
        // _setAtualBotao(_bancasBotao);
      },
      text: "Bancas",
      controller: MenuBotaoWidgetController(ativo: false),
    );
  }

  _dadosGeraisContainer() {
    var atuacao = ListaDetalhes(
      titulo: 'Ministério da Educação, MEC, Brasil',
      lista: [
        ItemListaDetalhes(
          subtitulo:
              'Membro da Comissão ENC, Enquadramento Funcional: Cargo honorífico',
          corpo: ['2001 - momento'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Membro da Comissão do ENC-2001, Enquadramento Funcional: Cargo honorífico',
          corpo: ['2000 - 2001'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Membro da C. E. E. Farmácia, Enquadramento Funcional: Cargo honorífico',
          corpo: ['1998 - 2000'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Disponibilidade pela UFPR, Enquadramento Funcional: DAS 2, Carga horária: 40, Regime: Dedicação exclusiva',
          corpo: ['1975 - 1983'],
        ),
      ],
    );

    return Column(
      children: <Widget>[
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
      ],
    );
  }

  _formacaoContainer() {
    var atuacao = ListaDetalhes(
      titulo: 'Ministério da Educação, MEC, Brasil',
      lista: [
        ItemListaDetalhes(
          subtitulo:
              'Membro da Comissão ENC, Enquadramento Funcional: Cargo honorífico',
          corpo: ['2001 - momento'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Membro da Comissão do ENC-2001, Enquadramento Funcional: Cargo honorífico',
          corpo: ['2000 - 2001'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Membro da C. E. E. Farmácia, Enquadramento Funcional: Cargo honorífico',
          corpo: ['1998 - 2000'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Disponibilidade pela UFPR, Enquadramento Funcional: DAS 2, Carga horária: 40, Regime: Dedicação exclusiva',
          corpo: ['1975 - 1983'],
        ),
      ],
    );

    return Column(
      children: <Widget>[
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
      ],
    );
  }

  _atuacaoContainer() {
    var atuacao = ListaDetalhes(
      titulo: 'Ministério da Educação, MEC, Brasil',
      lista: [
        ItemListaDetalhes(
          subtitulo:
              'Membro da Comissão ENC, Enquadramento Funcional: Cargo honorífico',
          corpo: ['2001 - momento'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Membro da Comissão do ENC-2001, Enquadramento Funcional: Cargo honorífico',
          corpo: ['2000 - 2001'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Membro da C. E. E. Farmácia, Enquadramento Funcional: Cargo honorífico',
          corpo: ['1998 - 2000'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Disponibilidade pela UFPR, Enquadramento Funcional: DAS 2, Carga horária: 40, Regime: Dedicação exclusiva',
          corpo: ['1975 - 1983'],
        ),
      ],
    );

    return Column(
      children: <Widget>[
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
      ],
    );
  }

  _producoesContainer() {
    return Container(
        child: OrganizeCharts()
            .createCharts(dataExemplo, [100, 200, 300, 400, 500]));
  }

  _eventosContainer() {
    return Container(
        child: OrganizeCharts().createCharts(dataExemplo, [100, 2, 30, 4, 55]));
  }

  _bancasContainer() {
    var atuacao = ListaDetalhes(
      titulo: 'Ministério da Educação, MEC, Brasil',
      lista: [
        ItemListaDetalhes(
          subtitulo:
              'Membro da Comissão ENC, Enquadramento Funcional: Cargo honorífico',
          corpo: ['2001 - momento'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Membro da Comissão do ENC-2001, Enquadramento Funcional: Cargo honorífico',
          corpo: ['2000 - 2001'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Membro da C. E. E. Farmácia, Enquadramento Funcional: Cargo honorífico',
          corpo: ['1998 - 2000'],
        ),
        ItemListaDetalhes(
          subtitulo:
              'Disponibilidade pela UFPR, Enquadramento Funcional: DAS 2, Carga horária: 40, Regime: Dedicação exclusiva',
          corpo: ['1975 - 1983'],
        ),
      ],
    );

    return Column(
      children: <Widget>[
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
      ],
    );
  }

  _mostrarLayout() {
    _controller.container = _dadosGeraisContainer();
    return SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            children: [
              NavBarWidget(),

              // RESUMO
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Container(
                  constraints: _constraints,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDFDFD),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 48, bottom: 25, left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(children: [
                          _foto(),
                          Padding(
                            padding: const EdgeInsets.only(left: 27),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  _nomeStatus(),
                                  _formacaoCargo(),
                                ]),
                          ),
                        ]),
                        _descricao(),
                      ],
                    ),
                  ),
                ),
              ),

              // DADOS
              Padding(
                padding: EdgeInsets.only(top: 57, bottom: 20),
                child: Container(
                  constraints: _constraints,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDFDFD),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  width: _maxWidth,
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: _constraints.maxWidth * 0.9),
                        decoration: BoxDecoration(
                          color: Color(0xFF547DD9),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _dadosGeraisBotao,
                            _formacaoBotao,
                            _atuacaoBotao,
                            _producoesBotao,
                            _eventosBotao,
                            _bancasBotao,
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 30.5),
                        child: Observer(
                          builder: (_) {
                            return _controller.container;
                          },
                        ),
                      ),
                      // DadosGeraisWidget(),
                    ],
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
