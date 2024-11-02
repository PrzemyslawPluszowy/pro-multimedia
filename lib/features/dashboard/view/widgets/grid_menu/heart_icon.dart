import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pro_multimedia/core/theme/app_sizes.dart';
import 'package:pro_multimedia/core/theme/static_colors.dart';
import 'package:pro_multimedia/features/dashboard/view/cubit/grid_menu_cubit.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon._({
    required this.uuid,
    required this.icon,
    required this.iconColor,
    this.backgroundColor,
    this.hasBorder = false,
    super.key,
  });

  // Konstruktor fabryczny dla pełnego serca w kolorze głównym
  factory HeartIcon.full(String uuid) {
    return HeartIcon._(
      uuid: uuid,
      icon: Ionicons.heart,
      iconColor: StaticColors.primaryColor,
      hasBorder: true,
      key: ValueKey(uuid), // Unikalny klucz dla każdego elementu
    );
  }

  // Konstruktor fabryczny dla pustego serca
  factory HeartIcon.empty(String uuid) {
    return HeartIcon._(
      uuid: uuid,
      icon: Ionicons.heart_outline,
      iconColor: Colors.white,
      backgroundColor: StaticColors.white40Color,
      key: ValueKey(uuid),
    );
  }

  // Konstruktor fabryczny dla serca wypełnionego w połowie
  factory HeartIcon.half(String uuid) {
    return HeartIcon._(
      uuid: uuid,
      icon: Ionicons.heart,
      iconColor: Colors.white,
      backgroundColor: StaticColors.white40Color,
      hasBorder: true,
      key: ValueKey(uuid),
    );
  }

  static const double _iconSize = Sizes.p20;
  static const double _containerSize = 30;
  static const double _borderWidth = 2;

  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;
  final bool hasBorder;
  final String uuid;

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final Animation<double> _scaleAnimation = Tween<double>(begin: 1, end: 2)
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Uruchomienie animacji powiększenia i przywrócenia
        _controller.forward().then(
              (_) => _controller.reverse().then(
                    (_) => context
                        .read<GridMenuCubit>()
                        .changeHeartType(widget.uuid),
                  ),
            );
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: HeartIcon._containerSize,
              height: HeartIcon._containerSize,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                shape: BoxShape.circle,
                border: widget.hasBorder
                    ? Border.all(
                        color: StaticColors.white40Color,
                        width: HeartIcon._borderWidth,
                      )
                    : null,
              ),
              child: Center(
                child: Icon(
                  widget.icon,
                  size: HeartIcon._iconSize,
                  color: widget.iconColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
