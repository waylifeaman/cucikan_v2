import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class DotLoading extends StatefulWidget {
  final double size;
  final Color? color;

  const DotLoading({super.key, this.size = 10, this.color});

  @override
  State<DotLoading> createState() => _DotLoadingState();
}

class _DotLoadingState extends State<DotLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? AppColors.primary;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final value = _controller.value;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final active = ((value * 3).floor()) % 3 == index;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: active ? widget.size + 4 : widget.size,
              height: active ? widget.size + 4 : widget.size,
              decoration: BoxDecoration(
                color: active ? color : color.withOpacity(0.25),
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
