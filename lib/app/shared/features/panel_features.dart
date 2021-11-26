import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

List<Features> getMemberFeatures() => [
      Features(
        'Estado de Saúde',
        Icons.add,
        route: './health/',
      ),
      Features(
        'Histórico de Registros',
        Icons.history,
        route: '/history/',
      ),
    ];

List<Features> getGestorFeatures() => [
      Features(
        'Estado de Saúde',
        Icons.add,
        route: './health/',
      ),
      Features(
        'Histórico de Registros',
        Icons.history,
        route: './history/',
      ),
      Features(
        'Emitir Relatório',
        Icons.description,
        route: './history/',
      ),
    ];

List<Features> getAdmFeatures() => [
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
        'Editar Sintomas',
        Icons.edit,
        route: './symptoms/',
      ),
      Features(
        'Histórico de Registros',
        Icons.history,
        route: './history/',
      ),
      Features(
        'Emitir Relatório',
        Icons.description,
        route: './history/',
      ),
    ];
