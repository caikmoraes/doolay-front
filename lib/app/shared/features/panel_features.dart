import 'package:flutter/material.dart';

class Features {
  final String description;
  final IconData icon;
  final String? route;

  Features(
    this.description,
    this.icon, {
    this.route,
  });
}

List<Features> getFeatures(BuildContext context) => [
      Features(
        'Cadastro de suário',
        Icons.person_add,
        route: './user/new',
      ),
      Features(
        'Estado de Saúde',
        Icons.add,
        route: './health/',
      ),
      Features(
        'Histórico de Registros',
        Icons.history,
        route: '/',
      ),
    ];
