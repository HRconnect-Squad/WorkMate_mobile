class ChatApiConstant {
  const ChatApiConstant._();

  static const String conversations = '/api/conversations';
  static const String sendMessage = '/api/messages';
  static String conversationMessages(int contactId) =>
      '/api/conversations/$contactId/messages';
  static String conversationRead(int contactId) =>
      '/api/conversations/$contactId/read';
}