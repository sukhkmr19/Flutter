//abstract class Animal {
//  void breath(); // abstract method
//  void makeNoise() {
//    print("Making animal noise....");
//  }
//}
//
//class Person implements Animal {
//  String name, age, nationality;
//
//  Person(this.name, this.age, this.nationality);
//
//  @override
//  void breath() {
//    // TODO: implement breath
//  }
//
//  @override
//  void makeNoise() {
//    // TODO: implement makeNoise
//    print("my noise");
//  }
//
//  @override
//  String toString() => "Name is $name \nnationality -> $nationality";
//}
//
//class Clone extends Person implements isFunny {
//  Clone(String name, String age, String nationality)
//      : super(name, age, nationality);
//
//  @override
//  void breath() {
//    // TODO: implement breath
//  }
//
//  @override
//  void makePeopleLaugh() {
//    print("comedian makeing person to laugh");
//  }
//}
//
//class tvShow implements isFunny {
//  String name;
//
//  @override
//  void makePeopleLaugh() {
//    print("tvShows is funny that makes people laugh.");
//  }
//}
//
//class Comedian extends Person implements isFunny {
//  Comedian(String name, String age, String nationality)
//      : super(name, age, nationality);
//
//  @override
//  void breath() {
//    // TODO: implement breath
//  }
//
//  @override
//  void makePeopleLaugh() {
//    print("comedian makeing person to laugh");
//  }
//}
//
//abstract class isFunny {
//  void makePeopleLaugh();
//}

main(List<String> args) {
//  var person = new Person("sukh", "24", "indain");
//  print(person.toString());
//  person.makeNoise();

  var map = {"first": "hey", "second": null};

//  print(map["second"]);

  map.forEach((k, v) => print(v));

  print(map.keys);
  print(map.values);
}
