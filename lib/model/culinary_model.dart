class Culinary {
    Culinary({
        this.message,
        this.culinaries,
    });

    final String message;
    List<CulinaryElement> culinaries;

    factory Culinary.fromJson(Map<String, dynamic> json) => Culinary(
        message: json["message"],
        culinaries: List<CulinaryElement>.from(json["culinaries"].map((x) => CulinaryElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "culinaries": List<dynamic>.from(culinaries.map((x) => x.toJson())),
    };
}

class CulinaryElement {
    CulinaryElement({
        this.name,
        this.image,
        this.description,
        this.address,
        this.city,
        this.province,
        this.telephone,
        this.openTime,
        this.openDay,
        this.cloudinaryId,
        this.id,
    });

    final String name;
    final String image;
    final String description;
    final String address;
    final String city;
    final String province;
    final int telephone;
    final String openTime;
    final String openDay;
    final String cloudinaryId;
    final String id;

    factory CulinaryElement.fromJson(Map<String, dynamic> json) => CulinaryElement(
        name: json["name"],
        image: json["image"],
        description: json["description"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        telephone: json["telephone"],
        openTime: json["openTime"],
        openDay: json["openDay"],
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
        "telephone": telephone,
        "openTime": openTime,
        "openDay": openDay,
        "cloudinary_id": cloudinaryId,
        "id": id,
    };
}
