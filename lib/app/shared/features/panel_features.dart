import 'package:flutter/material.dart';

class PanelFeatures {
  final String description;
  final IconData icon;

  PanelFeatures(
    this.description,
    this.icon,
  );
}

List<PanelFeatures> getPanelFeatures(BuildContext context) => [
      PanelFeatures(
        'Estado de Saúde',
        Icons.add,
      ),
      PanelFeatures(
        'Histórico de Registros',
        Icons.history,
      ),
      PanelFeatures(
        'Histórico de Registros',
        Icons.history,
      ),
      PanelFeatures(
        'Histórico de Registros',
        Icons.history,
      ),
      PanelFeatures(
        'Histórico de Registros',
        Icons.history,
      ),
      PanelFeatures(
        'Histórico de Registros',
        Icons.history,
      ),
      PanelFeatures(
        'Histórico de Registros',
        Icons.history,
      ),
      PanelFeatures(
        'Histórico de Registros',
        Icons.history,
      ),
    ];
