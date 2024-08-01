import 'package:admin_events/features/qr_scanner/domain/entities/qr_data.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/guest_repository.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/qr_repository.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/bloc/scanner_bloc.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/widgets/guest_form.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/widgets/qr_scanner.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScannerBloc>(
      create: (_) => ScannerBloc(context.read<QRRepository>(), context.read<GuestRepository>())
        ..add(const ScannerEvent.subscriptionRequested()),
      child: const ScannerView(),
    );
  }
}

class ScannerView extends StatelessWidget {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: BlocSelector<ScannerBloc, ScannerState, bool>(
                selector: (state) => state.scannerOpened,
                builder: (context, opened) {
                  if (!opened) return const SizedBox.shrink();
                  return const QRScanner();
                }),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: BlocSelector<ScannerBloc, ScannerState, bool>(
                selector: (state) => state.scannerOpened,
                builder: (context, opened) {
                  if (opened) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () => context.read<ScannerBloc>().add(const ScannerEvent.openRequested()),
                      child: const Text('Открыть'),
                    ),
                  );
                }),
          ),
          
          BlocListener<ScannerBloc, ScannerState>(
            listener: (context, state) {
              if (state.qrData is! QRDataInitial) {
                showModalBottomSheet(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<ScannerBloc>(context),
                      child: const GuestForm(),
                    )
                );
              }
            },
            child: const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
