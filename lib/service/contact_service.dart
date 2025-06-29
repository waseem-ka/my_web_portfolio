import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendToTelegram({
  required String email,
  required String name,
  required String message,
}) async {
  const String botToken = '7880614284:AAF22OFo-52rz3yQrKVoTH1Y1ewSs_njyD4';
  const String chatId = '5182547300';

  final String telegramApiUrl =
      'https://api.telegram.org/bot$botToken/sendMessage';

  final String text =
      '📩 *New Message Received*\n'
      '📌 *Name:* $name\n'
      '✉️ *Email:* $email\n'
      '📝 *Message:* $message';

  try {
    final response = await http.post(
      Uri.parse(telegramApiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'chat_id': chatId,
        'text': text,
        'parse_mode': 'Markdown', // عشان يكون النص مرتب
      }),
    );

    if (response.statusCode == 200) {
      print('✅ Message sent successfully!');
    } else {
      print('❌ Failed to send message: ${response.body}');
    }
  } catch (e) {
    print('❌ Error sending message: $e');
  }
}
