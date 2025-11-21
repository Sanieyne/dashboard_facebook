import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      toolbarHeight: 70,

      title: Stack(
  alignment: Alignment.center,
  children: [
    // LEFT — LOGO
    Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          "Fleet Stack",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[800],
          ),
        ),
      ),
    ),

    // CENTER — SEARCH FIELD (PERFECT CENTER)
    Container(
      width: 300,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.grey, size: 25),
          SizedBox(width: 1),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search orders, customers, devices",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14)
              ),
            ),
          ),
        ],
      ),
    ),

   Align(
  alignment: Alignment.centerRight,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // 🌐 LANGUAGE SELECTOR
      _roundedItem(
        radius: 15, // custom
        child: Row(
          children: [
            const Icon(Icons.language, size: 22, color: Colors.blueGrey),
            const SizedBox(width: 6),
            const Text(
              "US",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(width: 4),
          ],
        ),
      ),

      const SizedBox(width: 12),

      // 🔔 NOTIFICATION (FILLED) WITH BADGE
      Stack(
        clipBehavior: Clip.none,
        children: [
          _roundedItem(
            radius: 16,
            child: const Icon(Icons.notifications, size: 24, color: Colors.blueGrey),
          ),

          Positioned(
            right: -2,
            top: -2,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),

      const SizedBox(width: 12),

      // ☀️ LIGHT MODE TOGGLE
      _roundedItem(
        radius: 20,
        child: const Icon(Icons.wb_sunny, size: 24, color: Colors.blueGrey),
      ),

      const SizedBox(width: 12),

      // 👤 PROFILE AREA
      _roundedItem(
        radius: 15,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            const Icon(Icons.person, size: 26, color: Colors.blueGrey),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Loading...",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "loading...",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 4,)
              ],
            )
          ],
        ),
      ),

      const SizedBox(width: 10),
    ],
  ),
)

  ],
),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

Widget _roundedItem({
  required Widget child,
  EdgeInsets? padding,
  double radius = 30, // DEFAULT BUT CAN BE OVERRIDDEN
}) {
  return Container(
    padding: padding ?? const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: child,
  );
}
