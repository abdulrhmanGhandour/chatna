import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginUser({required email, required password}) async {
    emit(LoginLoding());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
         emit(LoginFailure(errMessage:'user not found'));
      } else if (e.code == 'wrong-password') {
         emit(LoginFailure(errMessage:'wrong password' ));
      }
    }catch(e){
       emit(LoginFailure(errMessage: 'someting is worng'));
    }
  }

   Future<void> registerUser({required email, required password}) async {
    emit(RegisterLoding());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailuer(errMesage: 'weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailuer(errMesage: 'email already in use'));
      }
    } catch (e) {
      emit(RegisterFailuer(errMesage: 'Somting was woring'));
    }
  }
  
}
