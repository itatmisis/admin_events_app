import 'dart:typed_data';

class DeferredImage {
  final Future<Uint8List> Function() _loader;

  const DeferredImage(this._loader);

  Future<Uint8List> load() async {
    return await _loader();
  }
}