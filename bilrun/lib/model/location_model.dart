// To parse this JSON data, do
//
//     final locationData = locationDataFromJson(jsonString);

import 'dart:convert';

LocationData locationDataFromJson(String str) => LocationData.fromJson(json.decode(str));

String locationDataToJson(LocationData data) => json.encode(data.toJson());

class LocationData {
    LocationData({
        this.plusCode,
        this.results,
        this.status,
    });

    PlusCode plusCode;
    List<Result> results;
    String status;

    factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
        plusCode: PlusCode.fromJson(json["plus_code"]),
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "plus_code": plusCode.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
    };
}

class PlusCode {
    PlusCode({
        this.compoundCode,
        this.globalCode,
    });

    String compoundCode;
    String globalCode;

    factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
        globalCode: json["global_code"],
    );

    Map<String, dynamic> toJson() => {
        "compound_code": compoundCode,
        "global_code": globalCode,
    };
}

class Result {
    Result({
        this.addressComponents,
        this.formattedAddress,
        this.geometry,
        this.placeId,
        this.plusCode,
        this.types,
    });

    List<AddressComponent> addressComponents;
    String formattedAddress;
    Geometry geometry;
    String placeId;
    PlusCode plusCode;
    List<String> types;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: List<AddressComponent>.from(json["address_components"].map((x) => AddressComponent.fromJson(x))),
        formattedAddress: json["formatted_address"],
        geometry: Geometry.fromJson(json["geometry"]),
        placeId: json["place_id"],
        plusCode: PlusCode.fromJson(json["plus_code"]),
        types: List<String>.from(json["types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "address_components": List<dynamic>.from(addressComponents.map((x) => x.toJson())),
        "formatted_address": formattedAddress,
        "geometry": geometry.toJson(),
        "place_id": placeId,
        "plus_code": plusCode.toJson(),
        "types": List<dynamic>.from(types.map((x) => x)),
    };
}

class AddressComponent {
    AddressComponent({
        this.longName,
        this.shortName,
        this.types,
    });

    String longName;
    String shortName;
    List<String> types;

    factory AddressComponent.fromJson(Map<String, dynamic> json) => AddressComponent(
        longName: json["long_name"],
        shortName: json["short_name"],
        types: List<String>.from(json["types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "long_name": longName,
        "short_name": shortName,
        "types": List<dynamic>.from(types.map((x) => x)),
    };
}

class Geometry {
    Geometry({
        this.location,
        this.locationType,
        this.viewport,
    });

    Location location;
    String locationType;
    Viewport viewport;

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"]),
        locationType: json["location_type"],
        viewport: Viewport.fromJson(json["viewport"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "location_type": locationType,
        "viewport": viewport.toJson(),
    };
}

class Location {
    Location({
        this.lat,
        this.lng,
    });

    double lat;
    double lng;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Viewport {
    Viewport({
        this.northeast,
        this.southwest,
    });

    Location northeast;
    Location southwest;

    factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: Location.fromJson(json["northeast"]),
        southwest: Location.fromJson(json["southwest"]),
    );

    Map<String, dynamic> toJson() => {
        "northeast": northeast.toJson(),
        "southwest": southwest.toJson(),
    };
}
