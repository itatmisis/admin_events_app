import 'package:admin_events/features/qr_scanner/domain/repositories/guest_repository.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/qr_repository.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/bloc/scanner_bloc.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/scanner_view.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ScannerPage extends StatelessWidget {
  final String eventId;

  const ScannerPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScannerBloc>(
      create: (_) => ScannerBloc(context.read<QRRepository>(), context.read<GuestRepository>())
        ..add(ScannerEvent.subscriptionRequested(eventId: eventId)),
      child: const ScannerView(),
    );
  }
}