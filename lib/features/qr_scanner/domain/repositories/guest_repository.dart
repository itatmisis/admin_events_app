import 'package:admin_events/features/qr_scanner/domain/entities/guest.dart';

enum GuestRequestStatus {success, failure}

abstract class GuestRepository {
  Future<GuestRequestStatus> accept(Guest guest);
  Future<GuestRequestStatus> decline(Guest guest);
}