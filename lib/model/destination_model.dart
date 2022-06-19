class Destination {
  Destination({
    this.message,
    this.destinations,
  });

  final String message;
  List<DestinationElement> destinations;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        message: json["message"],
        destinations: List<DestinationElement>.from(
            json["destinations"].map((x) => DestinationElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "destinations": List<dynamic>.from(destinations.map((x) => x.toJson())),
      };
}

class DestinationElement {
  DestinationElement({
    this.name,
    this.image,
    this.description,
    this.address,
    this.city,
    this.province,
    this.postalCode,
    this.telephone,
    this.openTime,
    this.openDay,
    this.ticket,
    this.website,
    this.instagram,
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
  final String openTime;
  final String openDay;
  final int ticket;
  final String website;
  final String instagram;
  final String id;

  factory DestinationElement.fromJson(Map<String, dynamic> json) =>
      DestinationElement(
        name: json["name"],
        image: json["image"],
        description: json["description"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        postalCode: json["postalCode"],
        telephone: json["telephone"],
        openTime: json["openTime"],
        openDay: json["openDay"],
        ticket: json["ticket"],
        website: json["website"],
        instagram: json["instagram"],
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
        "openTime": openTime,
        "openDay": openDay,
        "ticket": ticket,
        "website": website,
        "instagram": instagram,
        "id": id,
      };
}
