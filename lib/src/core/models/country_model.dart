class City {
  final int id;
  final String name;
  final int stateId;

  City({required this.id, required this.name, required this.stateId});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      stateId: json['state_id'],
    );
  }
}

class StateModel {
  final int id;
  final String name;
  final int countryId;
  final List<City> cities;

  StateModel({
    required this.id,
    required this.name,
    required this.countryId,
    required this.cities,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    var citiesJson = json['city'] as List;
    List<City> cityList = citiesJson.map((e) => City.fromJson(e)).toList();

    return StateModel(
      id: json['id'],
      name: json['name'],
      countryId: json['country_id'],
      cities: cityList,
    );
  }
}

class Country {
  final int id;
  final String name;
  final String emoji;
  final String emojiU;
  final List<StateModel> states;

  Country({
    required this.id,
    required this.name,
    required this.emoji,
    required this.emojiU,
    required this.states,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    var statesJson = json['state'] as List;
    List<StateModel> stateList =
        statesJson.map((e) => StateModel.fromJson(e)).toList();

    return Country(
      id: json['id'],
      name: json['name'],
      emoji: json['emoji'],
      emojiU: json['emojiU'],
      states: stateList,
    );
  }
}
