import 'package:contatos/model/agente.model.dart';
import 'package:contatos/user.dart';
import 'package:dio/dio.dart';

class AgenteRepository {
  Future<List<AgenteModel>> getAgente() async {
    var url = "" + user.name;
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => AgenteModel.fromJson(contatos))
        .toList();
  }

  Future<List<AgenteModel>> getAllAgentes() async {
    var url = "";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => AgenteModel.fromJson(contatos))
        .toList();
  }

  Future<AgenteModel> addAgente(AgenteModel model) async {
    var url = "";

    try {
      Response response = await Dio().post(
        url,
        data: model,
      );
      return AgenteModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

  Future<AgenteModel> editAgenteModel(AgenteModel model) async {
    var url = "";
        +
        model.agenteId.toString();

    try {
      Response response = await Dio().put(
        url,
        data: model,
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        // ),
      );
      return AgenteModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

  Future<AgenteModel> deleteAgente(AgenteModel model) async {
    var url = "";
        +
        model.agenteId.toString();

    try {
      Response response = await Dio().delete(
        url,
        data: model,
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        // ),
      );
      return AgenteModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

  Future<AgenteModel> markAsDoneAgente(AgenteModel model) async {
    var url = "";
        +
        model.agenteId.toString();

    try {
      Response response = await Dio().put(
        url,
        data: model,
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        // ),
      );
      return AgenteModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }
}
