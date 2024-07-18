// ignore_for_file: annotate_overrides

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_repository/pizza_repository.dart';

class FirebasePizzaRepo implements PizzaRepo {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  Future<List<Pizza>> getPizzas() async{
    try {
      final querySnapshot = await pizzaCollection.get();
      log("Documents retrieved: ${querySnapshot.docs.length}");

      // return await pizzaCollection
      //   .get()
      //   .then((value) => value.docs.map((e) => 
      //     Pizza.fromEntity(PizzaEntity.fromDocument(e.data()))
      //   ).toList());
    

      return querySnapshot.docs.map((doc) {
        log("Document data: ${doc.data()}");
        final data = doc.data();
        final pizzaEntity = PizzaEntity.fromDocument(data);
        return Pizza.fromEntity(pizzaEntity);

      }).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}