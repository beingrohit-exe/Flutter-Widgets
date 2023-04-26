import 'package:flutter/material.dart';
import 'package:inforing_app/Common/ExpandableActionButton.dart';

import 'package:inforing_app/Utils/Dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];
  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black87,
      child: Align(
        alignment: Alignment.center,
        child: ExpandableFab(
          distance: 60.0,
          children: [
            ActionButton(
              onPressed: () => _showAction(context, 0),
              icon: const Icon(Icons.format_size),
            ),
            ActionButton(
              onPressed: () => _showAction(context, 1),
              icon: const Icon(Icons.insert_photo),
            ),
            ActionButton(
              onPressed: () => _showAction(context, 2),
              icon: const Icon(Icons.videocam),
            ),
          ],
        ),
      ),
    );
  }
}
