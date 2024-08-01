import 'package:admin_events/features/qr_scanner/domain/entities/guest.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/guest_repository.dart';

class MockGuestRepository implements GuestRepository {
  @override
  Future<GuestRequestStatus> accept(Guest guest) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return GuestRequestStatus.success;
  }

  @override
  Future<GuestRequestStatus> decline(Guest guest) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return GuestRequestStatus.success;
  }
}