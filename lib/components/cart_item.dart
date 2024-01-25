import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/stock.dart';

class CartItem extends StatefulWidget {
  Stock stock;
  CartItem({
    super.key,
    required this.stock,
    });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  // remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.stock);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8)
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.stock.imagePath),
        title: Text(widget.stock.name),
        subtitle: Text(widget.stock.price),
        trailing: IconButton(
          icon: Icon(Icons.delete), 
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}