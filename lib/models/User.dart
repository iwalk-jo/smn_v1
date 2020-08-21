// class User {

//   final String uid;
//   // final String userName;
  
//   User({ this.uid });

//   // User({ this.userName });


// }

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String userRole;

  User({
    this.id, 
    this.firstName,
    this.lastName, 
    this.email, 
    this.userRole,
    });

    User.fromData(Map<String, dynamic> data)
    : id = data['id'], firstName = data['firstName'], lastName = data['lastName'], email = data['email'], userRole = data['userRole'];

    Map<String, dynamic> toJson() {
      return{
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'userRole': userRole,
      };
    }
}