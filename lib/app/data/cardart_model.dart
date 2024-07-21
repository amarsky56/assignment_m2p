///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CardartModelDataCardart {
/*
{
  "id": 1,
  "url": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1721042437/Group_1321315030_gzvlbc.png"
}
*/

  int? id;
  String? url;
  String? cardAmount;
  String? cardNumber;
  String? cardExpiryDate;

  CardartModelDataCardart({
    this.id,
    this.url,
    this.cardAmount,
    this.cardNumber,
    this.cardExpiryDate,
  });

  CardartModelDataCardart.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    url = json['url']?.toString();
    cardAmount = json['cardAmount']?.toString();
    cardNumber = json['cardNumber']?.toString();
    cardExpiryDate = json['cardExpiryDate']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['cardAmount'] = cardAmount;
    data['cardNumber'] = cardNumber;
    data['cardExpiryDate'] = cardExpiryDate;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'cardAmount': cardAmount,
      'cardNumber': cardNumber,
      'cardExpiryDate': cardExpiryDate,
    };
  }

  factory CardartModelDataCardart.fromMap(Map<String, dynamic> map) {
    return CardartModelDataCardart(
      id: map['id'],
      url: map['url'],
      cardAmount: map['cardAmount'].toString(),
      cardNumber: map['cardNumber'],
      cardExpiryDate: map['cardExpiryDate'],
    );
  }
}

class CardartModelData {
/*
{
  "cardart": [
    {
      "id": 1,
      "url": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1721042437/Group_1321315030_gzvlbc.png"
    }
  ]
}
*/

  List<CardartModelDataCardart>? cardart;

  CardartModelData({
    this.cardart,
  });

  CardartModelData.fromJson(Map<String, dynamic> json) {
    if (json['cardart'] != null) {
      final v = json['cardart'];
      final arr0 = <CardartModelDataCardart>[];
      v.forEach((v) {
        arr0.add(CardartModelDataCardart.fromJson(v));
      });
      cardart = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (cardart != null) {
      final v = cardart;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['cardart'] = arr0;
    }
    return data;
  }
}

class CardartModel {
/*
{
  "status": "success",
  "message": "",
  "data": {
    "cardart": [
      {
        "id": 1,
        "url": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1721042437/Group_1321315030_gzvlbc.png"
      }
    ]
  },
  "error_code": ""
}
*/

  String? status;
  String? message;
  CardartModelData? data;
  String? errorCode;

  CardartModel({
    this.status,
    this.message,
    this.data,
    this.errorCode,
  });

  CardartModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    message = json['message']?.toString();
    data = (json['data'] != null) ? CardartModelData.fromJson(json['data']) : null;
    errorCode = json['error_code']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data!.toJson();
      data['error_code'] = errorCode;
    return data;
  }
}
