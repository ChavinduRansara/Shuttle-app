class AppValidator{

  static String? validateEmpty(String? value){
    if(value == null || value.isEmpty){
      return 'This field is required';
    }
    return null;
  }

  static String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return 'Email is required';
    }
    if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'Password is required';
    }
    if(value.length < 8){
      return 'Password must be at least 8 characters';
    }
    if(!RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number and one special character';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password){
    if(value == null || value.isEmpty){
      return 'Confirm password is required';
    }
    if(value != password){
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value){
    if(!RegExp(r'^[0-9]{10}$').hasMatch(value!)){
      return 'Enter a valid phone number';
    }
    return null;
  }
}