import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p_associate_app/user/services/associate_user_service.dart';

void main() {
  test(
    'Given response from API When instanciate user Then check if it exists',
    () async {
      AssociateUserService associateUserService = AssociateUserService();
      String user = await associateUserService.associateUser();

      // logic: if(exists(user)) { user = user[index + 1] } else { user = user[random] }

      debugPrint(
        user,
      );

      expect(
        AssociateUserService.userList.contains(
          user,
        ),
        true,
      );
    },
  );
}
