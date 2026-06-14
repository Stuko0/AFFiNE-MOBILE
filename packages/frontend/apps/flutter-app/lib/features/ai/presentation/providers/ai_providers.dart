import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/chat_message.dart';
import '../../data/repositories/ai_repository_impl.dart';

final aiSessionProvider = StateNotifierProvider<AiChatNotifier, AsyncValue<ChatSession>>((ref) {
  return AiChatNotifier(ref);
});

class AiChatNotifier extends StateNotifier<AsyncValue<ChatSession>> {
  final Ref _ref;
  AiChatNotifier(this._ref) : super(const AsyncValue.loading());

  String? _workspaceId;
  String? _sessionId;

  Future<void> init(String workspaceId) async {
    _workspaceId = workspaceId;
    state = const AsyncValue.loading();
    try {
      final repo = _ref.read(aiRepositoryProvider);
      final session = await repo.createSession(workspaceId);
      _sessionId = session.id;
      state = AsyncValue.data(session);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> sendMessage(String content) async {
    final current = state.valueOrNull;
    if (current == null || _workspaceId == null || _sessionId == null) return;

    final userMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      role: 'user',
      content: content,
      timestamp: DateTime.now(),
    );

    final updatedMsgs = [...current.messages, userMsg];
    state = AsyncValue.data(current.copyWith(messages: updatedMsgs));

    try {
      final repo = _ref.read(aiRepositoryProvider);
      final reply = await repo.sendMessage(_workspaceId!, _sessionId!, content);
      state = AsyncValue.data(current.copyWith(
        messages: [...updatedMsgs, reply],
        updatedAt: DateTime.now(),
      ));
    } catch (e) {
      final errorMsg = ChatMessage(
        id: 'error-${DateTime.now().millisecondsSinceEpoch}',
        role: 'assistant',
        content: 'Sorry, an error occurred. Please try again.',
        timestamp: DateTime.now(),
      );
      state = AsyncValue.data(current.copyWith(
        messages: [...updatedMsgs, errorMsg],
      ));
    }
  }
}
