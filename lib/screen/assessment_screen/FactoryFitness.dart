enum LevelType {
  beginner,
  intermediate,
  expert
}

abstract class Level {
  factory Level(LevelType type) {
    switch (type) {
      case LevelType.beginner: return Beginner();
      case LevelType.intermediate: return Intermediate();
      case LevelType.expert: return Expert();
    }
  }

  void health();
}

class Beginner implements Level {
  @override
  void health() {
    print("Beginner");
  }
}

class Intermediate implements Level {
  @override
  void health() {
    print("Intermediate");
  }
}

class Expert implements Level {
  @override
  void health() {
    print("Expert");
  }
}


final level1 = Level(LevelType.beginner);
final level2 = Level(LevelType.intermediate);
final level3 = Level(LevelType.expert);


