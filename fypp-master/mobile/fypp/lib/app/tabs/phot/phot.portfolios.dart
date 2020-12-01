import 'package:flutter/material.dart';
import 'package:fypp/app/controllers/portfolio.controller.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/portfolio.dart';

class PhotPortfolios extends StatefulWidget {
  final Photographer phot;
  PhotPortfolios({Key key, this.phot}) : super(key: key);

  @override
  _PhotPortfoliosState createState() => _PhotPortfoliosState();
}

class _PhotPortfoliosState extends State<PhotPortfolios> {
  PortfolioController controller = PortfolioController();
  List<Portfolio> portfolios = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      portfolios = widget.phot.portfolios;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 600,
          child: FutureBuilder(
              future: controller.getPortfoliosByPhotographer(widget.phot.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Text(portfolios[index].name);
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
