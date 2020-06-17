import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseBloc {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _google = GoogleSignIn();

  BehaviorSubject<FirebaseUser> _firebaseUser = BehaviorSubject<FirebaseUser>();
  BehaviorSubject<GoogleSignIn> _googleSign = BehaviorSubject<GoogleSignIn>();

  BehaviorSubject<FirebaseUser> get firebaseUser => _firebaseUser;
  BehaviorSubject<GoogleSignIn> get googleSignin => _googleSign;

  Future<FirebaseUser> sign() async {
    try {
      GoogleSignInAccount _signAccount = await _google.signIn();
      GoogleSignInAuthentication _signAuth = await _signAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: _signAuth.idToken, accessToken: _signAuth.accessToken
      );
      FirebaseUser firebaseUser = (await _firebaseAuth.signInWithCredential(credential)).user;
      _firebaseUser.sink.add(firebaseUser);
      _googleSign.sink.add(_google);
      return firebaseUser;
    } catch (e) {
      throw Exception(e);
    }
  }

  void register({String username, String email, String password}) async {
    UserUpdateInfo _userUpdateInfo = UserUpdateInfo();

    FirebaseUser firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password
    )).user;

    _userUpdateInfo.displayName = username;
    firebaseUser.updateProfile(_userUpdateInfo).then((data){
      _firebaseUser.sink.add(firebaseUser);
    }).catchError((error){
      _firebaseUser.sink.addError(error);
    });
  }

  void logOut() async {
    await _firebaseAuth.signOut().then((data){
      print('Logout');
    });
  }

  void dispose() {
    _firebaseUser.close();
    _googleSign.close();
  }
}
final firebaseBloc = FirebaseBloc();