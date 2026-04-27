import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/ai_chat_session.dart';
import '../../presentation/controller/data/model/message_model.dart';

class AIChatStorage {
  static const _sessionsKey = 'ai_chat_sessions_v1';

  static Future<List<AIChatSession>> loadSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_sessionsKey);
    if (raw == null || raw.trim().isEmpty) return [];

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];

      final sessions = <AIChatSession>[];
      for (final item in decoded) {
        if (item is Map) {
          sessions.add(AIChatSession.fromJson(item.cast<String, dynamic>()));
        }
      }
      sessions.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return sessions;
    } catch (_) {
      return [];
    }
  }

  static Future<AIChatSession?> loadSession(String sessionId) async {
    final sessions = await loadSessions();
    try {
      return sessions.firstWhere((s) => s.id == sessionId);
    } catch (_) {
      return null;
    }
  }

  static Future<String> createEmptySession() async {
    final now = DateTime.now();
    final session = AIChatSession(
      id: now.millisecondsSinceEpoch.toString(),
      createdAt: now,
      updatedAt: now,
      messages: const <Message>[],
    );
    final sessions = await loadSessions();
    final updated = [session, ...sessions];
    await _saveAll(updated);
    return session.id;
  }

  static Future<void> upsertSession({
    required String sessionId,
    required List<Message> messages,
  }) async {
    final sessions = await loadSessions();
    final now = DateTime.now();

    final idx = sessions.indexWhere((s) => s.id == sessionId);
    final next = AIChatSession(
      id: sessionId,
      createdAt: idx >= 0 ? sessions[idx].createdAt : now,
      updatedAt: now,
      messages: messages,
    );

    final updated = <AIChatSession>[
      next,
      ...sessions.where((s) => s.id != sessionId),
    ];
    await _saveAll(updated);
  }

  static Future<void> deleteSession(String sessionId) async {
    final sessions = await loadSessions();
    final updated = sessions.where((s) => s.id != sessionId).toList();
    await _saveAll(updated);
  }

  static Future<void> _saveAll(List<AIChatSession> sessions) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(sessions.map((s) => s.toJson()).toList());
    await prefs.setString(_sessionsKey, raw);
  }
}

