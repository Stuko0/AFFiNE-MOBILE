import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/chat_message.dart';
import '../../../../core/constants/api_constants.dart';

final aiDataSourceProvider = Provider<AiRemoteDataSource>((ref) => AiRemoteDataSource());

class AiRemoteDataSource {
  Future<String?> _getToken() async => null;

  Future<ChatSession> createSession(String workspaceId) async {
    final r = await _gql({
      'query': '''
      mutation CreateCopilotSession(\$workspaceId: String!) {
        createCopilotSession(workspaceId: \$workspaceId) {
          id
          title
          createdAt
          updatedAt
        }
      }''',
      'variables': {'workspaceId': workspaceId},
    });
    final s = ((r['data'] as Map?)??{})['createCopilotSession'] as Map? ?? {};
    return ChatSession(
      id: s['id'] as String? ?? '',
      title: s['title'] as String? ?? 'New Chat',
      createdAt: _date(s['createdAt']),
      updatedAt: _date(s['updatedAt']),
    );
  }

  Future<ChatMessage> sendMessage(String workspaceId, String sessionId, String content) async {
    final r = await _gql({
      'query': '''
      mutation CreateCopilotMessage(\$workspaceId: String!, \$sessionId: String!, \$content: String!) {
        createCopilotMessage(workspaceId: \$workspaceId, sessionId: \$sessionId, content: \$content) {
          id
          role
          content
          createdAt
        }
      }''',
      'variables': {'workspaceId': workspaceId, 'sessionId': sessionId, 'content': content},
    });
    final m = ((r['data'] as Map?)??{})['createCopilotMessage'] as Map? ?? {};
    return ChatMessage(
      id: m['id'] as String? ?? '',
      role: m['role'] as String? ?? 'assistant',
      content: m['content'] as String? ?? '',
      timestamp: _date(m['createdAt']),
    );
  }

  DateTime _date(dynamic d) {
    if (d == null) return DateTime.now();
    if (d is String) return DateTime.tryParse(d) ?? DateTime.now();
    if (d is int) return DateTime.fromMillisecondsSinceEpoch(d);
    return DateTime.now();
  }

  Future<Map<String, dynamic>> _gql(Map<String, dynamic> body) async {
    final uri = Uri.parse('${ApiConstants.defaultBaseUrl}${ApiConstants.graphQlPath}');
    final client = HttpClient();
    client.connectionTimeout = ApiConstants.connectionTimeout;
    try {
      final req = await client.postUrl(uri);
      req.headers.set('Content-Type', 'application/json');
      final t = await _getToken();
      if (t != null) req.headers.set('Authorization', 'Bearer $t');
      req.write(jsonEncode(body));
      final res = await req.close();
      final d = jsonDecode(await res.transform(utf8.decoder).join()) as Map<String, dynamic>;
      if (d.containsKey('errors')) throw AiException(d['errors'].toString());
      return d;
    } finally { client.close(); }
  }
}

class AiException implements Exception {
  final String message;
  AiException(this.message);
  @override
  String toString() => message;
}
