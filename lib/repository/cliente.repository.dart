import 'package:contatos/model/cliente.model.dart';
import 'package:dio/dio.dart';

class ClienteRepository {
  var caminho = "";

  Future<List<ClienteModel>> getCliente(selection) async {
    var url = caminho + "getCliente";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => ClienteModel.fromJson(contatos))
        .toList();
  }

  Future<List<ClienteModel>> getRecentClientes() async {
    var url = caminho + "getRecentClientes";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((newCliente) => ClienteModel.fromJson(newCliente))
        .toList();
  }

  Future<List<ClienteModel>> getAllClientes() async {
    var url = caminho + "getAllClientes";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => ClienteModel.fromJson(contatos))
        .toList();
  }

  Future<List<ClienteModel>> getExpiredClientes() async {
    var url = caminho + "getExpiredClientes";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => ClienteModel.fromJson(contatos))
        .toList();
  }

  Future<List<ClienteModel>> getCancelClientes() async {
    var url = caminho + "getCancelClientes";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((newCliente) => ClienteModel.fromJson(newCliente))
        .toList();
  }

  Future<ClienteModel> addCliente(ClienteModel clienteModel) async {
    var url = caminho + "Post";
    try {
      Response response = await Dio().post(
        url,
        data: clienteModel,
      );
      return ClienteModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

//path -. igual ao put mais nao passa todos os dados, só os que vaos er alterados.
  Future<ClienteModel> edit(ClienteModel model) async {
    var url = caminho + "edit/" + model.clienteId.toString();

    try {
      Response response = await Dio().put(
        url,
        data: model,
      );
      return ClienteModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

//path -. igual ao put mais nao passa todos os dados, só os que vaos er alterados.
  Future<ClienteModel> markAsCancel(ClienteModel model) async {
    var url = caminho + "Mark-As-Cancel/" + model.clienteId.toString();

    try {
      Response response = await Dio().put(
        url,
        data: model,
      );
      return ClienteModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

  Future<ClienteModel> delete(ClienteModel model) async {
    var url = caminho + "Delete/" + model.clienteId.toString();

    try {
      Response response = await Dio().delete(
        url,
        data: model,
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        // ),
      );
      return ClienteModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

//path -. igual ao put mais nao passa todos os dados, só os que vaos er alterados.
  Future<ClienteModel> cancel(ClienteModel model) async {
    var url = caminho + "Mark-As-Cancel/" + model.clienteId.toString();

    try {
      Response response = await Dio().delete(
        url,
        data: model,
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        // ),
      );
      return ClienteModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }
}
