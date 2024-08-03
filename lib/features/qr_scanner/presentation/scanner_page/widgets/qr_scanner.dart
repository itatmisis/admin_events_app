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

    return  AnimatedSwitcher(
      key: const Key('scannerPage_qr_FlutterWebQrcodeScanner'),
      duration: const Duration(milliseconds: 100),
      child: !failure ?  _QRView() : const _FailureMessage(),
    );
  }
}

class _FailureMessage extends StatelessWidget {
  const _FailureMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Ошибка доступа к камере!',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.red),
                  ),
                  SizedBox(height: 12,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Разреши доступ к камере в настройках браузера и нажми кнопку',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall
                    ),
                  ),
                ],
              ),
            )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  onPressed: () => context.read<ScannerBloc>().add(const ScannerEvent.closeRequested()),
                  child: const Text('Повторить попытку')
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _QRView extends StatelessWidget {
  const _QRView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _QRScannerImplementation(),
        Text('Наведись на QR-код',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
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
    final ThemeData theme = Theme.of(context);
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
          child: Stack(
            children: [
              FlutterWebQrcodeScanner(
                cameraDirection: CameraDirection.back,
                controller: _controller,
                stopOnFirstResult: true,
                onGetResult: (result) =>
                    context.read<ScannerBloc>().add(ScannerEvent.scanned(data: result)),
                onError: (_) => context.read<ScannerBloc>().add(
                    const ScannerEvent.initializedFailed()),
                onPermissionDeniedError: () => context.read<ScannerBloc>().add(
                    const ScannerEvent.initializedFailed()),
                height: width,
              ),

              Align(
                alignment: Alignment.center,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(Color(0xFF06131F), BlendMode.srcOut),
                  child: Container(
                    height: 190,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Color(0xFF06131F),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(theme.scaffoldBackgroundColor, BlendMode.srcOut),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                      ),
                    ),
                ),
              )
            ],
          )
      ),
    );
  }
}