class Cast {
  List<Actor> actores = new List();

  Cast.fromJsomList(List<dynamic> jsonList){
     if (jsonList==null) return;
     jsonList.forEach((it){
      final actor =Actor.fromJsonMap(it);
      actores.add(actor);
     });
  }
}


class Actor {
  String uniqueId;
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor(this.castId, this.character, this.creditId, this.gender, this.id,
      this.name, this.order, this.profilePath);

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    name = json['name'];
    id = json['id'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getFoto() {
    if (profilePath == null) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}

