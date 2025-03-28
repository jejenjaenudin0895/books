import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {
  const NavigationDialog({super.key});

  @override
  State<NavigationDialog> createState() => _NavigationDialogState();
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color color = Colors.yellowAccent.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigator Dialog Screen jejen'),

      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Change Color'),
            onPressed: () {
              _showColorDialog(context);
            }
        ),

      ),
    );
  }

  _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,

      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very Important Question'),
          content: const Text('Please choose a color'),
          actions: [
            TextButton(child: const Text('Brown'),
                onPressed: () {
                  color = Colors.brown.shade700;
                  Navigator.pop(context, color);
                }),
            TextButton(child: const Text ('Purple'),
                onPressed: () {
                  color = Colors.purpleAccent.shade700;
                  Navigator.pop(context, color);
                }),
            TextButton(child: const Text ('cyan'),
                onPressed: () {
                  color = Colors.cyanAccent.shade700;
                  Navigator.pop(context, color);
                }),
          ],
        );
      },
    );
    setState(() {});
  }

}