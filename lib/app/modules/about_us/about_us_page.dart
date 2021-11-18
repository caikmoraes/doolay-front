import 'dart:ui';
import 'dart:js' as js;

import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:doolay_front/app/shared/widgets/doolay_page_header.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/about_us/about_us_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsPage extends StatefulWidget {
  final String title;

  const AboutUsPage({Key? key, this.title = 'AboutUsPage'}) : super(key: key);

  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  final AboutUsStore store = Modular.get();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .9;
    if(width > 600) width = 600;
    return Scaffold(
      key: scaffoldKey,
      appBar: doolayMenu(scaffoldKey, context),
      drawer: doolayDrawer(scaffoldKey, context),
      body: Column(
        children: [
          const ContributorsWidget(),
          const SizedBox(height: 32),
          const DoolayPageHeader(text: 'Quem somos nós?'),
          const SizedBox(height: 16),
          Container(
            width: width,
            child: const Text(
              'Cursando o 5° Semestre de Sistemas de Informação na UPM (Universidade Presbiteriana Mackenzie), somos um time formado de dois desenvolvedores dois desenvolvedores fullstack, um desenvolvedor back-end e uma desenvolvedore front-end. Focados em desenvolver a melhor experiência para os usuários desta plataforma desenvolvida para nos ajudar nesse momento delicado que estamos vivendo por conta da Covid-19.',
            ),
          ),
        ],
      ),
    );
  }
}

class ContributorsWidget extends StatefulWidget {
  const ContributorsWidget({Key? key}) : super(key: key);

  @override
  State<ContributorsWidget> createState() => _ContributorsWidgetState();
}

class _ContributorsWidgetState extends State<ContributorsWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: _width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [Styles.PRIMARY_COLOR, Color(0xFFFAFAFA)],
            ),
          ),
          child: Center(
            child: Scrollbar(
              controller: scrollController,
              isAlwaysShown: true,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: getContributors()
                      .map(
                        (e) => SingleContributorWidget(
                          name: e.name,
                          srcImage: e.urlImage,
                          github: e.github,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Contributor> getContributors() => [
        Contributor(
          "Caik Moraes",
          'https://avatars.githubusercontent.com/u/47791767?s=400&u=a11d5fd88b27b9d86d54df93c57f5a1b01921207&v=4',
          'https://github.com/caikmoraes',
        ),
        Contributor(
          'Francielly Ortiz',
          'https://avatars.githubusercontent.com/u/59661321?v=4',
          'https://github.com/ortizfrancielly',
        ),
        Contributor(
          'Marcello Cestaro',
          'https://avatars.githubusercontent.com/u/32852416?v=4',
          'https://github.com/marcellorcestaro',
        ),
        Contributor(
          'João Victor',
          'https://avatars.githubusercontent.com/u/55808088?v=4',
          'https://github.com/jvmoraisr6597',
        ),
      ];
}

class SingleContributorWidget extends StatelessWidget {
  final String srcImage;
  final String name;
  final String github;

  const SingleContributorWidget({
    Key? key,
    required this.srcImage,
    required this.name,
    required this.github,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(srcImage),
              ),
            ),
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: SvgPicture.asset(
                  AppConstants.GITHUB_ICON,
                ),
                onTap: () => js.context.callMethod('open', [github]),
              ),
              const SizedBox(width: 8),
              Text(name),
            ],
          ),
        ],
      ),
    );
  }
}

class Contributor {
  final String name;
  final String urlImage;
  final String github;

  Contributor(this.name, this.urlImage, this.github);
}
