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
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => context.read<ScannerBloc>().add(const ScannerEvent.invalidGuestRejected()),
                  child: const Text('Закрыть'),

                ),
              )
            )
          )
        ],
      );
    }

    if (qrData is QRDataValid) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
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
                  SizedBox(height: 20,),
                  Text(qrData.guest.name),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () => context.read<ScannerBloc>().add(const ScannerEvent.guestRejected()),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          child: const Text('Отклонить')
                      ),
                    )
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () => context.read<ScannerBloc>().add(const ScannerEvent.guestApproved()),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                          child: const Text('Одобрить')
                      ),
                    )
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    context.router.popForced();
    return const SizedBox.shrink();
  }
}
