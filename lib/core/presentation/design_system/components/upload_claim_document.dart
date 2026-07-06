import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/helper/dashed_border_painter.dart';
import '../theme/helper/extention_colors.dart';
import '../theme/helper/theme_extention.dart';

class UploadClaimDocument extends StatefulWidget {
  final Function(File?) onFilePicked;
  const UploadClaimDocument({super.key, required this.onFilePicked});

  @override
  State<UploadClaimDocument> createState() => _UploadClaimDocumentState();
}

class _UploadClaimDocumentState extends State<UploadClaimDocument> {
  File? pickedFile;

  bool isLoading = false;
  double uploadProgress = 0.0;
  bool _isCanceled = false;
  void pickFile() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );
    if (result != null) {
      if (!mounted) return;
      setState(() {
        _isCanceled = false;
        isLoading = true;
        uploadProgress = 0.0;
      });
      for (int i = 0; i <= 10; i++) {
        if (_isCanceled || !mounted) return;
        await Future.delayed(Duration(milliseconds: 100));

        setState(() {
          uploadProgress = i / 10;
        });
      }
      if (!mounted) return;
      setState(() {
        pickedFile = File(result.files.single.path!);
        isLoading = false;
      });
      widget.onFilePicked(pickedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = context.colors;
    final textTheme = context.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: color.purple50,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: pickedFile == null ? pickFile : null,

          borderRadius: BorderRadius.circular(8),
          splashColor: color.purple200.withValues(alpha: 0.3),
          highlightColor: color.purple100.withValues(alpha: 0.1),
          child: CustomPaint(
            painter: DashedBorderPainter(
              color: color.purple300,
              borderRadius: 8,
            ),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: isLoading
                  ? buildLoadingState(color, textTheme)
                  : pickedFile != null
                  ? buildPickedFileOrImage(
                      pickedFile!,
                      color,
                      textTheme,
                      isImage(pickedFile!.path),
                    )
                  : buildDefaultPreview(color, textTheme),
            ),
          ),
        ),
      ),
    );
  }

  bool isImage(String path) {
    final fileType = path.toLowerCase();
    return fileType.endsWith('.jpg') ||
        fileType.endsWith('.jpeg') ||
        fileType.endsWith('.png');
  }

  void _clearSelection() {
    setState(() {
      pickedFile = null;
      isLoading = false;
      _isCanceled = true;
      uploadProgress = 0.0;
    });
    widget.onFilePicked(null);
  }

  Widget buildDefaultPreview(dynamic color, dynamic textTheme) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 115),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: color.purple200,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: color.purple100, width: 4),
              ),
              child: Icon(
                Iconsax.paperclip_24,
                color: color.purple500,
                size: 12,
              ),
            ),

            const SizedBox(height: 10),
            Text(
              "upload_claim_document".tr(),
              style: textTheme.labelLargeFont.copyWith(
                color: color.purple500,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "format".tr(),
              style: textTheme.labelSmallFont.copyWith(
                color: color.gray500,
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPickedFileOrImage(
    File file,
    dynamic color,
    dynamic textTheme,
    bool isImage,
  ) {
    String fileName = file.path.split('/').last;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 115),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 54),
            child: Row(
              children: [
                Icon(
                  isImage ? Iconsax.image5 : Iconsax.document_text5,
                  color: color.purple500,
                  size: 30,
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    fileName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMediumFont.copyWith(
                      color: color.purple500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: .center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => _clearSelection(),
                padding: EdgeInsets.all(4),
                constraints: BoxConstraints(),
                icon: Icon(Iconsax.close_square5, color: color.apiError),
              ),

              if (isImage) ...[
                SizedBox(height: 8),
                IconButton(
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.all(4),
                  onPressed: () => _showFullScreenImage(context, file),
                  icon: Icon(Iconsax.eye, color: color.purple500),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLoadingState(dynamic color, dynamic textTheme) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          height: 115,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      value: uploadProgress,
                      strokeWidth: 3,
                      color: color.purple200,
                      backgroundColor: color.purple100,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        color.purple500,
                      ),
                    ),
                  ),
                  Text(
                    "${(uploadProgress * 100).toInt()}%",
                    style: textTheme.bodySmallFont.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color.purple500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Text(
                "Uploading File",
                style: textTheme.labelMediumFont.copyWith(
                  color: color.purple500,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => _clearSelection(),
          icon: Icon(Iconsax.close_square5, color: color.apiError),
        ),
      ],
    );
  }

  void _showFullScreenImage(BuildContext context, File file) {
    final color = context.colors;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: ExtensionColors.transparentColor,
          insetPadding: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              InteractiveViewer(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(file, fit: BoxFit.contain),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Iconsax.close_square5, color: color.error),
              ),
            ],
          ),
        );
      },
    );
  }
}
