class PokemonModel {
  final int? id;
  final String? num;
  final String? name;
  final String? img;
  final List<String>? type;
  final String? height;
  final String? weight;
  final String? candy;
  final String? egg;
  final List<String>? weaknesses;

  PokemonModel({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.egg,
    this.weaknesses,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'egg': egg,
      'weaknesses': weaknesses,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'],
      num: map['num'],
      name: map['name'],
      img: map['img'],
      type: List<String>.from(map['type']),
      height: map['height'],
      weight: map['weight'],
      candy: map['candy'],
      egg: map['egg'],
      weaknesses: List<String>.from(map['weaknesses']),
    );
  }
}
