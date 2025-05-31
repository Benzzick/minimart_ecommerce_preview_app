import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 13,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            spacing: 13,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    scale: 2,
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      Text(
                        'DELIVERY ADDRESS',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Umuezike Road, Oyo State',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  Image.asset('assets/images/notification-icon.png', scale: 2)
                ],
              ),
              if (child != null) child!,
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          thickness: 2,
          height: 2,
        )
      ],
    );
  }
}
