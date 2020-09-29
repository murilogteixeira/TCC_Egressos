
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as Charts;

import 'package:flutter/rendering.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import '../helpers/extension/string.dart';

Map<int, Color> getSwatch(Color color) {
  final hslColor = HSLColor.fromColor(color);
  final lightness = hslColor.lightness;

  final lowDivisor = 6;

  final highDivisor = 5;

  final lowStep = (1.0 - lightness) / lowDivisor;
  final highStep = lightness / highDivisor;

  return {
    50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
    100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
    200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
    300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
    400: (hslColor.withLightness(lightness + lowStep)).toColor(),
    500: (hslColor.withLightness(lightness)).toColor(),
    600: (hslColor.withLightness(lightness - highStep)).toColor(),
    700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
    800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
    900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
  };
}

class PieOutsideLabelChart extends StatelessWidget {
  final List<Charts.Series> seriesList;
  final bool animate;

  PieOutsideLabelChart(this.seriesList, {this.animate});

  factory PieOutsideLabelChart.withSampleData(List<ChartsData> data) {
    return new PieOutsideLabelChart(
      _createSampleData(data),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Charts.PieChart(
      seriesList,
      animate: false,
      animationDuration: Duration(seconds: 2),
    );
  }

  /// Create one series with sample hard coded data.
  static List<Charts.Series<ChartsData, String>> _createSampleData(
      List<ChartsData> data) {
    return [
      new Charts.Series<ChartsData, String>(
        id: 'UserData',
        domainFn: (ChartsData data, _) => data.nome,
        measureFn: (ChartsData data, _) => data.value,
        colorFn: (ChartsData data, _) => data.cor,
        data: data,
      )
    ];
  }
}

class BarChartOutsideLabelChart extends StatelessWidget {
  final List<Charts.Series> seriesList;
  final bool animate;

  BarChartOutsideLabelChart(this.seriesList, {this.animate});

  factory BarChartOutsideLabelChart.withSampleData(
      List<ChartsData> data, List<int> averages) {
    return new BarChartOutsideLabelChart(
      _createSampleData(data, averages),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Charts.BarChart(
      seriesList,
      animate: animate,
      domainAxis: new Charts.OrdinalAxisSpec(
          // Make sure that we draw the domain axis line.
          showAxisLine: true,
          // But don't draw anything else.
          renderSpec: new Charts.NoneRenderSpec()),
      defaultRenderer: new Charts.BarRendererConfig(
        cornerStrategy: const Charts.ConstCornerStrategy(4),
      ),
      animationDuration: Duration(seconds: 2),
      barGroupingType: Charts.BarGroupingType.grouped,
    );
  }

  /// Create one series with sample hard coded data.
  static List<Charts.Series<ChartsData, String>> _createSampleData(
      List<ChartsData> data, List<int> averages) {
    final List<ChartsData> userData = [];
    final List<ChartsData> averageData = [];

    //for para dados do usuario
    for (var i = 0; i < data.length; i++) {
      userData.add(
        new ChartsData('$i', data[i].value, data[i].cor),
      );
      averageData.add(
        new ChartsData('$i', averages[i],
            Charts.Color(r: 235, g: 234, b: 242, a: Colors.grey.alpha)),
      );
    }
    return [
      new Charts.Series<ChartsData, String>(
        id: 'data',
        domainFn: (ChartsData data, _) => data.nome,
        measureFn: (ChartsData data, _) => data.value,
        colorFn: (ChartsData data, _) => data.cor,
        data: userData,
      ),
      new Charts.Series<ChartsData, String>(
        id: 'average',
        domainFn: (ChartsData data, _) => data.nome,
        measureFn: (ChartsData data, _) => data.value,
        colorFn: (ChartsData data, _) => data.cor,
        data: averageData,
      ),
    ];
  }
}

class OrganizeCharts {
  double ballSize = 20.0;
  double fontSize = 15.0;
  int valorTotalPieChart = 0;

  int widthBarChart = 100;

  int valorTotalData(List<ChartsData> lista) {
    //soma total de coisas publicadas
    int i = 0;
    int retorno = 0;
    for (i = 0; i < lista.length; i++) {
      retorno += lista[i].value;
    }
    return retorno;
  }

