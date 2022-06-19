class Hotel {
    Hotel({
        this.message,
        this.hotels,
    });

    final String message;
    List<HotelElement> hotels;

    factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        message: json["message"],
        hotels: List<HotelElement>.from(json["hotels"].map((x) => HotelElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "hotels": List<dynamic>.from(hotels.map((x) => x.toJson())),
    };
}

class HotelElement {
    HotelElement({
        this.name,
        this.image,
        this.description,
        this.address,
        this.city,
        this.province,
        this.postalCode,
        this.telephone,
        this.cloudinaryId,
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
    final String cloudinaryId;
    final String id;

    factory HotelElement.fromJson(Map<String, dynamic> json) => HotelElement(
        name: json["name"],
        image: json["image"],
        description: json["description"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        postalCode: json["postalCode"],
        telephone: json["telephone"],
        cloudinaryId: json["cloudinary_id"],
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
        "cloudinary_id": cloudinaryId,
        "id": id,
    };
}

