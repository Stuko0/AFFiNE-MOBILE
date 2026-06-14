import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../datasources/ai_remote_datasource.dart';
import '../../domain/entities/chat_message.dart';

final aiRepositoryProvider = Provider<AiRepository>((ref) {
  return AiRepository(ref.watch(aiDataSourceProvider));
});

class AiRepository {
  final AiRemoteDataSource _ds;
  AiRepository(this._ds);

  Future<ChatSession> createSession(String wsId) => _ds.createSession(wsId);
  Future<ChatMessage> sendMessage(String wsId, String sessionId, String content) => _ds.sendMessage(wsId, sessionId, content);
}
