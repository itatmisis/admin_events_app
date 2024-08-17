import 'package:admin_events/features/events/domain/entities/event.dart';

abstract class EventRepository {
  Stream<List<Event>> getEvents();

  Future update();

  Future<Event?> getById(String id);
}