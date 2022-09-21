class Translations {
  Ara? ara;
  Ara? bre;
  Ara? ces;
  Ara? cym;
  Ara? deu;
  Ara? est;
  Ara? fin;
  Eng? fra;
  Ara? hrv;
  Ara? hun;
  Ara? ita;
  Ara? jpn;
  Ara? kor;
  Ara? nld;
  Ara? per;
  Ara? pol;
  Ara? por;
  Ara? rus;
  Ara? slk;
  Ara? spa;
  Ara? swe;
  Ara? urd;
  Ara? zho;

  Translations(
      {this.ara,
      this.bre,
      this.ces,
      this.cym,
      this.deu,
      this.est,
      this.fin,
      this.fra,
      this.hrv,
      this.hun,
      this.ita,
      this.jpn,
      this.kor,
      this.nld,
      this.per,
      this.pol,
      this.por,
      this.rus,
      this.slk,
      this.spa,
      this.swe,
      this.urd,
      this.zho});

  Translations.fromJson(Map<String, dynamic> json) {
    ara = json['ara'] != null ? Ara.fromJson(json['ara']) : null;
    bre = json['bre'] != null ? Ara.fromJson(json['bre']) : null;
    ces = json['ces'] != null ? Ara.fromJson(json['ces']) : null;
    cym = json['cym'] != null ? Ara.fromJson(json['cym']) : null;
    deu = json['deu'] != null ? Ara.fromJson(json['deu']) : null;
    est = json['est'] != null ? Ara.fromJson(json['est']) : null;
    fin = json['fin'] != null ? Ara.fromJson(json['fin']) : null;
    fra = json['fra'] != null ? Eng.fromJson(json['fra']) : null;
    hrv = json['hrv'] != null ? Ara.fromJson(json['hrv']) : null;
    hun = json['hun'] != null ? Ara.fromJson(json['hun']) : null;
    ita = json['ita'] != null ? Ara.fromJson(json['ita']) : null;
    jpn = json['jpn'] != null ? Ara.fromJson(json['jpn']) : null;
    kor = json['kor'] != null ? Ara.fromJson(json['kor']) : null;
    nld = json['nld'] != null ? Ara.fromJson(json['nld']) : null;
    per = json['per'] != null ? Ara.fromJson(json['per']) : null;
    pol = json['pol'] != null ? Ara.fromJson(json['pol']) : null;
    por = json['por'] != null ? Ara.fromJson(json['por']) : null;
    rus = json['rus'] != null ? Ara.fromJson(json['rus']) : null;
    slk = json['slk'] != null ? Ara.fromJson(json['slk']) : null;
    spa = json['spa'] != null ? Ara.fromJson(json['spa']) : null;
    swe = json['swe'] != null ? Ara.fromJson(json['swe']) : null;
    urd = json['urd'] != null ? Ara.fromJson(json['urd']) : null;
    zho = json['zho'] != null ? Ara.fromJson(json['zho']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ara != null) {
      data['ara'] = ara!.toJson();
    }
    if (bre != null) {
      data['bre'] = bre!.toJson();
    }
    if (ces != null) {
      data['ces'] = ces!.toJson();
    }
    if (cym != null) {
      data['cym'] = cym!.toJson();
    }
    if (deu != null) {
      data['deu'] = deu!.toJson();
    }
    if (est != null) {
      data['est'] = est!.toJson();
    }
    if (fin != null) {
      data['fin'] = fin!.toJson();
    }
    if (fra != null) {
      data['fra'] = fra!.toJson();
    }
    if (hrv != null) {
      data['hrv'] = hrv!.toJson();
    }
    if (hun != null) {
      data['hun'] = hun!.toJson();
    }
    if (ita != null) {
      data['ita'] = ita!.toJson();
    }
    if (jpn != null) {
      data['jpn'] = jpn!.toJson();
    }
    if (kor != null) {
      data['kor'] = kor!.toJson();
    }
    if (nld != null) {
      data['nld'] = nld!.toJson();
    }
    if (per != null) {
      data['per'] = per!.toJson();
    }
    if (pol != null) {
      data['pol'] = pol!.toJson();
    }
    if (por != null) {
      data['por'] = por!.toJson();
    }
    if (rus != null) {
      data['rus'] = rus!.toJson();
    }
    if (slk != null) {
      data['slk'] = slk!.toJson();
    }
    if (spa != null) {
      data['spa'] = spa!.toJson();
    }
    if (swe != null) {
      data['swe'] = swe!.toJson();
    }
    if (urd != null) {
      data['urd'] = urd!.toJson();
    }
    if (zho != null) {
      data['zho'] = zho!.toJson();
    }
    return data;
  }
}

class Ara {
  String? official;
  String? common;

  Ara({this.official, this.common});

  Ara.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['official'] = official;
    data['common'] = common;
    return data;
  }
}

class Eng {
  String? f;
  String? m;

  Eng({this.f, this.m});

  Eng.fromJson(Map<String, dynamic> json) {
    f = json['f'];
    m = json['m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['f'] = f;
    data['m'] = m;
    return data;
  }
}
