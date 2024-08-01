import 'package:admin_events/features/qr_scanner/domain/entities/qr_data.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/bloc/scanner_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestForm extends StatelessWidget {
  const GuestForm({super.key});

  @override
  Widget build(BuildContext context) {
    final qrData = context.select((ScannerBloc bloc) => bloc.state.qrData);

    if (qrData is QRDataInvalid ) {
      return Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text('QR-код невалиден'),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () => context.read<ScannerBloc>().add(const ScannerEvent.invalidGuestRejected()),
                child: const Text('Закрыть'),

              ),
            )
          )
        ],
      );
    }

    if (qrData is QRDataValid) {
      return Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: FutureBuilder(
                future: qrData.guest.photoData(),
                builder: (context, data) {
                  if (data.hasData) {
                    return Image.memory(data.requireData);
                  }

                  return const SizedBox.shrink();
                }
            ),
          ),

          Text(qrData.guest.name),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => context.read<ScannerBloc>().add(const ScannerEvent.guestRejected()),
                  child: const Text('Отклонить')
              ),
              const SizedBox(width: 20,),
              ElevatedButton(
                  onPressed: () => context.read<ScannerBloc>().add(const ScannerEvent.guestApproved()),
                  child: const Text('Одобрить')
              ),
            ],
          )
        ],
      );
    }

    context.router.popForced();
    return const SizedBox.shrink();
  }
}
