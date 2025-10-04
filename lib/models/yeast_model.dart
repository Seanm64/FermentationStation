class Yeast {
  String yeast_name;
  double max_abv;

  Yeast({ required this.yeast_name, required this.max_abv });
}

final Map<String, Yeast> manual_yeast_map = {
  'RC 212':        Yeast(yeast_name: 'RC 212', max_abv: 16.0),
  'ICV D47':       Yeast(yeast_name: 'ICV D47', max_abv: 14.0),
  '71B-1122':      Yeast(yeast_name: '71B-1122', max_abv: 14.0),
  'K1-V1116':      Yeast(yeast_name: 'K1-V1116', max_abv: 18.0),
  'EC-1116':       Yeast(yeast_name: 'EC-1116', max_abv: 18.0),
  'QA23':          Yeast(yeast_name: 'QA23', max_abv: 10.0),
  'BM 4x4':        Yeast(yeast_name: 'BM 4x4', max_abv: 16.0),
  "Fleishmann's":  Yeast(yeast_name: "Fleishmann's", max_abv: 14.0),
  'Safale S04':    Yeast(yeast_name: 'Safale S04', max_abv: 11.0),
};