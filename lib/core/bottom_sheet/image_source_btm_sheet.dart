import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceBtmSheet extends StatelessWidget {
  const ImageSourceBtmSheet();
  static const contentPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 0);
  static const margin = EdgeInsets.symmetric(vertical: 2);
  static const textStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 20),
            child: Row(
              children: [
                const Expanded(
                    child: Text('Select video from',
                        style: TextStyle(fontSize: 18))),
                IconButton(
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.grey,
                    ),
                    splashRadius: 1,
                    onPressed: () => Navigator.pop(context))
              ],
            ),
          ),
          Padding(
            padding: margin,
            child: ListTile(
              title: const Text(
                'Camera',
                style: textStyle,
              ),
              contentPadding: contentPadding,
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ),
          Padding(
            padding: margin,
            child: ListTile(
              title: const Text('Gallery', style: textStyle),
              contentPadding: contentPadding,
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ),
        ],
      ),
    );
  }
}
