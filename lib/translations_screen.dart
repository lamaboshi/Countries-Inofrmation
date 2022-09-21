import 'package:flutter/material.dart';
import 'package:overlayment/overlayment.dart';

import 'data/model/translations.dart';

class TranslationsScreen extends StatelessWidget {
  TranslationsScreen(this.tran);
  Translations tran;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          OverPanel(
            height: 400,
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Translations',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  text('ara common :', tran.ara!.common!),
                  text('ara official :', tran.ara!.official!),
                  text('bre common :', tran.bre!.common!),
                  text('bre official :', tran.bre!.official!),
                  text('ces common :', tran.ces!.common!),
                  text('ces official :', tran.ces!.official!),
                  text('cym common :', tran.cym!.common!),
                  text('cym official :', tran.cym!.official!),
                  text('deu common :', tran.deu!.common!),
                  text('deu official :', tran.deu!.official!),
                  text('est common :', tran.est!.common!),
                  text('est official :', tran.est!.official!),
                  text('fin common :', tran.fin!.common!),
                  text('fin official :', tran.fin!.official!),
                  // text('fra f :', tran.fra!.f!),
                  // text('fra m :', tran.fra!.m!),
                  text('hrv common :', tran.hrv!.common!),
                  text('hrv official :', tran.hrv!.official!),
                  text('hun common :', tran.hun!.common!),
                  text('hun official :', tran.hun!.official!),
                  text('ita common :', tran.ita!.common!),
                  text('ita official :', tran.ita!.official!),
                  text('jpn common :', tran.jpn!.common!),
                  text('jpn official :', tran.jpn!.official!),
                  text('kor common :', tran.kor!.common!),
                  text('kor official :', tran.kor!.official!),
                  text('nld common :', tran.nld!.common!),
                  text('nld official :', tran.nld!.official!),
                  text('per common :', tran.per!.common!),
                  text('per official :', tran.per!.official!),
                  text('pol common :', tran.pol!.common!),
                  text('pol official :', tran.pol!.official!),
                  text('por common :', tran.por!.common!),
                  text('por official :', tran.por!.official!),
                  text('rus common :', tran.rus!.common!),
                  text('rus official :', tran.rus!.official!),
                  text('slk common :', tran.slk!.common!),
                  text('slk official :', tran.slk!.official!),
                  text('spa common :', tran.spa!.common!),
                  text('spa official :', tran.spa!.official!),
                  text('swe common :', tran.swe!.common!),
                  text('swe official :', tran.swe!.official!),
                  text('urd common :', tran.urd!.common!),
                  text('urd official :', tran.urd!.official!),
                  text('zho common :', tran.zho!.common!),
                  text('zho official :', tran.zho!.official!),
                ],
              ),
            ),
          ).show();
        },
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.translate_outlined,
                color: Colors.purple,
              ),
            ),
            Text(
              'Translations',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }

  Widget text(String text, String title) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text,
                  style: const TextStyle(fontSize: 17, color: Colors.black)),
              Text(title,
                  style: const TextStyle(fontSize: 17, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
