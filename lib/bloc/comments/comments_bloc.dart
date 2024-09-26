import 'package:comment_vault/utils/vault_path_export.dart';


part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent,CommentsState> {
  CommentsBloc() : super(CommentsInitial()) {
    on<GetComments>(_getComments);
    on<GetMailMaskStatus>(_getMailMaskStatus);
  }

  Future<void> _getComments(GetComments event, Emitter<CommentsState> emit) async {
    Response response = await BaseService().httpGet(EndPoints.comments);
    if(response.statusCode == 200){
      final List<dynamic> jsonArray = json.decode(response.body);
      List<Comment> commentList = jsonArray.map((json) => Comment.fromJson(json)).toList();
      emit(CommentsDetails(commentList));
    }else{
      emit(FailedState());
    }
  }
  Future<void> _getMailMaskStatus(GetMailMaskStatus event, Emitter<CommentsState> emit) async {
    FcmStream fcmStream = FcmStream();
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 10),
    ));
    await remoteConfig.fetchAndActivate();
    bool data = remoteConfig.getBool("mask_mail");
    Logger.debug("remoteConfig",data);
    fcmStream.receivedMessageSink(data);
    remoteConfig.onConfigUpdated.listen((remoteConfigUpdate) async {
      await remoteConfig.activate();
      bool data = remoteConfig.getBool("mask_mail");
      Logger.debug("onConfigUpdated ",data);
      fcmStream.receivedMessageSink(data);
    });
  }
}
