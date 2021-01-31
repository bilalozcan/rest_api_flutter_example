import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rest_api_flutter_example/app/services/api.dart';
import 'package:rest_api_flutter_example/app/services/api_service.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _cases;
  int _todayCases;
  int _active;
  int _deaths;
  int _todayDeaths;
  int _recovered;
  int _critical;
  int _casesPerOneMillion;
  int _deathsPerOneMillion;
  int _totalTests;
  int _testsPerOneMillion;

  int _id;
  String _username;
  String _password;

  Future<void> _updateAccessToken() async {
    final apiService = APIService(API.sandbox());
    final accessToken = await apiService.getAccessToken();
    final cases = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.cases);
    final todayCases = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.todayCases);
    final active = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.active);
    final deaths = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.deaths);
    final todayDeaths = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.todayCases);
    final recovered = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.recovered);
    final critical = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.critical);
    final casesPerOneMillion = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.casesPerOneMillion);
    final deathsPerOneMillion = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.deathsPerOneMillion);
    final totalTests = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.totalTests);
    final testsPerOneMillion = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.testsPerOneMillion);
    setState(() {
      _cases = cases;
      _todayCases = todayCases;
      _active = active;
      _deaths = deaths;
      _todayDeaths = todayDeaths;
      _recovered = recovered;
      _critical = critical;
      _casesPerOneMillion = casesPerOneMillion;
      _deathsPerOneMillion = deathsPerOneMillion;
      _totalTests = totalTests;
      _testsPerOneMillion = testsPerOneMillion;
    });
  }

  Future<void> getData() async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      var request = await client.getUrl(
          Uri(scheme: 'https', host: 'bilalozcan.site', path: 'get.php'));
      var response = await request.close();
      if (response.statusCode == 200) {
        response.map((event){
          print('ZZZZZZZ'+event.toString());
        });
        var value = await response.first;
        if(value != null){
          print('SSS'+value.toString());
        }else {
          print("asdfssdf");
        }
        response.transform(utf8.decoder).listen((contents) {
          print(contents);
        });
        /*final id = data['id'];
        final username = data['username'];
        final password = data['password'];
        setState(() {
          _id = id;
          _username = username;
          _password = password;
        });*/
      }
    } catch (e) {
      print('AA' + e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    //_updateAccessToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
        },
      ),
      body: Column(
        children: [
          Text(_id.toString()),
          Text(_username.toString()),
          Text(_password.toString()),
        ],
      ),
      /*Column(
        children: [
          Text(_cases.toString()),
          Text(_todayCases.toString()),
          Text(_active.toString()),
          Text(_deaths.toString()),
          Text(_todayDeaths.toString()),
          Text(_recovered.toString()),
          Text(_critical.toString()),
          Text(_casesPerOneMillion.toString()),
          Text(_deathsPerOneMillion.toString()),
          Text(_totalTests.toString()),
          Text(_testsPerOneMillion.toString()),
          Text(_cases.toString()),
          Text(_cases.toString()),
        ],
      ),*/
      /* FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Text(_id.toString()),
                Text(_username.toString()),
                Text(_password.toString()),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),*/
    );
  }
}
