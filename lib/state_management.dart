import 'package:flutter/material.dart';

class CartState { 
  static final ValueNotifier<List<Map<String, String>>> cartItems = ValueNotifier([]); 
}

class OrderState { 
  static final ValueNotifier<List<Map<String, String>>> orderItems = ValueNotifier([]); 
}
