import 'package:admin_events/features/qr_scanner/domain/entities/qr_data.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/bloc/scanner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';

class QRScanner extends StatelessWidget {
  const QRScanner({super.key});

  @override
  Widget build(BuildContext context) {
    var failure = context.select((ScannerBloc bloc) => bloc.state.failure);

    return Column(
      key: const Key('scannerPage_qr_FlutterWebQrcodeScanner'),
      mainAxisSize: MainAxisSize.min,
      children: [
        _QRScannerImplementation(),
        const Padding(padding: EdgeInsets.all(15)),

        if (failure)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Ошибка доступа к камере! Разрешите доступ к камере в настройках браузера и нажмите кнопку'),
              ElevatedButton(
                  onPressed: () => context.read<ScannerBloc>().add(const ScannerEvent.closeRequested()),
                  child: const Text('Повторить попытку')
              )
            ],
          )
      ],
    );
  }
}

class _QRScannerImplementation extends StatefulWidget {
  @override
  State<_QRScannerImplementation> createState() => _QRScannerImplementationState();
}

class _QRScannerImplementationState extends State<_QRScannerImplementation> {
  final CameraController _controller = CameraController(autoPlay: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 80;

    return BlocListener<ScannerBloc, ScannerState>(
      listener: (context, state) {
        if (state.qrData is QRDataInitial) {
          _controller.startVideoStream();
        }
      },
      child: SizedBox(
        width: width,
        height: width,
        child: FlutterWebQrcodeScanner(
          cameraDirection: CameraDirection.back,
          controller: _controller,
          stopOnFirstResult: true,
          onGetResult: (result) =>
              context.read<ScannerBloc>().add(ScannerEvent.scanned(data: result)),
          onError: (_) => context.read<ScannerBloc>().add(
              const ScannerEvent.initializedFailed()),
          onPermissionDeniedError: () => context.read<ScannerBloc>().add(
              const ScannerEvent.initializedFailed()),
          width: width,
          height: width,
        ),
      ),
    );
  }
}