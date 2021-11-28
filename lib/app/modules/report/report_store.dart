import 'dart:developer';

import 'package:doolay_front/app/modules/report/report_page.dart';
import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'dart:html' as html;


class ReportStore extends NotifierStore<Exception, List<Report>> {
  ReportStore() : super([]);

  List<Report>? getReports() {
    var count = 0;
    update([
      Report(
        id: count++,
        nome: 'Registros Diários',
        enableDate: true,
        onClick: (String dateInit, String dateFin) {
          var url =
              '${AppConstants.BASE_URL}/saude/relatorio/registros_diarios/$dateInit/$dateFin/';
          html.window.open(url, 'Registros Diários');
        },
      ),
      Report(
        id: count++,
        nome: 'Registros Diários (Gráfico)',
        enableDate: true,
        onClick: (String dateInit, String dateFin) {
          var url =
              '${AppConstants.BASE_URL}/saude/relatorio/registros_diarios/$dateInit/$dateFin/plot/';
          html.window.open(url, 'Registros Diários (Gráfico)');
        },
      ),
      Report(
        id: count++,
        nome: 'Registros de saúde NOK',
        enableDate: true,
        onClick: (String dateInit, String dateFin) {
          var url =
              '${AppConstants.BASE_URL}/saude/relatorio/noks/$dateInit/$dateFin/';
          html.window.open(url, 'Registros de saúde NOK');
        },
      ),
      Report(
        id: count++,
        nome: 'Registros de saúde NOK (Gráfico)',
        enableDate: true,
        onClick: (String dateInit, String dateFin) {
          var url =
              '${AppConstants.BASE_URL}/saude/relatorio/noks/$dateInit/$dateFin/plot/';
          html.window.open(url, 'Registros de saúde NOK (Gráfico)');
        },
      ),
      Report(
        id: count++,
        nome: 'Registros de saúde NOK Porcentagem (Gráfico)',
        enableDate: true,
        onClick: (String dateInit, String dateFin) {
          var url =
              '${AppConstants.BASE_URL}/saude/relatorio/noks/$dateInit/$dateFin/plot/percentage';
          html.window.open(url, 'Registros de saúde NOK Porcentagem (Gráfico)');
        },
      ),
      Report(
        id: count++,
        nome: 'Registros Diários por Setor',
        enableDate: true,
        onClick: (String dateInit, String dateFin) {
          var url =
              '${AppConstants.BASE_URL}/saude/relatorio/registros/setor/$dateInit/$dateFin/';
          html.window.open(url, 'Registros Diários por Setor');
        },
      ),
      Report(
        id: count++,
        nome: 'Registros Diários por Setor (Gráfico)',
        enableDate: true,
        onClick: (String dateInit, String dateFin) {
          var url =
              '${AppConstants.BASE_URL}/saude/relatorio/registros/setor/$dateInit/$dateFin/plot';
          html.window.open(url, 'Registros Diários por Setor (Gráfico)');
        },
      ),
      Report(
        id: count++,
        nome: 'Registros NOK Diários por Setor',
        enableDate: true,
        onClick: (String dateInit, String dateFin) {
          var url =
              '${AppConstants.BASE_URL}/saude/relatorio/registros/setor/nok/$dateInit/$dateFin/';
          html.window.open(url, 'Registros NOK Diários por Setor');
        },
      ),
      Report(
        id: count++,
        nome: 'NOK nos últimos 5 dias',
        enableDate: false,
        onClick: (String dateInit, String dateFin) {
          var url =
              '${AppConstants.BASE_URL}/saude/relatorio/noks/';
          html.window.open(url, 'Registros NOK dos últimos 5 dias');
        },
      ),
      Report(
        id: count++,
        nome: 'NOK por Setor nos ultimos 5 dias',
        enableDate: false,
        onClick: (String dateInit, String dateFin) {
          var url =
              '${AppConstants.BASE_URL}/saude/relatorio/noks/';
          html.window.open(url, 'Registros NOK dos últimos 5 dias por setor');
        },
      ),
    ]);
  }
}
