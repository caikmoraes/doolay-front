import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:doolay_front/app/shared/widgets/doolay_page_header.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/contact/contact_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ContactPage extends StatefulWidget {
  final String title;

  const ContactPage({Key? key, this.title = 'ContactPage'}) : super(key: key);

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final ContactStore store = Modular.get();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double containerWidth = width * .8;

    return Scaffold(
      key: scaffoldKey,
      appBar: doolayMenu(scaffoldKey, context),
      drawer: doolayDrawer(scaffoldKey, context),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: containerWidth,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DoolayPageHeader(text: "Contato"),
                if (ResponsiveTool.isSmallScreen(context)) ...[
                  const SizedBox(height: 16),
                  ContactAddress(width: containerWidth),
                  const SizedBox(height: 16),
                  DoolayLocationMap(width: containerWidth),
                ] else ...[
                  Row(
                    children: [
                      const SizedBox(height: 16),
                      const Expanded(
                        child: ContactAddress(),
                      ),
                      const SizedBox(width: 8),
                      DoolayLocationMap(width: containerWidth / 2),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoolayLocationMap extends StatelessWidget {
  final double width;

  const DoolayLocationMap({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Html(
        data:
            '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.569055353594!2d-46.65285158544196!3d-23.547997366982923!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce584992d1355b%3A0x2619a4227c175a85!2sUniversidade%20Presbiteriana%20Mackenzie!5e0!3m2!1spt-BR!2sbr!4v1636416259428!5m2!1spt-BR!2sbr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
      ),
    );
  }
}

class ContactAddress extends StatelessWidget {
  final double? width;

  const ContactAddress({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Center(
            child: Text(
              "Universidade Presbiteriana Mackenzie",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text("R. da Consolação, 930"),
          Text("Consolação, São Paulo - SP"),
          Text("01302-907"),
          Text("(11) 2114-8000"),
        ],
      ),
    );
  }
}