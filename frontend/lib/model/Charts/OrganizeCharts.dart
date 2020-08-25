import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/rendering.dart';

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
  final List<charts.Series> seriesList;
  final bool animate;

  PieOutsideLabelChart(this.seriesList, {this.animate});

  factory PieOutsideLabelChart.withSampleData(List<ChartsData> data) {
    return new PieOutsideLabelChart(
      _createSampleData(data),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: true,
      animationDuration: Duration(seconds: 2),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ChartsData, String>> _createSampleData(
      List<ChartsData> data) {
    return [
      new charts.Series<ChartsData, String>(
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
  final List<charts.Series> seriesList;
  final bool animate;

  BarChartOutsideLabelChart(this.seriesList, {this.animate});

  factory BarChartOutsideLabelChart.withSampleData(
      List<ChartsData> data, List<int> averages) {
    return new BarChartOutsideLabelChart(
      _createSampleData(data, averages),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      domainAxis: new charts.OrdinalAxisSpec(
          // Make sure that we draw the domain axis line.
          showAxisLine: true,
          // But don't draw anything else.
          renderSpec: new charts.NoneRenderSpec()),
      defaultRenderer: new charts.BarRendererConfig(
        cornerStrategy: const charts.ConstCornerStrategy(4),
      ),
      animationDuration: Duration(seconds: 2),
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ChartsData, String>> _createSampleData(
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
            charts.Color(r: 235, g: 234, b: 242, a: Colors.grey.alpha)),
      );
    }
    return [
      new charts.Series<ChartsData, String>(
        id: 'data',
        domainFn: (ChartsData data, _) => data.nome,
        measureFn: (ChartsData data, _) => data.value,
        colorFn: (ChartsData data, _) => data.cor,
        data: userData,
      ),
      new charts.Series<ChartsData, String>(
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
      data[i].cor = charts.Color(
          r: colorsColor[i].red,
          g: colorsColor[i].green,
          b: colorsColor[i].blue,
          a: colorsColor[i].alpha);

      children.add(new Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
            child: Icon(Icons.lens, size: (ballSize), color: colorsMaterial[i]),
          ),
          Text(
            data[i].nome + "..." + "${data[i].value}",
            style: TextStyle(fontSize: fontSize),
          ),
        ],
      ));
    }

    return Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(60, 50, 1, 10),
              child: Text(
                "Visão Geral",
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 125, 217),
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(60, 5, 1, 10),
              child: Text(
                "Total: $valorTotalPieChart produções",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: new PieOutsideLabelChart.withSampleData(data),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
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
                "Em comparação com a média",
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 125, 217),
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: SizedBox(
                width: data.length.toDouble() * this.widthBarChart,
                height: 350,
                child: new BarChartOutsideLabelChart.withSampleData(
                    data, avarages),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
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
  charts.Color cor;

  ChartsData(this.nome, this.value,[this.cor]);
}

final dataExemplo = [
  new ChartsData(
      "Participação em eventos, congressos, exposições e feiras ",
      500,),
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
