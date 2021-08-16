/// code : 200
/// message : "成功!"
/// result : [{"sid":"31577089","text":"孩子厉害👍","type":"video","thumbnail":"http://wimg.spriteapp.cn/picture/2020/1026/5f967bc4e7de2_wpd.jpg","video":"http://uvideo.spriteapp.cn/video/2020/1026/5f967bc4e7de2_wpd.mp4","images":null,"up":"114","down":"3","forward":"0","comment":"6","uid":"23005857","name":"无情无义","header":"http://wimg.spriteapp.cn/profile/large/2020/02/09/5e3fc8f551f9a_mini.jpg","top_comments_content":"厉害不厉害不知道。反正比我强","top_comments_voiceuri":"","top_comments_uid":"11981984","top_comments_name":"不得姐用户","top_comments_header":"http://qzapp.qlogo.cn/qzapp/100336987/D2C67A061C37841FD39E2D6232DE9833/100","passtime":"2020-12-24 18:30:05"},{"sid":"31551566","text":"给我一个你不想买的理由\n\n​​​​","type":"video","thumbnail":"http://wimg.spriteapp.cn/picture/2020/0730/5f22acff7206e_wpd.jpg","video":"http://uvideo.spriteapp.cn/video/2020/0730/5f22acff7206e_wpd.mp4","images":null,"up":"68","down":"0","forward":"0","comment":"13","uid":"23131725","name":"天才少女爱我","header":"http://wimg.spriteapp.cn/profile/large/2019/07/04/5d1d909ccbf44_mini.jpg","top_comments_content":null,"top_comments_voiceuri":null,"top_comments_uid":null,"top_comments_name":null,"top_comments_header":null,"passtime":"2020-11-26 10:53:03"}]

class JokeModel {
  int? _code;
  String? _message;
  List<Result>? _result;

  int? get code => _code;
  String? get message => _message;
  List<Result>? get result => _result;

  JokeModel({
      int? code, 
      String? message, 
      List<Result>? result}){
    _code = code;
    _message = message;
    _result = result;
}

  JokeModel.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// sid : "31577089"
/// text : "孩子厉害👍"
/// type : "video"
/// thumbnail : "http://wimg.spriteapp.cn/picture/2020/1026/5f967bc4e7de2_wpd.jpg"
/// video : "http://uvideo.spriteapp.cn/video/2020/1026/5f967bc4e7de2_wpd.mp4"
/// images : null
/// up : "114"
/// down : "3"
/// forward : "0"
/// comment : "6"
/// uid : "23005857"
/// name : "无情无义"
/// header : "http://wimg.spriteapp.cn/profile/large/2020/02/09/5e3fc8f551f9a_mini.jpg"
/// top_comments_content : "厉害不厉害不知道。反正比我强"
/// top_comments_voiceuri : ""
/// top_comments_uid : "11981984"
/// top_comments_name : "不得姐用户"
/// top_comments_header : "http://qzapp.qlogo.cn/qzapp/100336987/D2C67A061C37841FD39E2D6232DE9833/100"
/// passtime : "2020-12-24 18:30:05"

class Result {
  String? _sid;
  String? _text;
  String? _type;
  String? _thumbnail;
  String? _video;
  dynamic? _images;
  String? _up;
  String? _down;
  String? _forward;
  String? _comment;
  String? _uid;
  String? _name;
  String? _header;
  String? _topCommentsContent;
  String? _topCommentsVoiceuri;
  String? _topCommentsUid;
  String? _topCommentsName;
  String? _topCommentsHeader;
  String? _passtime;

  String? get sid => _sid;
  String? get text => _text;
  String? get type => _type;
  String? get thumbnail => _thumbnail;
  String? get video => _video;
  dynamic? get images => _images;
  String? get up => _up;
  String? get down => _down;
  String? get forward => _forward;
  String? get comment => _comment;
  String? get uid => _uid;
  String? get name => _name;
  String? get header => _header;
  String? get topCommentsContent => _topCommentsContent;
  String? get topCommentsVoiceuri => _topCommentsVoiceuri;
  String? get topCommentsUid => _topCommentsUid;
  String? get topCommentsName => _topCommentsName;
  String? get topCommentsHeader => _topCommentsHeader;
  String? get passtime => _passtime;

  Result({
      String? sid, 
      String? text, 
      String? type, 
      String? thumbnail, 
      String? video, 
      dynamic? images, 
      String? up, 
      String? down, 
      String? forward, 
      String? comment, 
      String? uid, 
      String? name, 
      String? header, 
      String? topCommentsContent, 
      String? topCommentsVoiceuri, 
      String? topCommentsUid, 
      String? topCommentsName, 
      String? topCommentsHeader, 
      String? passtime}){
    _sid = sid;
    _text = text;
    _type = type;
    _thumbnail = thumbnail;
    _video = video;
    _images = images;
    _up = up;
    _down = down;
    _forward = forward;
    _comment = comment;
    _uid = uid;
    _name = name;
    _header = header;
    _topCommentsContent = topCommentsContent;
    _topCommentsVoiceuri = topCommentsVoiceuri;
    _topCommentsUid = topCommentsUid;
    _topCommentsName = topCommentsName;
    _topCommentsHeader = topCommentsHeader;
    _passtime = passtime;
}

  Result.fromJson(dynamic json) {
    _sid = json['sid'];
    _text = json['text'];
    _type = json['type'];
    _thumbnail = json['thumbnail'];
    _video = json['video'];
    _images = json['images'];
    _up = json['up'];
    _down = json['down'];
    _forward = json['forward'];
    _comment = json['comment'];
    _uid = json['uid'];
    _name = json['name'];
    _header = json['header'];
    _topCommentsContent = json['top_comments_content'];
    _topCommentsVoiceuri = json['top_comments_voiceuri'];
    _topCommentsUid = json['top_comments_uid'];
    _topCommentsName = json['top_comments_name'];
    _topCommentsHeader = json['top_comments_header'];
    _passtime = json['passtime'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['sid'] = _sid;
    map['text'] = _text;
    map['type'] = _type;
    map['thumbnail'] = _thumbnail;
    map['video'] = _video;
    map['images'] = _images;
    map['up'] = _up;
    map['down'] = _down;
    map['forward'] = _forward;
    map['comment'] = _comment;
    map['uid'] = _uid;
    map['name'] = _name;
    map['header'] = _header;
    map['top_comments_content'] = _topCommentsContent;
    map['top_comments_voiceuri'] = _topCommentsVoiceuri;
    map['top_comments_uid'] = _topCommentsUid;
    map['top_comments_name'] = _topCommentsName;
    map['top_comments_header'] = _topCommentsHeader;
    map['passtime'] = _passtime;
    return map;
  }

}