  Widget createCharts(
    String title,
    List<ChartsData> data,
    List<int> avarages,
  ) {
    this.valorTotalPieChart = this.valorTotalData(data);

    List<Color> colorsColor = [
      new Color.fromARGB(255, 255, 111, 111),
      new Color.fromARGB(255, 119, 130, 255),
      new Color.fromARGB(255, 111, 255, 128),
      new Color.fromARGB(255, 167, 121, 255),
      new Color.fromARGB(255, 255, 224, 121),
      new Color.fromARGB(255, 137, 45, 121),
      new Color.fromARGB(255, 68, 112, 200),
      new Color.fromARGB(255, 150, 37, 13),
      new Color.fromARGB(255, 255, 10, 10),
    ];

    List<MaterialColor> colorsMaterial = [];
    colorsColor.forEach((element) {
      colorsMaterial.add(MaterialColor(element.value, getSwatch(element)));
    });

    final children = <Widget>[];

    for (var i = 0; i < data.length; i++) {
      data[i].cor = Charts.Color(
          r: colorsColor[i].red,
          g: colorsColor[i].green,
          b: colorsColor[i].blue,
          a: colorsColor[i].alpha);

      Widget row = Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: Icon(Icons.lens,
                        size: (ballSize), color: colorsMaterial[i]),
                  ),
                  Flexible(
                    child: Text(
                      data[i].nome,
                      style: TextStyle(fontSize: fontSize),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "... ${data[i].value}",
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ),
      );
      children.add(row);
    }

    List<Widget> _pieChartAndData() {
      Widget legendas = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
      double chartSize = kIsWeb ? 300 : 250;
      legendas = kIsWeb
          ? legendas
          : Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: legendas,
            );
      return [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: SizedBox(
            width: chartSize,
            height: chartSize,
            child: PieOutsideLabelChart.withSampleData(data),
          ),
        ),
        legendas,
      ];
    }

    List<Widget> _barChartAndData() {
      return [
        Padding(
          padding: kIsWeb
              ? const EdgeInsets.symmetric(horizontal: 60, vertical: 20)
              : const EdgeInsets.all(10),
          child: SizedBox(
            width: data.length.toDouble() * this.widthBarChart,
            height: 350,
            child: new BarChartOutsideLabelChart.withSampleData(data, avarages),
          ),
        ),
        Padding(
          padding: kIsWeb
              ? const EdgeInsets.symmetric(horizontal: 60, vertical: 20)
              : const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        )
      ];
    }

    return Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: kIsWeb
            ? const EdgeInsets.symmetric(horizontal: 100, vertical: 20)
            : const EdgeInsets.only(left: 12, right: 12, top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: kIsWeb
                  ? const EdgeInsets.fromLTRB(60, 50, 1, 10)
                  : const EdgeInsets.fromLTRB(25, 50, 1, 10),
              child: Text(
                "Visão Geral - ${title.capitalize()}",
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 125, 217),
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: kIsWeb
                  ? const EdgeInsets.fromLTRB(60, 50, 1, 10)
                  : const EdgeInsets.only(left: 25),
              child: Text(
                "Total: $valorTotalPieChart ",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            kIsWeb
                ? Row(
                    children: _pieChartAndData(),
                  )
                : Column(
                    children: _pieChartAndData(),
                  ),
          ],
        ),
      ),
      Container(
        margin: kIsWeb
            ? const EdgeInsets.symmetric(horizontal: 100, vertical: 20)
            : const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(60, 50, 1, 10),
              child: Text(
                "Comparação com a média",
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 125, 217),
                  fontSize: 17,
                ),
              ),
            ),
            Column(
              children: _barChartAndData(),
            ),
          ],
        ),
      ),
    ]));
  }
}

/// Sample charts data type.
class ChartsData {
  final String nome;
  final int value;
  Charts.Color cor;

  ChartsData(this.nome, this.value, [this.cor]);
}

final dataExemplo = [
  new ChartsData(
    "Participação em eventos, congressos, exposições e feiras ",
    500,
  ),
  new ChartsData(
    "Organização de eventos, congressos, exposições e feiras ",
    710,
  ),
  new ChartsData(
    "Artigos publicados ",
    400,
  ),
  new ChartsData(
    "Menções em obras ",
    400,
  ),
  new ChartsData(
    "Participação em bancas ",
    400,
  ),
];
