import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExampleExpandableText extends StatefulWidget {
  const ExampleExpandableText({
    Key? key,
    required this.text,
    this.trimLines = 2,
    this.style,
    this.colorClickableText = Colors.blue,
  }) : super(key: key);

  final String text;
  final int trimLines;
  final TextStyle? style;
  final Color colorClickableText;

  @override
  ExampleExpandableTextState createState() => ExampleExpandableTextState();
}

class ExampleExpandableTextState extends State<ExampleExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    const widgetColor = Colors.black;
    TextSpan link = TextSpan(
        text: _readMore ? " Show more" : " Show Less",
        style: TextStyle(
          color: widget.colorClickableText,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection
              .rtl, //better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int? endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset);
        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style: widget.style ??
                const TextStyle(
                  color: widgetColor,
                ),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
            style: widget.style,
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}
