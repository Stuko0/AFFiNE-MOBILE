class ChatMessage {
  final String id;
  final String role;
  final String content;
  final DateTime timestamp;
  final bool isStreaming;

  const ChatMessage({
    required this.id,
    required this.role,
    required this.content,
    required this.timestamp,
    this.isStreaming = false,
  });

  bool get isUser => role == 'user';
  bool get isAssistant => role == 'assistant';

  ChatMessage copyWith({String? content, bool? isStreaming}) {
    return ChatMessage(
      id: id,
      role: role,
      content: content ?? this.content,
      timestamp: timestamp,
      isStreaming: isStreaming ?? this.isStreaming,
    );
  }
}

class ChatSession {
  final String id;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ChatMessage> messages;

  const ChatSession({
    required this.id,
    this.title = 'New Chat',
    required this.createdAt,
    required this.updatedAt,
    this.messages = const [],
  });

  ChatSession copyWith({String? title, List<ChatMessage>? messages, DateTime? updatedAt}) {
    return ChatSession(
      id: id,
      title: title ?? this.title,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      messages: messages ?? this.messages,
    );
  }
}
