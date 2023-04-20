import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/modules/auth/auth_plugin/auth_plugin.dart';
import 'package:videocall/modules/auth/auth_plugin/google_login.dart';
import 'package:videocall/modules/auth/auth_services/auth_serivces.dart';
import 'package:videocall/modules/auth/models/login_data.dart';

import '../auth_provider/google_provider.dart';
import 'app_auth.dart';

@Injectable(as: AuthServices)
class AppAuthServices implements AuthServices {
  final _appAuth = AppAuth();

  @override
  Future<LoginData?> loginWithGoogle() async {
    final authGoogle = GoogleLogin();
    final authResult = await authGoogle.login();
    if (authResult.accessToken != null && authResult.idToken != null) {
      final result = await _appAuth.signInWithCredential(
        GoogleAuthProvider.getCredential(
          accessToken: authResult.accessToken,
          idToken: authResult.idToken,
        ),
      );
      return result;
    }
    return handleError(authResult);
  }

  LoginData handleError(AuthResult authResult) {
    if (authResult.loginStatus == LoginStatus.cancelledByUser) {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
    throw PlatformException(
      code: 'ERROR_BY_CONFIG',
      message: authResult.errMessage,
    );
  }
}
