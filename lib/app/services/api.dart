import 'package:flutter/foundation.dart';
import 'package:rest_api_flutter_example/app/services/api_keys.dart';

enum Endpoint {
  cases,
  todayCases,
  active,
  deaths,
  todayDeaths,
  recovered,
  critical,
  casesPerOneMillion,
  deathsPerOneMillion,
  totalTests,
  testsPerOneMillion,
}
//https://bilalozcan.site:255/users
//https://bilalozcan.site:255/user/1
class API {
  API({@required this.apiKey});
  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = 'gateway.nubentos.com';
  static final int port = 443;
  static final String basePath = '/nubentos.com/ncovapi/2.0.0';

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: 'token',
        queryParameters: {'grant_type': 'client_credentials'},
      );
  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: '$basePath/${_paths[endpoint]}',
      );
  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.todayCases: 'todayCases',
    Endpoint.active: 'active',
    Endpoint.deaths: 'deaths',
    Endpoint.todayDeaths: 'todayDeaths',
    Endpoint.recovered: 'recovered',
    Endpoint.critical: 'critical',
    Endpoint.casesPerOneMillion: 'casesPerOneMillion',
    Endpoint.deathsPerOneMillion: 'deathsPerOneMillion',
    Endpoint.totalTests: 'totalTests',
    Endpoint.testsPerOneMillion: 'testsPerOneMillion',
  };
}