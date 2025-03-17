import 'package:flutter/material.dart';

import '../../../core/core.dart';

Future<void> showDialogSelected({
  required BuildContext context,
  required VoidCallback onTapGalery,
  required VoidCallback onTapCamera,
}) =>
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'Selecciona una opción para subir tu foto.',
          style: ComTextStyle.body2.black500,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                onTap: onTapGalery,
                child: Text('Galería'),
              ),
              gap8,
              GestureDetector(
                onTap: onTapCamera,
                child: Text('Camara'),
              )
            ],
          ),
        ),
      ),
    );
