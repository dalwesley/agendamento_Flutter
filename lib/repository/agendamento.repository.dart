import 'package:contatos/model/agendamento.model.dart';
import 'package:contatos/user.dart';
import 'package:dio/dio.dart';

class AgendamentoRepository {
  var caminho = "";

  Future<List<AgendamentoModel>> getTodayAgendamentos() async {
    var url = caminho + "Today/" + user.name;
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => AgendamentoModel.fromJson(contatos))
        .toList();
  }

  Future<List<AgendamentoModel>> getDateAgendamentos(date) async {
    var url = caminho + "Date/" + date;
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => AgendamentoModel.fromJson(contatos))
        .toList();
  }

  Future<List<AgendamentoModel>> getTomorrowAgendamentos() async {
    var url = caminho + "Tomorrow/" + user.name;
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => AgendamentoModel.fromJson(contatos))
        .toList();
  }

  Future<List<AgendamentoModel>> getAllAgendamentos() async {
    var url = caminho + "All";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => AgendamentoModel.fromJson(contatos))
        .toList();
  }

  Future<List<AgendamentoModel>> getDoneAgendamentos() async {
    var url = caminho + "Done";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => AgendamentoModel.fromJson(contatos))
        .toList();
  }

  Future<List<AgendamentoModel>> getCancelAgendamentos() async {
    var url = caminho + "Cancel";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => AgendamentoModel.fromJson(contatos))
        .toList();
  }

  Future<List<AgendamentoModel>> getExpiredAgendamentos() async {
    var url = caminho + "Expired";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => AgendamentoModel.fromJson(contatos))
        .toList();
  }

  Future<AgendamentoModel> add(AgendamentoModel model) async {
    var url = caminho + "Post/";
    try {
      Response response = await Dio().post(
        url,
        data: model,
      );
      return AgendamentoModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

//path -. igual ao put mais nao passa todos os dados, só os que vaos er alterados.
  Future<AgendamentoModel> edit(AgendamentoModel model) async {
    var url = caminho + "put/" + model.agendamentoId.toString();

    try {
      Response response = await Dio().put(
        url,
        data: model,
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        // ),
      );
      return AgendamentoModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

//path -. igual ao put mais nao passa todos os dados, só os que vaos er alterados.
  Future<AgendamentoModel> markAsDone(AgendamentoModel model) async {
    var url = caminho + "Mark-As-Done/" + model.agendamentoId.toString();

    try {
      Response response = await Dio().put(
        url,
        data: model,
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        // ),
      );
      return AgendamentoModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

  Future<AgendamentoModel> delete(AgendamentoModel model) async {
    var url = caminho + "Delete/" + model.agendamentoId.toString();

    try {
      Response response = await Dio().delete(
        url,
        data: model,
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        // ),
      );
      return AgendamentoModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

//path -. igual ao put mais nao passa todos os dados, só os que vaos er alterados.
  Future<AgendamentoModel> cancel(AgendamentoModel model) async {
    var url = caminho + "Mark-As-Cancel/" + model.agendamentoId.toString();

    try {
      Response response = await Dio().delete(
        url,
        data: model,
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        // ),
      );
      return AgendamentoModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

  Future<List<AgendamentoModel>> getTodayHorario(date) async {
    var url = caminho + "All/" + date;
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((contatos) => AgendamentoModel.fromJson(contatos))
        .toList();
  }
}
