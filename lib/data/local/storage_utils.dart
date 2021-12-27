import '/constraints/strings.dart';
import 'package:get_storage/get_storage.dart';

final _box = GetStorage(dbName);

class StorageUtils {
  static bool isUserLoggedIn([bool? status]) {
    if (status != null) {
      _box.write('_is_logged_in', status);
    }
    
    return _box.read<bool>('_is_logged_in') ?? false;
  }

  static void removeLoginStatus() {
    _box.remove('_is_logged_in');
  }
}
