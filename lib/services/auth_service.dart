import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  String message = '';
  late String _verificationId;

  late List<String> _msg;

  Future register(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      message = userCredential.additionalUserInfo!.username!;
      User? user = auth.currentUser;
      if (!isEmailVerified()) {
        await user!.sendEmailVerification();
      }
      print('token: ${user?.getIdToken()}');
      return message;
      // ?? 'Registo Efectuado com Sucesso';
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
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      message = userCredential.additionalUserInfo!.username!;
      if (isEmailVerified()) {
        message = 'Login Efectuado com Sucesso\nParabéns, ganhou acesso à app';
        print(userCredential.credential?.token.toString());
      }
      return message;
      // ?? 'Login Efectuado com Sucesso\nAguardando Confirmação de email';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'Utilizador com email fornecido não encontrado';
      } else if (e.code == 'wrong-password') {
        message = 'Password errada para este utilizador ou Conta não existente';
      }
      return message;
    }
  }

  Future phoneVerificationAuth(String phoneNumber) async {
    // print('l$phoneNumber');

    //verificar se numero é válido para o envio/validação do mesmo
    return await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        //validação automática
        verificationCompleted: (PhoneAuthCredential credential) async {
          //após implementação da função do firebase ele retorna a credencial
          //que permite fazer a autenticação abaixo
          return await auth
              .signInWithCredential(credential)
              .whenComplete(() {})
              .then((value) {
            //Para actualização da nossa UI
            return ['Usuário logado'];
          });
        },
        //tratamento de erros
        verificationFailed: (FirebaseAuthException e) {
          print('m: ${e.message}');
          //Para actualização da nossa UI
          _msg = ['Validação falhou com o seguinte erro: ${e.message}'];
        },
        //envio do código de confirmação
        codeSent: (String verificationId, int? resendToken) async {
          _verificationId = verificationId;
          //Para actualização da nossa UI
          _msg = [
            'Efectuou a validação com sucesso\n Insira o código enviado:',
            verificationId,
            resendToken.toString()
          ];
        },
        //lidar com erros de timeout
        codeAutoRetrievalTimeout: (String verificationId) {
          //Para actualização da nossa UI
          _msg = [verificationId];
        });
  }

  //validação "manual do utilizador"
  confirmPhoneVerificationAuth(smsCode) async {
    //instanciar "manualmente" o PhoneAuthCredential para gerar a credencial que nos possibilita
    // efectuar a validação
    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: smsCode);

    //com a credencial é possivel então efectuar a autenticação do utilizador
    return await auth
        .signInWithCredential(phoneAuthCredential)
        .whenComplete(() {})
        .then((value) {
      return 'Usuário logado';
    });
  }

  Future signInWithGoogle() async {
    try {
      //aciona o serviço de autenticação google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      //criação de credencias para autenticar o utilizador na aplicação
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      String token = await FirebaseInstallations.instance.getToken();

      //com a credencial é possivel então efectuar a autenticação do utilizador
      return await auth
          .signInWithCredential(credential)
          .whenComplete(() {})
          .then((value) {
        print('token:: $token');
        return 'Usuário logado';
      });

      //tratamento de excepções
    } on FirebaseAuthException catch (e) {
      return 'Erro ao autenticar conta  \n$e';
    }
  }

  bool isEmailVerified() {
    User? user = auth.currentUser;
    return user!.emailVerified;
  }
}
