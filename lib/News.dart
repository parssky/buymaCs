class News{

  int _id;
  int _a_id;
  String _title;
  String _coinName;
  int _marketcap;
  int _importance;
  String _proof_add;
  String _pic_proof;
  String _coin_pic;
  String _tex1;
  String _text2;
  String _date;
  String _date_event;
  int _id_pic_proof;
  int _id_coin_pic;

  int get id => _id;

  int get a_id => _a_id;

  int get id_coin_pic => _id_coin_pic;

  News(
      this._id,
      this._a_id,
      this._title,
      this._coinName,
      this._marketcap,
      this._importance,
      this._proof_add,
      this._pic_proof,
      this._coin_pic,
      this._tex1,
      this._text2,
      this._date,
      this._date_event,
      this._id_pic_proof,
      this._id_coin_pic);

  int get id_pic_proof => _id_pic_proof;

  String get date_event => _date_event;

  String get date => _date;

  String get text2 => _text2;

  String get tex1 => _tex1;

  String get coin_pic => _coin_pic;

  String get pic_proof => _pic_proof;

  String get proof_add => _proof_add;

  int get importance => _importance;

  int get marketcap => _marketcap;

  String get coinName => _coinName;

  String get title => _title;
}

