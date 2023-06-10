import 'dart:developer';

import 'package:ccp_starter/example/values/example_color.dart';
import 'package:ccp_starter/example/values/example_textstyle.dart';
import 'package:ccp_starter/example/ui/components/button/example_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  // popup
  static showPopUp({
    String? title,
    String? message,
    Function()? onClose,
  }) {
    return Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        backgroundColor: colorBrown,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Text(
                  title,
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: 18.sp,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (message != null)
                Container(
                  margin: EdgeInsets.only(top: title != null ? 8 : 0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 16.sp,
                      fontWeight: regular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ExampleButton(
                marginTop: 24.h,
                label: 'Tutup',
                onTap: () => onClose != null ? onClose() : Get.back(),
              ),
            ],
          ),
        ),
      ),
    ).then((value) => onClose != null ? onClose() : null);
  }

  static showNotif(
      {dynamic title,
      dynamic message,
      bool isDownload = false,
      bool isError = false}) {
    var titleText = title is String
        ? Container(
            margin: EdgeInsets.only(top: message == null ? 8 : 0),
            child: Text(
              title,
              style: TextStyle(
                color: colorWhite,
                fontSize: 16.sp,
                fontWeight: semiBold,
              ),
            ),
          )
        : title ?? const SizedBox();

    var messageText = message is String
        ? Text(
            message,
            style: TextStyle(
              color: colorWhite.withOpacity(0.8),
              fontSize: 14.sp,
            ),
          )
        : message ?? const SizedBox();

    if (isDownload) {
      titleText = Text(
        'Downloading',
        style: TextStyle(
          color: colorWhite,
          fontSize: 16.sp,
          fontWeight: semiBold,
        ),
      );
      messageText = Padding(
        padding: const EdgeInsets.only(top: 8),
        child: LinearProgressIndicator(
          backgroundColor: colorWhite.withOpacity(0.8),
          color: colorBlue,
        ),
      );
    }

    Get.showSnackbar(
      GetSnackBar(
        titleText: titleText,
        messageText: messageText,
        dismissDirection: DismissDirection.up,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        borderRadius: 12,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor: isError ? colorRed : colorLightBrown,
        boxShadows: const [],
      ),
    );
  }

  // number
  static String formatNumber(double number) {
    if (number >= 1e9) {
      return '${(number / 1e9).toStringAsFixed(1)}B'; // Convert to billions
    } else if (number >= 1e6) {
      return '${(number / 1e6).toStringAsFixed(1)}M'; // Convert to millions
    } else if (number >= 1e3) {
      return '${(number / 1e3).toStringAsFixed(1)}K'; // Convert to thousands
    } else {
      return number.toStringAsFixed(0); // No suffix needed
    }
  }

  // url
  static Future launchThisUrl(url) async {
    Uri dataUrl = Uri.parse(url!);

    if (await canLaunchUrl(dataUrl)) {
      await launchUrl(dataUrl);
    } else {
      throw 'Could not launch $dataUrl';
    }
  }

  static Future launchWhatsApp(
      {required String phone, required String message}) async {
    String urls = 'https://wa.me/$phone?text=$message';

    // ignore: deprecated_member_use
    if (await canLaunch(urls)) {
      // ignore: deprecated_member_use
      await launch(urls);
    } else {
      throw 'Could not launch $urls';
    }
    log('URLS == $urls');
  }

  static Future launchMail(
      {required String email,
      required String subject,
      required String body}) async {
    String thisEmail = Uri.encodeComponent(email);
    String thisSubject = Uri.encodeComponent(subject);
    String thisBody = Uri.encodeComponent(body);

    Uri mail =
        Uri.parse("mailto:$thisEmail?subject=$thisSubject&body=$thisBody");
    if (await launchUrl(mail)) {
      //email app opened
    } else {
      //email app is not opened
    }
  }

  // text
  static String capitalizeWords(String input) {
    // capitalize first letter on every word
    List<String> words = input.split(' ');

    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }

    return words.join(' ');
  }

  // sharing
  static shareLayar(
      {required String title, required int id, bool isVideo = true}) {
    String endpoint = isVideo ? '?video_id=$id' : '/news?id=$id';

    String url = '$title \n https://layar.tvri.go.id/detail$endpoint';

    log('url $url');

    return Share.share(
      url,
      // subject: 'https://web.tvri.katalis.solutions/detail$endpoint',
      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
    );
  }
}
