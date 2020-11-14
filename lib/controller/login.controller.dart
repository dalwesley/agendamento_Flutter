import 'package:contatos/model/agente.model.dart';
import 'package:contatos/repository/agente.repository.dart';
import 'package:contatos/user.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // AppStore _store;
  AgenteRepository _repository;

  Future login() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser firebaseUser =
        (await _auth.signInWithCredential(credential)).user;

    var token = await firebaseUser.getIdToken();

    user.name = firebaseUser.displayName;
    user.email = firebaseUser.email;
    user.phone = firebaseUser.phoneNumber;
    user.picture = firebaseUser.photoUrl;
    user.token = token.token;
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    user = new IUser();
  }

  Future addAgente(AgenteModel agenteModel) async {
    var url = "";

    try {
      Response response = await Dio().post(
        url,
        data: agenteModel,
      );
      return AgenteModel.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

  Future editAgente(AgenteModel agenteModel) async {
    await _repository.markAsDoneAgente(agenteModel);
  }

  Future markAsDoneAgente(AgenteModel agenteModel) async {
    if (agenteModel.agenteStatus == true) {
      agenteModel.agenteStatus = false;
    } else {
      agenteModel.agenteStatus = true;
    }
    await _repository.markAsDoneAgente(agenteModel);
  }

  Future removeAgente(AgenteModel agenteModel) async {
    await _repository.deleteAgente(agenteModel);
  }
}
