import 'package:comment_vault/utils/vault_path_export.dart';

/// FCMBloc to manage FCM data streams.
class FcmStream {


  static StreamController<bool> fcmDataController =
  StreamController<bool>.broadcast();

  // Getter to access the FCM data stream.
  Stream<bool> get fcmDataStream => fcmDataController.stream;

  void receivedMessageSink(bool maskStatus) {

    // Add the dataModel to the FCM data stream using the StreamController.
    if (!fcmDataController.isClosed) {
      fcmDataController.sink.add(maskStatus);
    } else {
      Logger.debug("error",
          'Stream controller[fcmDataController] is closed. Cannot add events.');
    }
  }

  /// Method to dispose of the StreamController when it's no longer needed.
  Future<void> dispose() async {
    await fcmDataController.close();
  }

  /// Create a static StreamController to handle data related to FCM (Firebase Cloud Messaging).
  reInitializeFcmDataController() {
    if (fcmDataController.isClosed) {
      fcmDataController = StreamController<bool>.broadcast();
    }
  }
}

