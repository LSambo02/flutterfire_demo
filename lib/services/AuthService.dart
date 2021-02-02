import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  String message = '';

  Future register(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      message = userCredential.additionalUserInfo.username;
      User user = auth.currentUser;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      return message ?? 'Registo Efectuado com Sucesso';
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        message = 'Palavra-passe demasiado fraca';
      } else if (e.code == 'email-already-in-use') {
        message = 'Conta com o email fornecido já existente';
      }

      return message;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      message = userCredential.additionalUserInfo.username;
      if (isEmailVerified()) {
        message = 'Login Efectuado com Sucesso\nParabéns, ganhou acesso à app';
      }
      return message ??
          'Login Efectuado com Sucesso\nAguardando Confirmação de email';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'Utilizado com email fornecido não encontrado';
      } else if (e.code == 'wrong-password') {
        message = 'Password errada para este utilizador ou Conta não existente';
      }
      return message;
    }
  }

  bool isEmailVerified() {
    User user = auth.currentUser;
    return user.emailVerified;
  }
}
