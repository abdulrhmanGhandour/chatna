import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:one_app/models/messages_models.dart';
import '../../../constants/constants.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessageModel);

  void sendMessage({required String message, required String email}) {
    messages.add(
      {'message': message, KTimeMessage: DateTime.now(), 'id': email},
    );
  }

  void getMessage() {
    messages.orderBy(KTimeMessage, descending: true).snapshots().listen((event) {
      List<Message> messageList = [];
      for (var doc in event.docs) {
        messageList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messageList: messageList));
    });
  }
}
