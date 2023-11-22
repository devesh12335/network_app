// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ImageModel {
  int? id;
  String? filename;
  String? filepath;


  ImageModel(
      { this.id,
        this.filename,
        this.filepath,
        });

  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'],
      filename: map['filename'],
      filepath: map['filepath'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'filename': filename,
      'filepath': filepath,

    };
  }
}

class NetworkImgModel {

  String? userName;
  String? imgURL;
  NetworkImgModel(
      {
        this.userName,
        this.imgURL,
      });

  factory NetworkImgModel.fromJson(Map<String, dynamic> map) {
    return NetworkImgModel(
      userName: map['userName'],
      imgURL: map['imgURL'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'imgURL': imgURL,

    };
  }
}

class TextModel{
  // Color textColor;
  double textSize;
  TextAlign textAlignMent;
  String text;
  Gradient gradient;

  TextModel({required this.text,required this.textAlignMent,required this.textSize,required this.gradient});
}

class UserModel {
  String? email;
  String? userName;
  String? uid;
  // bool? subscribed;
  // String? subStartDate;
  // String? subEndDate;
  String? paymentId;
  String? orderId;
  String? signature;
  // String? packageName;
  // int? duration;
  int? totalCredits ;
  int? remainingCredits ;

  UserModel(
      {this.userName,
        this.email,
        this.uid,
        // this.subscribed,
        // this.subStartDate,
        // this.subEndDate,
        this.paymentId,
        this.orderId,
        this.signature,
        // this.duration,
        // this.packageName,
        this.remainingCredits,
        this.totalCredits
      });

  factory UserModel.fromJson(Map<dynamic, dynamic> map) {
    return UserModel(
      // subscribed: map['subscribed'],
      remainingCredits: map['remainingCredits'],
      totalCredits: map['totalCredits'],
      userName: map['userName'],
      email: map['email'],
      uid: map['uid'],
      // subStartDate: map['subStartDate'],
      // subEndDate: map['subEndDate'],
      paymentId: map['paymentId'],
      orderId: map['orderId'],
      signature: map['signature'],
      // packageName: map['packageName'],
      // duration: map['duration'],
      // remainingCredits: map['remainingCredits'],
      // totalCredits: map['totalCredits'],
    );
  }

  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   final data = document.data();
  //   return UserModel(
  //     // subscribed: data!['subscribed'],
  //     // subStartDate: data!['subStartDate'],
  //     // subEndDate: data!['subEndDate'],
  //     userName: data!['userName'],
  //     email: data!['email'],
  //     uid: data!['uid'],
  //     // subStartDate: data!['subStartDate'],
  //     // subEndDate: data['subEndDate'],
  //     paymentId: data['paymentId'],
  //     orderId: data['orderId'],
  //     signature: data['signature'],
  //     // duration: data['duration'],
  //     // packageName: data['packageName'],
  //     totalCredits: data['totalCredits'],
  //     remainingCredits: data['remainingCredits'],
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      // 'subscribed': subscribed,
      // 'subStartDate': subStartDate,
      // 'subscribed': subscribed,
      'userName': userName,
      'email': email,
      'uid': uid,
      // 'subEndDate': subEndDate,
      // 'subStartDate': subStartDate,
      'paymentId': paymentId,
      'orderId': orderId,
      'signature': signature,
      // 'duration': duration,
      // 'packageName': packageName,
      'remainingCredits': remainingCredits,
      'totalCredits': totalCredits,
    };
  }
}

class SubscriptionDetail {
  int? remainingCredits;
  int? totalCredits;
  String? currency;
  String? payerId;
  // String? subStartDate;
  // String? subEndDate;
  String? paymentId;
  // String? packageName;
  // int? duration;
  // bool? subscribed;

  SubscriptionDetail(
      {
        this.remainingCredits,
        this.totalCredits,
        // this.subStartDate,
        // this.subEndDate,
        this.paymentId,
        this.payerId,
        this.currency,
        // this.duration,
        // this.packageName,
        // this.subscribed
      });

  factory SubscriptionDetail.fromJson(Map<dynamic, dynamic> map) {
    return SubscriptionDetail(
      remainingCredits: map['remainingCredits'],
      totalCredits: map['totalCredits'],
      // subStartDate: map['subStartDate'],
      // subEndDate: map['subEndDate'],
      paymentId: map['paymentId'],
      payerId: map['payerId'],
      currency: map['currency'],
      // packageName: map['packageName'],
      // duration: map['duration'],
      // subscribed: map['subscribed'],
    );
  }

  factory SubscriptionDetail.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return SubscriptionDetail(
      remainingCredits: data!['remainingCredits'],
      totalCredits: data!['totalCredits'],
      // subStartDate: data!['subStartDate'],
      // subEndDate: data['subEndDate'],
      paymentId: data['paymentId'],
      payerId: data['payerId'],
      currency: data['currency'],
      // duration: data['duration'],
      // packageName: data['packageName'],
      // subscribed: data['subscribed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'remainingCredits': remainingCredits,
      'totalCredits': totalCredits,
      // 'subEndDate': subEndDate,
      // 'subStartDate': subStartDate,
      'paymentId': paymentId,
      'payerId': payerId,
      'currency': currency,
      // 'duration': duration,
      // 'packageName': packageName,
      // 'subscribed': subscribed,
    };
  }
}

class SubscriptionDetailRemove {
  int? remainingCredits;
  int? totalCredits;
  // String? subStartDate;
  // String? subEndDate;
  String? paymentId;
  String? orderId;
  String? signature;
  // String? packageName;
  // int? duration;
  // bool? subscribed;

  SubscriptionDetailRemove(
      {
        this.remainingCredits,
        this.totalCredits,
        // this.subStartDate,
        // this.subEndDate,
        this.paymentId,
        this.orderId,
        this.signature,
        // this.duration,
        // this.packageName,
        // this.subscribed
      });



  Map<String, dynamic> toMap() {
    return {
      'remainingCredits': remainingCredits,
      'totalCredits': totalCredits,
      // 'subEndDate': subEndDate,
      // 'subStartDate': subStartDate,
      'paymentId': paymentId,
      'orderId': orderId,
      'signature': signature,
      // 'duration': duration,
      // 'packageName': packageName,
      // 'subscribed': subscribed,
    };
  }
}