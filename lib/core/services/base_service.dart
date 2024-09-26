import 'package:comment_vault/utils/vault_path_export.dart';


class BaseService {
  var https = RetryClient(Client());

  Future<Response> httpGet(String url) async {
    Logger.debug("GET Url", url);
    try {
        return https.get(Uri.parse(url));
    } catch (e) {
      throw Exception(e);
    }
  }


}
