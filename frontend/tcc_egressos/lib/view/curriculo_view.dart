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
  // CurriculoLattes _curriculo;
  CurriculoController _controller;

  MenuBotaoWidget _atualBotao;

  @override
  void initState() {
    _controller = CurriculoController();

    _dadosGeraisBotao = _setDadosGeraisBotao();
    // _formacaoBotao = _setFormacaoBotao();
    // _atuacaoBotao = _setAtuacaoBotao();
    _producoesBotao = _setProducoesBotao();
    _eventosBotao = _setEventosBotao();
    _bancasBotao = _setBancasBotao();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var curriculo = ModalRoute.of(context).settings.arguments;
    if (curriculo != null) {
      _controller.setCurriculo(curriculo);
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
    _controller.curriculo = CurriculoLattes().fromJson(jsonDecode(json));
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
        color: Colors.grey,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
              "https://www.kirkham-legal.co.uk/wp-content/uploads/2017/02/profile-placeholder.png"),
        ),
      ),
    );
  }

  _nomeStatus() {
    var nome = Text(
      _controller.curriculo.nome,
      style: TextStyle(fontSize: 22),
    );
    Color corSituacao;

    switch (_controller.curriculo.situacao.id) {
      case 1:
        corSituacao = Colors.red;
        break;
      case 2:
        corSituacao = Colors.blue;
        break;
      case 3:
        corSituacao = Colors.green;
        break;
      default:
    }

    var status = Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Container(
        width: 198,
        height: 31,
        decoration: BoxDecoration(
            color: corSituacao,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Text(
          "${_controller.curriculo.situacao.tipo}",
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
          "Professor e Doutor de Ciência da Computação - Universidade Católica de Brasília",
        ),
      ),
    );
  }

  _descricao() {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Container(
        child: Text(
          "Graduado em Tecnologia de Computação pelo Instituto Tecnológico de Aeronáutica - ITA (1979), Mestre em Sistemas e Computação pela Universidade Federal da Paraíba - UFPB (1988) e Doutor em Ciência da Computação pelo Laboratoire d'Informatique, Robotique et de Microélectronique de Montpellier - LIRMM, França (1992). Entre 1986 e 2004, foi professor do Departamento de Sistemas e Computação da Universidade Federal de Campina Grande - UFCG (antiga UFPB), tendo atuado nos cursos de Tecnologia em Processamento de Dados, Bacharelado em Ciência da Computação, Mestrado em Informática e Doutorado em Engenharia Elétrica. Desde 2001 é professor titular da Universidade Católica de Brasília, onde atua no Curso de Bacharelado em Ciência da Computação e no Mestrado em Governança, Tecnologia e Inovação (antigo Mestrado em Gestão do Conhecimento e Tecnologia da Informação). Seus interesses incluem Inteligência Artificial e Gestão do Conhecimento. Tem experiência como consultor de organismos internacionais em projetos juntos a órgãos do Governo Federal Brasileiro.",
        ),
      ),
    );
  }

  _setAtualMenu(container) {
    _controller.container = container;
  }

  _resetBotaoAtivo() {
    _dadosGeraisBotao.controller.ativo = false;
    _producoesBotao.controller.ativo = false;
    _eventosBotao.controller.ativo = false;
    _bancasBotao.controller.ativo = false;
  }

  MenuBotaoWidget _dadosGeraisBotao;
  _setDadosGeraisBotao() {
    return MenuBotaoWidget(
      onTap: () {
        _setAtualMenu(_dadosGeraisContainer());
        _resetBotaoAtivo();
        _dadosGeraisBotao.controller.ativo = true;
      },
      text: "Dados Gerais",
      controller: MenuBotaoWidgetController(ativo: true),
    );
  }

  // MenuBotaoWidget _formacaoBotao;
  // _setFormacaoBotao() {
  //   return MenuBotaoWidget(
  //     onTap: () {
  //       // _setAtualMenu(_formacaoContainer());
  //       formacaoContainer().then((value) => _setAtualMenu(value));
  //       // _setAtualBotao(_formacaoBotao);
  //     },
  //     text: "Formação",
  //     controller: MenuBotaoWidgetController(ativo: false),
  //   );
  // }

  // MenuBotaoWidget _atuacaoBotao;
  // _setAtuacaoBotao() {
  //   return MenuBotaoWidget(
  //     onTap: () {
  //       _setAtualMenu(_atuacaoContainer());
  //       // _setAtualBotao(_atuacaoBotao);
  //     },
  //     text: "Atuação",
  //     controller: MenuBotaoWidgetController(ativo: false),
  //   );
  // }

  MenuBotaoWidget _producoesBotao;
  _setProducoesBotao() {
    return MenuBotaoWidget(
      onTap: () {
        _setAtualMenu(_producoesContainer());
        _resetBotaoAtivo();
        _producoesBotao.controller.ativo = true;
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
        _resetBotaoAtivo();
        _eventosBotao.controller.ativo = true;
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
        _resetBotaoAtivo();
        _bancasBotao.controller.ativo = true;
        // _setAtualBotao(_bancasBotao);
      },
      text: "Bancas",
      controller: MenuBotaoWidgetController(ativo: false),
    );
  }

  _dadosGeraisContainer() {
    var nomeCitacao = ListaDetalhes(
      titulo: 'Nome Citação',
      lista: [
        ItemListaDetalhes(
          subtitulo: _controller.curriculo.nomeCitacao,
          corpo: [''],
        ),
      ],
    );

    var atuacao = ListaDetalhes(
      titulo: 'Atuação',
      lista: [
        ItemListaDetalhes(
          subtitulo: 'Gestão educacional',
          corpo: [''],
        ),
      ],
    );
    var contatos = ListaDetalhes(
      titulo: 'Contatos',
      lista: [
        ItemListaDetalhes(
          subtitulo: 'Email:',
          corpo: [_controller.curriculo.email],
        ),
        ItemListaDetalhes(
          subtitulo: 'LinkedIn:',
          corpo: ['https://www.linkedin.com/in/edilson-ferneda-348199a/'],
        ),
        ItemListaDetalhes(
          subtitulo: 'Instagram:',
          corpo: ['@eferneda'],
        ),
        ItemListaDetalhes(
          subtitulo: 'Facebook:',
          corpo: ['https://www.facebook.com/edilson.ferneda.5'],
        ),
        ItemListaDetalhes(
          subtitulo: 'Telefone:',
          corpo: [_controller.curriculo.celular ?? 'Não informado'],
        ),
      ],
    );

    return Column(
      children: <Widget>[
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: nomeCitacao,
        ),
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: atuacao,
        ),
        DetalhesCurriculoWidget(
          maxWidth: _maxWidth * 0.9,
          dados: contatos,
        ),
      ],
    );
  }

  // Future<Widget> formacaoContainer() async {
  //   var formacao1 = ListaDetalhes(
  //     titulo: 'Doutorado em Ciência da Computação.',
  //     lista: [
  //       ItemListaDetalhes(
  //         subtitulo: '',
  //         corpo: [
  //           'LIRMM-Université Montpellier II, LIRMM-UMII, França.',
  //           'Título: Conception d\'un agent rationnel et examen de son raisonnement en géométrie, Ano de obtenção: 1992.',
  //           'Orientador: Jean Sallantin.',
  //           'Bolsista do(a): Coordenação de Aperfeiçoamento de Pessoal de Nível Superior, CAPES, Brasil.',
  //           'Palavras-chave: Inteligência Artificial; Agentes Inteligentes; Agentes Racionais.',
  //           'Grande área: Ciências Exatas e da Terra',
  //         ],
  //       ),
  //       ItemListaDetalhes(
  //         subtitulo:
  //             'Programa de Capacitação do Banco de Avaliadores do. (Carga horária: 32h).',
  //         corpo: [
  //           'Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira, INEP/MEC, Brasil.',
  //         ],
  //       ),
  //     ],
  //   );
  //   var formacao2 = ListaDetalhes(
  //     titulo: 'Formação Complementar',
  //     lista: [
  //       ItemListaDetalhes(
  //         subtitulo:
  //             'Programa de Capacitação do Banco de Avaliadores do. (Carga horária: 32h).',
  //         corpo: [
  //           'Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira, INEP/MEC, Brasil.',
  //         ],
  //       ),
  //     ],
  //   );

  //   var formacao = await _controller.consultaFormacao();

  //   // var listaFormacao = ListaDetalhes(
  //   //     titulo: '',
  //   //     lista: formacao.map((e) {
  //   //       return ItemListaDetalhes(subtitulo: e.curso, corpo: [e.instituicao]);
  //   //     }).toList());

  //   var listaFormacao = formacao.map((e) {
  //     return DetalhesCurriculoWidget(maxWidth: _maxWidth * 0.9, dados: ListaDetalhes(
  //         titulo: e.curso,
  //         lista: [ItemListaDetalhes(subtitulo: e.instituicao, corpo: [e.area, '${e.dataInicio} - ${e.dataFim}'])]),);
  //   }).toList();

  //   return Column(
  //     children: listaFormacao,
  //   );
  // }

  // _atuacaoContainer() {
  //   var atuacao = ListaDetalhes(
  //     titulo: 'Ministério da Educação, MEC, Brasil',
  //     lista: [
  //       ItemListaDetalhes(
  //         subtitulo:
  //             'Membro da Comissão ENC, Enquadramento Funcional: Cargo honorífico',
  //         corpo: ['2001 - momento'],
  //       ),
  //       ItemListaDetalhes(
  //         subtitulo:
  //             'Membro da Comissão do ENC-2001, Enquadramento Funcional: Cargo honorífico',
  //         corpo: ['2000 - 2001'],
  //       ),
  //       ItemListaDetalhes(
  //         subtitulo:
  //             'Membro da C. E. E. Farmácia, Enquadramento Funcional: Cargo honorífico',
  //         corpo: ['1998 - 2000'],
  //       ),
  //       ItemListaDetalhes(
  //         subtitulo:
  //             'Disponibilidade pela UFPR, Enquadramento Funcional: DAS 2, Carga horária: 40, Regime: Dedicação exclusiva',
  //         corpo: ['1975 - 1983'],
  //       ),
  //     ],
  //   );

  //   return Column(
  //     children: <Widget>[
  //       DetalhesCurriculoWidget(
  //         maxWidth: _maxWidth * 0.9,
  //         dados: atuacao,
  //       ),
  //       DetalhesCurriculoWidget(
  //         maxWidth: _maxWidth * 0.9,
  //         dados: atuacao,
  //       ),
  //       DetalhesCurriculoWidget(
  //         maxWidth: _maxWidth * 0.9,
  //         dados: atuacao,
  //       ),
  //     ],
  //   );
  // }

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
                            // _formacaoBotao,
                            // _atuacaoBotao,
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
