import 'package:flutter_test/flutter_test.dart';
import 'package:affine_app/features/auth/domain/entities/user.dart';
import 'package:affine_app/features/auth/domain/entities/auth_state.dart';
import 'package:affine_app/features/workspace/domain/entities/workspace.dart';
import 'package:affine_app/features/document/domain/entities/document.dart';
import 'package:affine_app/features/collection/domain/entities/collection.dart';
import 'package:affine_app/features/tag/domain/entities/tag.dart';

void main() {
  group('User entity', () {
    test('creates user with required fields', () {
      final user = User(id: '1', name: 'Test', email: 'test@test.com');
      expect(user.id, '1');
      expect(user.name, 'Test');
      expect(user.email, 'test@test.com');
    });

    test('anonymous user has empty id', () {
      final user = User.anonymous();
      expect(user.isAnonymous, true);
    });

    test('copyWith preserves unset fields', () {
      final user = User(id: '1', name: 'Test', email: 'test@test.com', avatarUrl: 'url');
      final copy = user.copyWith(name: 'Updated');
      expect(copy.id, '1');
      expect(copy.name, 'Updated');
      expect(copy.avatarUrl, 'url');
    });
  });

  group('AuthState entity', () {
    test('initial state is unauthenticated', () {
      final state = AuthState.initial();
      expect(state.status, AuthStatus.initial);
      expect(state.isAuthenticated, false);
    });

    test('authenticated state has user', () {
      final user = User(id: '1', name: 'Test', email: 't@t.com');
      final state = AuthState.authenticated(user);
      expect(state.isAuthenticated, true);
      expect(state.user?.id, '1');
    });
  });

  group('Workspace entity', () {
    test('creates workspace', () {
      final ws = Workspace(id: '1', name: 'My Workspace');
      expect(ws.name, 'My Workspace');
      expect(ws.isTeam, false);
    });
  });

  group('Document entity', () {
    test('empty document detected', () {
      final doc = Document(
        id: '1',
        workspaceId: 'ws1',
        title: '',
        createdAt: DateTime(2024),
        updatedAt: DateTime(2024),
      );
      expect(doc.isEmpty, true);
    });

    test('non-empty document', () {
      final doc = Document(
        id: '1',
        workspaceId: 'ws1',
        title: 'Hello',
        content: 'World',
        createdAt: DateTime(2024),
        updatedAt: DateTime(2024),
      );
      expect(doc.isEmpty, false);
    });

    test('formatted date', () {
      final doc = Document(
        id: '1',
        workspaceId: 'ws1',
        title: 'Test',
        createdAt: DateTime(2024, 1, 15),
        updatedAt: DateTime(2024, 1, 15),
      );
      expect(doc.formattedDate, contains('Jan'));
    });
  });

  group('Collection entity', () {
    test('creates collection', () {
      final col = Collection(
        id: '1',
        workspaceId: 'ws1',
        name: 'My Collection',
        createdAt: DateTime(2024),
        updatedAt: DateTime(2024),
      );
      expect(col.documentCount, 0);
    });
  });

  group('Tag entity', () {
    test('creates tag', () {
      final tag = Tag(id: '1', workspaceId: 'ws1', name: 'Important');
      expect(tag.name, 'Important');
      expect(tag.documentCount, 0);
    });
  });
}
