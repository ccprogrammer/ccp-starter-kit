import 'package:ccp_starter/example/ui/components/image/custom_image_builder.dart';
import 'package:ccp_starter/example/ui/components/image/example_image_view.dart';
import 'package:ccp_starter/example/ui/components/loading/example_custom_loading.dart';
import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';

class ExampleCustomHtml extends StatelessWidget {
  const ExampleCustomHtml({super.key, this.htmlData});
  final dynamic htmlData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Html(
        data: htmlData,
        shrinkWrap: true,
        style: {
          "body": Style(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
          ),
          "p": Style(
            fontSize: FontSize(14.sp),
            letterSpacing: 0.5.w,
            wordSpacing: 1.2.w,
            textAlign: TextAlign.justify,
            color: colorWhite,
          ),
          "strong": Style(
            // fontSize: FontSize(14.sp),
            // letterSpacing: 0.5.w,
            // wordSpacing: 1.2.w,
            color: colorWhite,
          ),
        },
        customRender: {
          "img": (renderContext, parsedChild) {
            String imageUrl = renderContext.tree.attributes['src']!;
            return GestureDetector(
              onTap: () => Get.to(() => ExampleImageView(
                    data: imageUrl,
                  )),
              child: Hero(
                tag: imageUrl,
                child: ExampleCustomImageBuilder(
                  placeHolder: const ExampleCustomLoading(),
                  errorWidget: Center(
                    child: Icon(
                      Icons.error,
                      color: colorWhite,
                      size: 32.w,
                    ),
                  ),
                  imageUrl: imageUrl,
                  child: (imageProvider) {
                    return Image(image: imageProvider);
                  },
                ),
              ),
            );
          },
        },
        customImageRenders: {
          assetUriMatcher(): assetImageRender(),
          networkSourceMatcher(extension: "svg"): svgNetworkImageRender(),
          networkSourceMatcher(): networkImageRender(
            loadingWidget: () => const ExampleCustomLoading(),
          ),
        },
        onImageTap: (url, context, imageObject, element) =>
            Get.to(() => ExampleImageView(
                  data: imageObject['src'],
                )),
        onLinkTap: (url, context, attributes, element) async {
          //  await Helper.launchURL(url);
          await launchUrl(Uri.parse(url!));
        },
      ),
    );
  }
}
