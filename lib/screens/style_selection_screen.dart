import 'package:flutter/widgets.dart';

enum AppStyle { material, cupertino }

class StyleSelectionScreen extends StatelessWidget {
  final void Function(AppStyle) onStyleSelected;

  const StyleSelectionScreen({super.key, required this.onStyleSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose Your Style',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _StyleOption(
                  title: 'Material',
                  onTap: () => onStyleSelected(AppStyle.material),
                ),
                const SizedBox(width: 40),
                _StyleOption(
                  title: 'Cupertino',
                  onTap: () => onStyleSelected(AppStyle.cupertino),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StyleOption extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _StyleOption({required this.title, required this.onTap});

  @override
  State<_StyleOption> createState() => _StyleOptionState();
}

class _StyleOptionState extends State<_StyleOption> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF000000)),
          borderRadius: BorderRadius.circular(8),
          color: isPressed ? const Color(0xFFEEEEEE) : const Color(0xFFFFFFFF),
        ),
        child: Text(
          widget.title,
          style: const TextStyle(fontSize: 18, color: Color(0xFF000000)),
        ),
      ),
    );
  }
}
