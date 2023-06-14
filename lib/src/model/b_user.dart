class BUser {
  String? uid;
  String? docId;
  String? nickname;
  String? thumbnail;
  String? description;
  DateTime? lastLoginTime;
  DateTime? createdTime;

  BUser({

    this.uid,
    this.docId,
    this.nickname,
    this.thumbnail,
    this.description,
    this.createdTime,
    this.lastLoginTime,

  });

  Map<String, dynamic> toMap(){
    return {
      "uid" : this.uid,
      "nickname" : this.nickname,
      "thumbnail" : this.thumbnail,
      "description" : this.description,
      "last_login_time" : this.lastLoginTime,
      "created_time" : this.createdTime,

    };
  }

  factory BUser.fromJson( Map<String, dynamic >  json ){


    return BUser(
      uid: json["uid"] == null ? "" : json["uid"].toString(),
      docId: json["docId"] == null ? "" : json["docId"].toString(),
      nickname: json["nickname"] == null ? "" : json["nickname"].toString(),
      thumbnail: json["thumbnail"] == null ? "" : json["thumbnail"].toString(),
      description: json["description"] == null ? "" : json["description"].toString(),
    );


  }

  copyWith( {String? uid,
  String? docId,
  String? nickname,
  String? thumbnail,
  String? description,
  DateTime? lastLoginTime,
  DateTime? createdTime}){
    return BUser (
      uid: uid ?? this.uid,
      docId: docId ?? this.docId,
      nickname: nickname ?? this.nickname,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      lastLoginTime: lastLoginTime ?? this.lastLoginTime,
      createdTime: createdTime ?? this.createdTime,
    );
  }






}
