import 'package:spirit_within_flutter/core/auth/sign_in_check.dart';

import '../../main.dart';

signOut() {
  sharedPreferences.setBool("isSignedIn", false);
  isSignedIn = false;
}
