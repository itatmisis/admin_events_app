import 'package:admin_events/features/events/domain/entities/event.dart';
import 'package:admin_events/features/events/domain/repositories/event_repository.dart';
import 'package:admin_events/utilities/deferred_image.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class MockEventRepository implements EventRepository {

  final BehaviorSubject<List<Event>> _events = BehaviorSubject.seeded([]);

  @override
  Stream<List<Event>> getEvents() => _events.asBroadcastStream();

  @override
  Future update() async {
    _events.add([
      Event(id: '1', image: DeferredImage(() async {
        var imageBytes = await rootBundle.load('assets/event.jpg');
        return imageBytes.buffer.asUint8List();
      }),
          title: 'Интенсив в университете Сириус',
          description: '''Готов отправиться в Сочи и стать гуру машинного обучения?
Регистрируйся на новый интенсив по воспроизведению state-of-the-art научных результатов в университете «Сириус»! Программа идеальна для тех, кто хочет углубиться в ML, нейросети и работу с данными.
Тебя ждет:

🔸 Лекции о передовых достижениях в IT
🔸 Обучение моделей, кодинг и тестирование с Yandex DataSphere
🔸 Командные проекты под руководством менторов из Яндекса

Успей подать заявку и пройти тестовое задание до 26 августа — возможно, именно ты будешь учиться в Сириусе и прокачивать свои скиллы на берегу Чёрного моря!

Кстати, всем, кто пройдёт отбор, обучение, проезд, проживание и питание будут оплачены!'''),
      Event(id: '2', image: DeferredImage(() async {
        var imageBytes = await rootBundle.load('assets/event.jpg');
        return imageBytes.buffer.asUint8List();
      }),
          title: 'Лекция по Flutter',
          description: ''),
      Event(id: '3', image: DeferredImage(() async {
        var imageBytes = await rootBundle.load('assets/event.jpg');
        return imageBytes.buffer.asUint8List();
      }),
          title: 'Хакатон-митап, осень 2024',
          description: ''),
      Event(id: '4', image: DeferredImage(() async {
        var imageBytes = await rootBundle.load('assets/event.jpg');
        return imageBytes.buffer.asUint8List();
      }),
          title: 'Дизайн-митап',
          description: ''),
      Event(id: '5', image: DeferredImage(() async {
        var imageBytes = await rootBundle.load('assets/event.jpg');
        return imageBytes.buffer.asUint8List();
      }),
          title: 'Панельная дискуссия, фронтенд',
          description: '')
    ]);
  }

  @override
  Future<Event?> getById(String id) async {
    return _events.value.where((e) => e.id == id).firstOrNull;
  }

}