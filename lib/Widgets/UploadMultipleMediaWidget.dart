import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:image_picker/image_picker.dart';
import '../Repo/ColorRepo.dart';
import 'MediaCarouselWidget.dart';

class UploadMultipleMediaWidget extends StatefulWidget {
  const UploadMultipleMediaWidget({super.key});

  @override
  State<UploadMultipleMediaWidget> createState() => _UploadMultipleMediaWidgetState();
}

class _UploadMultipleMediaWidgetState extends State<UploadMultipleMediaWidget> {
  List<String> images = [];

  Future<void> _uploadItem() async {
    if(images.length <= 4){
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          images.add(image.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: images.isNotEmpty
          ? SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MediaCarouselLiteWidget(images: images, function: _uploadItem),
            images.length > 4 ? const SizedBox() : GestureDetector(
              onTap: _uploadItem,
              child: const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(
                  PhosphorIcons.plus_circle,
                  color: ColorRepo.muted2,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      )
          : GestureDetector(
        onTap: _uploadItem,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    PhosphorIcons.upload,
                    color: ColorRepo.dark,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add photo or video',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.dark,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Click to add upload',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 11,
                        color: ColorRepo.muted,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              PhosphorIcons.caret_right,
              color: ColorRepo.dark,
            ),
          ],
        ),
      ),
    );
  }
}
