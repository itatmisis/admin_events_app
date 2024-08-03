part of 'qr_scanner.dart';

// MIT License
//
// Copyright (c) 2023 Gabriel de Matos
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

class CameraClipper extends CustomClipper<Path> {
  final double sizeRect;

  CameraClipper({required this.sizeRect});

  @override
  Path getClip(Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);

    final double left = center.dx - (sizeRect / 2);
    final double top = center.dy - (sizeRect / 2);

    final Rect rect = Rect.fromLTRB(left, top, left + sizeRect, top + sizeRect);

    final Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(rect)
      ..fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TargetCamera extends StatelessWidget {
  final Color? color;

  const TargetCamera({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: _shape(),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Transform.rotate(
            angle: pi / 2,
            child: _shape(),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Transform.rotate(
            angle: -pi / 2,
            child: _shape(),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Transform.rotate(
            angle: -pi / 1,
            child: _shape(),
          ),
        ),
      ],
    );
  }

  Widget _shape() {
    return SizedBox(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: LShapePainter(color),
      ),
    );
  }
}

class LShapePainter extends CustomPainter {
  final Color? color;

  LShapePainter(this.color);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.white
      ..strokeWidth = 8;

    canvas.drawLine(const Offset(0, -1), Offset(0, size.height), paint);
    canvas.drawLine(const Offset(-4, 0), Offset(size.width, 0), paint);
  }
}