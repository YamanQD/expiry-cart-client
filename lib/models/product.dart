import 'dart:convert';
import 'package:intl/intl.dart';

class ProductSummary {
  ProductSummary({
    this.id,
    this.name,
    this.price,
    this.image,
    this.category,
    this.expiryDate,
    this.votes,
    this.views,
  });

  final int id;
  final String name;
  final String price;
  final String image;
  final String category;
  final String expiryDate;
  final String votes;
  final String views;

  factory ProductSummary.fromRawJson(String str) =>
      ProductSummary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductSummary.fromJson(Map<String, dynamic> json) => ProductSummary(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"] ?? 'default.png',
        category: json["category"],
        expiryDate: DateFormat("dd/MM/yyyy")
            .format(DateTime.parse(json["expiry_date"])),
        votes: json["votes"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "category": category,
        "expiry_date": expiryDate,
        "votes": votes,
        "views": views,
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.image,
    this.category,
    this.expiryDate,
    this.description,
    this.contactInfo,
    this.votes,
    this.views,
    this.isOwner,
    this.userVote,
    this.comments,
  });

  final int id;
  final String name;
  final String price;
  final String quantity;
  final String image;
  final String category;
  final String expiryDate;
  final String description;
  final String contactInfo;
  final String votes;
  final String views;
  final String isOwner;
  final String userVote;
  final List<Comment> comments;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"].toString(),
        price: json["price"].toString(),
        quantity: json["quantity"].toString(),
        image: json["image"] ?? 'default.png',
        category: json["category"].toString(),
        expiryDate: DateFormat("dd/MM/yyyy")
            .format(DateTime.parse(json["expiry_date"])),
        description: json["description"].toString(),
        contactInfo: json["contact_info"].toString(),
        votes: json["votes"].toString(),
        views: json["views"].toString(),
        isOwner: json["is_owner"].toString(),
        userVote: json["user_vote"].toString(),
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "image": image,
        "category": category,
        "expiry_date": expiryDate,
        "description": description,
        "contact_info": contactInfo,
        "votes": votes,
        "views": views,
        "is_owner": isOwner,
        "user_vote": userVote,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    this.id,
    this.body,
    this.owner,
  });

  final int id;
  final String body;
  final String owner;

  factory Comment.fromRawJson(String str) => Comment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        body: json["body"].toString(),
        owner: json["owner"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "body": body,
        "owner": owner,
      };
}
