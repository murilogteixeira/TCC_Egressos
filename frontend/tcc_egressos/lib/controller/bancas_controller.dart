import 'package:tcc_egressos/components/network.dart';
import 'package:tcc_egressos/model/curriculo_lattes/banca/banca.dart';

class BancasController {
  Future<List<Banca>> getBancasEgresso(int id) async {
    final url =
        'https://egressosbackend.herokuapp.com/bancasEgresso/?search=$id';

    List json = await Network().fetchData(url);
    if (json == null) return null;
    List<Banca> bancas = [];
    bancas = json.map((e) => Banca.fromJson(e)).toList();
    return bancas;
  }
}
