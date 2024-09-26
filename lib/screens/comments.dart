import 'package:comment_vault/utils/vault_path_export.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  late FcmStream fcmStream;
  @override
  void initState() {
    BlocProvider.of<CommentsBloc>(context).add(GetComments());
    fcmStream = FcmStream();
    fcmStream.reInitializeFcmDataController();
    super.initState();
  }
  @override
  void dispose() {
    fcmStream.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
         backgroundColor:VaultColor.kPrimaryColor,
         title: Text("Comments",style: TextStyles.kTitleSmall.copyWith(color: VaultColor.kWhite)),
       ),
      body:StreamBuilder<bool>(
        stream: fcmStream.fcmDataStream,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: BlocConsumer<CommentsBloc, CommentsState>(
            listener: (context, state){
    if(state is CommentsDetails){
      BlocProvider.of<CommentsBloc>(context).add(GetMailMaskStatus());
    }
            },
            builder: (context, state) {
              if(state is CommentsDetails){
                return ListView.builder(
                    padding: const EdgeInsets.all(15.0),
                    itemCount:state.commentList.length,
                    itemBuilder:(BuildContext context,int index){

                      return Container(
                        decoration: BoxDecoration(
                            color:VaultColor.kWhite ,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius:20,
                              backgroundColor: Colors.grey.shade300,
                              child: Center(
                                child: Text(
                                  state.commentList[index].name![0].toUpperCase(),
                                  style: TextStyles.kLabelLarge.copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                            ConstWidget.kSizeBoxW20,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  nameAndEmailWidget( 'Name : ', state.commentList[index].name??""),
                                  ConstWidget.kSizeBox5,
                                  nameAndEmailWidget( 'Email  : ', maskEmail(state.commentList[index].email??"",snapshot.data??false)),
                                  ConstWidget.kSizeBox5,
                                  Text(state.commentList[index].body??"",
                                    softWrap: true,
                                    textAlign: TextAlign.justify,
                                    style: TextStyles.kBodyLarge.copyWith(color: Colors.black,fontStyle: FontStyle.normal,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }
              if(state is FailedState){
                return Center(child: Image.asset("assets/images/no_data.png"),);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          );
        }
      ),
    );
  }

  Widget nameAndEmailWidget(String title,String data){
    return RichText(
      text: TextSpan(
        text: title,
        style:TextStyles.kBodyLarge.copyWith(color: Colors.grey,fontStyle: FontStyle.italic),
        children: [
          TextSpan(
            text: data,
            style: TextStyles.kBodyLarge.copyWith(color: Colors.black,fontStyle: FontStyle.normal,),
          ),
        ],
      ),
    );
  }
}

class Example{
  String name;
  String email;
  String message;
  Example(this.name,this.email,this.message);

}

String maskEmail(String email, bool isMaskingEnabled) {
  if (isMaskingEnabled && email.contains('@')) {
    // Split the email into username and domain
    final parts = email.split('@');
    final username = parts[0]; // Part before @
    final domain = parts[1];   // Part after @

    // If username length is more than 3, mask the remaining
    if (username.length > 3) {
      return '${username.substring(0, 3)}****@$domain';
    } else {
      // If username is 3 or less, return as is
      return email;
    }
  }
  return email; // Return the original email if masking is not enabled
}
