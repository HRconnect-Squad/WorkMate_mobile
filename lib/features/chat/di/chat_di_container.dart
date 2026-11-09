import '../../../core/data/network/dio_client.dart';
import '../../../core/data/network/socket_client.dart';
import '../../../core/di/core_di_container.dart';
import '../data/datasource/remote/chat_remote_data_source.dart';
import '../data/datasource/remote/chat_remote_data_source_impl.dart';
import '../data/datasource/remote/realtime/chat_realtime_data_source.dart';
import '../data/datasource/remote/realtime/chat_realtime_data_source_impl.dart';
import '../data/repository_imp/chat_repository_impl.dart';
import '../domain/repository/chat_repository.dart';
import '../domain/usecase/get_conversation_messages_usecase.dart';
import '../domain/usecase/get_conversations_usecase.dart';
import '../domain/usecase/mark_conversation_read_usecase.dart';
import '../domain/usecase/send_message_usecase.dart';
import '../domain/usecase/watch_chat_connected_usecase.dart';
import '../domain/usecase/watch_chat_connection_usecase.dart';
import '../domain/usecase/watch_incoming_messages_usecase.dart';

Future<void> initChat() async {
  // data
  sl.registerLazySingleton<ChatRemoteDataSource>(
        () => ChatRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<ChatRealtimeDataSource>(
        () => ChatRealtimeDataSourceImpl(socket: sl<SocketClient>()),
  );
  sl.registerLazySingleton<ChatRepository>(
        () => ChatRepositoryImpl(
      remoteDataSource: sl<ChatRemoteDataSource>(),
      realtimeDataSource: sl<ChatRealtimeDataSource>(),
    ),
  );

  // domain
  sl.registerLazySingleton<GetConversationsUseCase>(
        () => GetConversationsUseCase(sl<ChatRepository>()),
  );
  sl.registerLazySingleton<GetConversationMessagesUseCase>(
        () => GetConversationMessagesUseCase(sl<ChatRepository>()),
  );
  sl.registerLazySingleton<SendMessageUseCase>(
        () => SendMessageUseCase(sl<ChatRepository>()),
  );
  sl.registerLazySingleton<MarkConversationReadUseCase>(
        () => MarkConversationReadUseCase(sl<ChatRepository>()),
  );
  sl.registerLazySingleton<WatchIncomingMessagesUseCase>(
        () => WatchIncomingMessagesUseCase(sl<ChatRepository>()),
  );
  sl.registerLazySingleton<WatchChatConnectionUseCase>(
        () => WatchChatConnectionUseCase(sl<ChatRepository>()),
  );
  sl.registerLazySingleton<WatchChatConnectedUseCase>(
        () => WatchChatConnectedUseCase(sl<ChatRepository>()),
  );

  // presentation

}