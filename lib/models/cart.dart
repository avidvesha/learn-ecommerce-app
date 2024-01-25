import 'package:flutter/material.dart';
import 'package:learn_ecommerce_app/models/stock.dart';

class Cart extends ChangeNotifier{

  // list item in the shop
  List<Stock> stockShop = [
    Stock(
      name: 'Kodak Colorplus', 
      price: '155.000', 
      description: '200 ISO Speed 35mm Film Stock', 
      imagePath: 'lib/images/kodak-colorplus.jpg'
    ),
    Stock(
      name: 'Kodak Ektar', 
      price: '265.000', 
      description: '100 ISO Speed 35mm Film Stock', 
      imagePath: 'lib/images/kodak-ektar.jpg'
    ),
    Stock(
      name: 'Kodak Gold', 
      price: '165.000', 
      description: '200 ISO Speed 35mm Film Stock', 
      imagePath: 'lib/images/kodak-gold.jpg'
    ),
    Stock(
      name: 'Kodak Ultramax', 
      price: '180.000', 
      description: '400 ISO Speed 35mm Film Stock', 
      imagePath: 'lib/images/kodak-ultramax.jpg'
    ),
  ];
  
  // list item in the cart
  List<Stock> userCart = [];

  // get list of item for sale
  List<Stock> getShopList() {
    return stockShop;
  }

  // get cart
  List<Stock> getUserCart() {
    return userCart;
  }

  // method/function to add item to cart
  void addItemToCart(Stock stock) {
    userCart.add(stock);
    notifyListeners();
  }

  // method/function to remove item from cart
  void removeItemFromCart(Stock stock) {
    userCart.remove(stock);
    notifyListeners();
  }
}