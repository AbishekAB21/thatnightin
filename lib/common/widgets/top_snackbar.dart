import 'package:flutter/material.dart';

class TopSnackbar {
  void showTopSnackbar(
    String message,
    BuildContext context,
    Color color,
    TextStyle font, {
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return _TopSnackBarWidget(
          message: message,
          duration: duration,
          color: color,
          font: font,
          onDismissed: () => overlayEntry.remove(),
        );
      },
    );

    overlay.insert(overlayEntry);
  }
}

class _TopSnackBarWidget extends StatefulWidget {
  final String message;
  final Duration duration;
  final VoidCallback onDismissed;
  final Color color;
  final TextStyle font;

  const _TopSnackBarWidget({
    Key? key,
    required this.message,
    required this.duration,
    required this.onDismissed,
    required this.color,
    required this.font,
  }) : super(key: key);

  @override
  State<_TopSnackBarWidget> createState() => _TopSnackBarWidgetState();
}

class _TopSnackBarWidgetState extends State<_TopSnackBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(widget.duration, () {
      _controller.reverse().then((_) => widget.onDismissed());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _animation,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(10.0),
          color: widget.color,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(widget.message, style: widget.font),
          ),
        ),
      ),
    );
  }
}
