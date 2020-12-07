class BaseURL {
  static var shared = BaseURL._();
  BaseURL._();

  String login() => 'https://egressosbackend.herokuapp.com/api/login/';
  String resetSenha() =>
      'https://egressosbackend.herokuapp.com/accounts/password_reset/';
  String getEgressos() => 'https://egressosbackend.herokuapp.com/egressos/';
  String getEgresso(egressoID) => 'https://egressosbackend.herokuapp.com/egressos/$egressoID/';
  String getMediaProducoes(egressoID) =>
      'https://egressosbackend.herokuapp.com/graphType/$egressoID';
  String updateEgresso(egressoID) =>
      'https://egressosbackend.herokuapp.com/egressos/$egressoID/';
}
