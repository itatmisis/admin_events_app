import 'package:admin_events/features/qr_scanner/domain/entities/qr_data.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/bloc/scanner_bloc.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/widgets/guest_form.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/widgets/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
                  if (!opened) {
                    return const _InstructionText();
                  }
                  return const QRScanner();
                }),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: BlocSelector<ScannerBloc, ScannerState, bool>(
                selector: (state) => state.scannerOpened,
                builder: (context, opened) {
                  if (opened) return const SizedBox.shrink();
                  return const _StartButton();
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

class _StartButton extends StatelessWidget {
  const _StartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () => context.read<ScannerBloc>().add(const ScannerEvent.openRequested()),
            child: const Text('Начать работу'),
          ),
        )
    );
  }
}

class _InstructionText extends StatelessWidget {
  const _InstructionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Инструкция\n',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,),
            Text(
                '1. Начни работу\n'
                    '2. Разреши доступ к камере\n'
                    '3. Отсканируй QR-код гостя\n'
                    '4. Сверь данные с системой\n'
                    '5. Разреши проход',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodySmall
            )
          ],
        )
    );
  }
}
