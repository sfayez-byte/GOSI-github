import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_source_btm_sheet.dart';

class ShowBottomSheet {
  final BuildContext context;

  const ShowBottomSheet(this.context);

  Future<ImageSource?> selectImageSource() {
    return showModalBottomSheet<ImageSource?>(
        context: context,
        backgroundColor: Colors.white,
        // isScrollControlled: true,
        // enableDrag: true,
        // elevation: 0,
        builder: (sheetCtx) => const ImageSourceBtmSheet());
  }
}
