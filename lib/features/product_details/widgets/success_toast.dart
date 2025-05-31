import 'package:flutter/material.dart';

class SuccessToast extends StatelessWidget {
  final String message;
  const SuccessToast({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 56,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            offset: Offset(0, 16),
            blurRadius: 24,
          ),
        ],
        border: const Border(
          left: BorderSide(
            color: Color(0xFF10B981), // #10B981
            width: 4,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Icon
          Image.asset(
            'assets/images/check-circle.png',
            scale: 2,
          ),

          const SizedBox(width: 16),

          // ✅ Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 20 / 14, // line-height: 20px
                    color: Color(0xFF334155), // #334155
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/close (1).png',
            ),
          ),
        ],
      ),
    );
  }
}
