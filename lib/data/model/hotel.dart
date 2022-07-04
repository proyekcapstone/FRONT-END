class Hotel {
  Hotel({
    this.message,
    this.hotels,
  });

  final String message;
  List<HotelResult> hotels;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        message: json["message"],
        hotels: List<HotelResult>.from(
            json["hotels"].map((x) => HotelResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "hotels": List<dynamic>.from(hotels.map((x) => x.toJson())),
      };
}

class HotelResult {
  HotelResult({
    this.name,
    this.image,
    this.description,
    this.address,
    this.city,
    this.province,
    this.postalCode,
    this.telephone,
    this.id,
  });

  final String name;
  final String image;
  final String description;
  final String address;
  final String city;
  final String province;
  final int postalCode;
  final int telephone;
  final String id;

  factory HotelResult.fromJson(Map<String, dynamic> json) => HotelResult(
        name: json["name"],
        image: json["image"],
        description: json["description"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        postalCode: json["postalCode"],
        telephone: json["telephone"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "description": description,
        "address": address,
        "city": city,
        "province": province,
        "postalCode": postalCode,
        "telephone": telephone,
        "id": id,
      };
}
