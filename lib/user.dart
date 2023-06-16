// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class user {
  const user({required this.name, required this.age});

  final String name;
  final String age;

//this method is created with extention
  user copyWith({
    String? name,
    String? age,
  }) {
    return user(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}

////////////////////////
//now this class will contain all the methods to update the user name and age
///////////////////////
//and this class contain the current state of our user modal
class usernotifier extends StateNotifier<user> {
  //here i have provided this class's constructor , the current state ie
  // initiated values of our user class

  /* usernotifier(super.state); */
  //      OR
  usernotifier()
      : super(
          user(
            name: "simar",
            age: 19.toString(),
          ),
        ) /*  {
    updatename("initialname");
  } */
  ;

////now writing a function to update the user details,or any kind of list or map
//this is one method to update name , but this method is not effiecent

  void updatename(String updatedname) {
    // state = user(name: updatedname, age: state.age);
    state = state.copyWith(name: updatedname);
    // it is used when i explicitly created the copywith method with bulb icon via
    //dataclass gen extention.(only in case to manipulate data classes)
  }

  //similarly creating function to manipulate age
  void updateage(String updatedage) {
    state = state.copyWith(age: updatedage);
  }
}

//here i am globally declaring my statenotifierprovider
//and this type of provider needs a notifier type class as a return type
/*here i have provided 2 generics , to avoid nametype exceptions 
 1.class that your are returning ,
 2.state of the class*/
final userprovider = StateNotifierProvider<usernotifier, user>(
    (ref) => usernotifier(/* user(name: "name", age: 0.toString()) */));
