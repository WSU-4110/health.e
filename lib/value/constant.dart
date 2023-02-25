final RegExp emailValidatorRegExp = RegExp(
    "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*");
const String kEmailNullError = "please enter your email";
const String kInvalidEmailError = "please enter your Valid email";
const String kPassNullError = "please enter your password";
const String kShortPassError = "password is too Short";
const String kMatchPassError = "password don't match";
const String kNameNullError = "please enter your Name";