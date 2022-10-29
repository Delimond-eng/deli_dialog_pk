library deli_dialog_pk;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DeliDialog {
  static show(BuildContext context, {String message, Function onValidated}) {
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black38,
      context: context,
      builder: (
        BuildContext context,
      ) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10.0,
          ),
          backgroundColor: Colors.transparent,
          //this right here
          child: Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Confirmation",
                        style: GoogleFonts.didactGothic(
                          color: Colors.black87,
                          fontWeight: FontWeight.w800,
                          fontSize: 22.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.didactGothic(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Btn(
                        color: Colors.white,
                        height: 45.0,
                        isOutlined: true,
                        label: 'Non',
                        labelColor: Colors.black,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: Btn(
                        color: Colors.indigo,
                        height: 45.0,
                        label: 'Oui',
                        labelColor: Colors.black,
                        onPressed: () {
                          Get.back();
                          Future.delayed(const Duration(milliseconds: 100));
                          onValidated();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static showMessage(BuildContext context,
      {String message,
      String type = "",
      Duration duration,
      bool repeat = false}) {
    String lottiesPath = "";
    switch (type) {
      case "success":
        lottiesPath = "assets/lotties/success_1.json";
        break;
      case "warning":
        lottiesPath = "assets/lotties/warning.json";
        break;
      case "error":
        lottiesPath = "assets/lotties/error.json";
        break;
      case "connection-error":
        lottiesPath = "assets/lotties/no-connection.json";
        break;
      default:
        lottiesPath = "assets/lotties/success_1.json";
    }
    showDialog(
      barrierColor: Colors.black38,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10.0,
          ),
          backgroundColor: Colors.transparent,
          //this right here
          child: Container(
            height: 160.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Lottie.asset(
                          lottiesPath,
                          repeat: repeat,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.didactGothic(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    Future.delayed(duration ?? const Duration(seconds: 5), () {
      Get.back();
    });
  }
}

class Btn extends StatelessWidget {
  final Color color;
  final bool isOutlined;
  final String label;
  final Color labelColor;
  final Function onPressed;
  final double height;

  const Btn({
    Key key,
    this.color,
    this.isOutlined = false,
    this.label,
    this.onPressed,
    this.labelColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 55.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color ?? Colors.indigo,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: isOutlined ? Colors.indigo : Colors.transparent,
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: GoogleFonts.didactGothic(
                  color: labelColor ?? Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
