class CalculatorClass
{
  late int weight;
  late int height; // in inches
  late int age;
  late int TDEE;
  late bool sex; // Male = True, Female = False
  late int protein_grams;
  late int carbs_grams;
  late int fats_grams;

  //Getters
  int getHeight()
  {
    return height;
  }

  int getWeight()
  {
    return weight;
  }

  int getAge()
  {
    return height;
  }
  bool getSex()
  {
    return sex;
  }


  //Setters
  void setHeight(int h) {
    if (h < 0) {}
    else {
      height = h;
    }
  }

  void setWeight(int w)
  {

    if (w < 0)
    {}
    else
    {
      weight = w;
    }
  }

  void setAge(int a)
  {
    if (a < 0)
    {}
    else
    {
      age = a;
    }
  }
  void setSex(bool s)
  {
    sex = s;
  }

  int getTDEE()
  {
    return TDEE;
}


  int MenTDEE()
  {
    late double men_TDEE;
    men_TDEE = 66 + 6.2*weight +12.7*height - 6.7*age;

    return men_TDEE.round();
  }

  int WomenTDEE()
  {
    late double women_TDEE;
    women_TDEE = 655.1 + 4.35*weight +4.7*height - 4.7*age;

    return women_TDEE.round();
  }

  void setTDEE()
  {
    if (sex)
      {
        TDEE = MenTDEE();
      }
    else
      {
        TDEE = WomenTDEE();
      }
  }

 void setProfile_buildMuscle()
 {
   protein_grams = (TDEE*.45).round as int;
   carbs_grams = (TDEE*.40).round as int;
   fats_grams = (TDEE*.15).round as int;
 }

  void setProfile_maintain()
  {
    protein_grams = (TDEE*.35).round as int;
    carbs_grams = (TDEE*.50).round as int;
    fats_grams = (TDEE*.15).round as int;
  }


  void setProfile_loseWeight()
  {
    protein_grams = (TDEE*.35).round as int;
    carbs_grams = (TDEE*.40).round as int;
    fats_grams = (TDEE*.25).round as int;
  }

  CalculatorClass(int w, int h, int a, bool s)
  {
    setWeight(w);
    setAge(a);
    setHeight(h);
    setSex(s);

    setTDEE();
  }








  }