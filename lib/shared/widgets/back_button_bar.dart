import 'package:flutter/material.dart';

class BackButtonBar extends StatelessWidget {
  const BackButtonBar(
      {super.key, required this.onPressed, required this.title});

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              spacing: 20,
              children: [
                Image.asset(
                  'assets/images/back-icon.png',
                  scale: 2,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.shadow,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            thickness: 1,
            height: 1,
          ),
        ],
      ),
    );
  }
}
