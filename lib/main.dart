import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color primaryYellow = Color(0xFFFFBF0B);
  static const Color pageBackground = Color(0xFFFFF7FF);
  static const Color lightPurple = Color(0xFFE9DDFF);
  static const Color darkPurple = Color(0xFF2B006F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      appBar: AppBar(
        backgroundColor: primaryYellow,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 20,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 30, color: Color(0xFF4B4B4B)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, size: 28, color: Color(0xFF4B4B4B)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone, size: 27, color: Color(0xFF4B4B4B)),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildProfileCircle(child: const IceCreamIcon()),
              const SizedBox(height: 12),
              const Text(
                'Ice cream is very delicious right?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF292929),
                ),
              ),
              const SizedBox(height: 55),
              _buildProfileCircle(child: const CodeIcon()),
              const SizedBox(height: 12),
              const Text(
                'Programming is not boring if you love it',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF292929),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCircle({required Widget child}) {
    return Container(
      width: 205,
      height: 205,
      decoration: const BoxDecoration(
        color: lightPurple,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class IceCreamIcon extends StatelessWidget {
  const IceCreamIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(105, 110),
      painter: IceCreamPainter(),
    );
  }
}

class IceCreamPainter extends CustomPainter {
  final Color purple = const Color(0xFF2B006F);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scoopPath = Path()
      ..moveTo(18, 58)
      ..cubicTo(8, 58, 3, 50, 7, 42)
      ..cubicTo(10, 35, 17, 32, 25, 34)
      ..cubicTo(27, 21, 38, 13, 52, 13)
      ..cubicTo(67, 13, 78, 22, 80, 35)
      ..cubicTo(89, 33, 97, 38, 100, 46)
      ..cubicTo(103, 55, 96, 62, 87, 62)
      ..cubicTo(81, 62, 77, 59, 74, 55)
      ..cubicTo(69, 60, 63, 63, 53, 63)
      ..cubicTo(44, 63, 37, 60, 32, 55)
      ..cubicTo(29, 59, 24, 62, 18, 58);

    canvas.drawPath(scoopPath, paint);

    final conePath = Path()
      ..moveTo(31, 60)
      ..lineTo(53, 99)
      ..lineTo(75, 60);

    canvas.drawPath(conePath, paint);

    final detailPaint = Paint()
      ..color = purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawLine(const Offset(39, 72), const Offset(67, 72), detailPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CodeIcon extends StatelessWidget {
  const CodeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.code,
      color: Color(0xFF2B006F),
      size: 78,
    );
  }
}
