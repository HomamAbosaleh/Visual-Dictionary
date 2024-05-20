class WikipediaSummary {
  String? type;
  String? title;
  String? displaytitle;
  Object? namespace;
  String? wikibaseitem;
  Object? titles;
  int? pageid;
  String? lang;
  String? dir;
  String? revision;
  String? tid;
  DateTime? timestamp;
  String? description;
  String? descriptionsource;
  Object? contenturls;
  String extract;
  String? extracthtml;

  WikipediaSummary({
    this.type,
    this.title,
    this.displaytitle,
    this.namespace,
    this.wikibaseitem,
    this.titles,
    this.pageid,
    this.lang,
    this.dir,
    this.revision,
    this.tid,
    this.timestamp,
    this.description,
    this.descriptionsource,
    this.contenturls,
    required this.extract,
    this.extracthtml,
  });

  factory WikipediaSummary.fromJson(Map<String, dynamic> json) {
    return WikipediaSummary(
      type: json['type'],
      title: json['title'],
      displaytitle: json['displaytitle'],
      namespace: null,
      wikibaseitem: json['wikibase_item'],
      titles: null,
      pageid: json['pageid'],
      lang: json['lang'],
      dir: json['dir'],
      revision: json['revision'],
      tid: json['tid'],
      timestamp: null,
      description: json['description'],
      descriptionsource: json['description_source'],
      contenturls: null,
      extract: json['extract'],
      extracthtml: json['extract_html'],
    );
  }
}
