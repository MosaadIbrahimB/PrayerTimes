import 'dart:io';

void main() {
  // ملف المصدر الذي يحتوي على جميع الكلاسات
  const String sourceFile = 'source.dart';

  // قراءة محتوى الملف
  final file = File(sourceFile);
  if (!file.existsSync()) {
    print('⚠️ الملف $sourceFile غير موجود!');
    return;
  }

  final content = file.readAsStringSync();

  // البحث عن كل الكلاسات في الملف
  final classRegex = RegExp(r'class (\w+) .*?\{([\s\S]*?)\n\}', multiLine: true);
  final matches = classRegex.allMatches(content);

  // إنشاء ملفات منفصلة لكل كلاس
  for (final match in matches) {
    final className = match.group(1)!;
    final classContent = match.group(0)!;

    // اسم الملف بنفس اسم الكلاس
    final fileName = '${className}.dart';
    final newFile = File(fileName);

    // كتابة المحتوى إلى الملف الجديد
    newFile.writeAsStringSync('''
import 'package:equatable/equatable.dart';

$classContent
''');

    print('✅ تم إنشاء الملف: $fileName');
  }
}
