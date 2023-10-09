class GetGetQuoteByIdResp {
  String? sId;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  GetGetQuoteByIdResp(
      {this.sId,
      this.content,
      this.author,
      this.tags,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified});

  GetGetQuoteByIdResp.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    author = json['author'];
    tags = json['tags'].cast<String>();
    authorSlug = json['authorSlug'];
    length = json['length'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (sId != null) {
      data['_id'] = sId;
    }
    if (content != null) {
      data['content'] = content;
    }
    if (author != null) {
      data['author'] = author;
    }
    if (tags != null) {
      data['tags'] = tags;
    }
    if (authorSlug != null) {
      data['authorSlug'] = authorSlug;
    }
    if (length != null) {
      data['length'] = length;
    }
    if (dateAdded != null) {
      data['dateAdded'] = dateAdded;
    }
    if (dateModified != null) {
      data['dateModified'] = dateModified;
    }
    return data;
  }
}
