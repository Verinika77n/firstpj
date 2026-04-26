import 'package:firstpj/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Стартовый экран отображается', (WidgetTester tester) async {
    await tester.pumpWidget(CinemaLibraryApp());

    expect(find.text('Кинотекарь'), findsOneWidget);
  });
}
