import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messages {
  static const String successMessage = "Sucesso ao criar";
  static const String errorMessage = "Erro ao criar";
  static const String deleteSuccessMessage = "Deletado com sucesso";
  static const String deleteErrorMessage = "Erro ao deletar";

  static void showSnackbar(String title, String message, IconData icon, Color backgroundColor, Color textColor) {
    Get.snackbar(
      title,
      message,
      icon: Icon(icon, color: textColor),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: textColor,
    );
  }
}
