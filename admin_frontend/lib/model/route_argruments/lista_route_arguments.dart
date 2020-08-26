import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';

class ListaRouteArguments {
  final ObservableList<CurriculoLattes> lista;

  ListaRouteArguments(this.lista);
}
