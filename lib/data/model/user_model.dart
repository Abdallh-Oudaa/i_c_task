class UserModel{
  String? name;
  String? email;
  UserModel(this.name,this.email);
  UserModel.fromJson(Map<String,dynamic> data){
      name=data["name"];
      email=data["email"];

  }
  Map<String,dynamic> toJson(){
    return{
      "name":name,
      "email":email,
    };
  }
}