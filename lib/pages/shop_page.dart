import 'package:flutter/material.dart';
import 'package:learn_ecommerce_app/components/stock_tile.dart';
import 'package:learn_ecommerce_app/models/cart.dart';
import 'package:learn_ecommerce_app/models/stock.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // method to add item to the cart
  void addStockToCart(Stock stock) {
    Provider.of<Cart>(context, listen: false).addItemToCart(stock);

    // alert msg if succesfully added to the cart
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),
    
          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'Enabling creativity since 1880.',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
    
          // hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
    
          const SizedBox(height: 10,),
    
          // list of items for sale
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                // Stock stock = Stock(
                //   name: 'Kodak Gold', 
                //   price: '165.000', 
                //   description: '200 ISO Speed 35mm Film Stock', 
                //   imagePath: 'lib/images/kodak-gold.jpg'
                // );

                // get the item
                Stock stock = value.getShopList()[index];

                // return the item in shop
                return StockTile(
                  stock: stock,
                  onTap: () => addStockToCart(stock),
                );
              },
            )
          ),
    
          const Padding(
            padding: EdgeInsets.fromLTRB(25,25,25,0),
            child: Divider(
              color: Colors.white,
            ),
          )
          
        ],
      ),
    );
  }
}