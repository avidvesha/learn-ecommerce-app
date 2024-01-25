import 'package:flutter/material.dart';

import '../models/stock.dart';

class StockTile extends StatelessWidget {
  Stock stock;
  void Function()? onTap;
  StockTile({
    super.key, 
    required this.stock,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // picture
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(stock.imagePath)
          ),

          // desc
          Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: Text(
              stock.description, 
              style: TextStyle(
                color: Colors.grey[600],
          
              ),
            ),
          ),

          // (name & price) + cart 
          Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Text(
                      stock.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
          
                    // SizedBox(height: 5,),
            
                    // price
                    Text(
                      'Rp.' + stock.price,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                      ),
                    ),
                  ],
                ),
                // plus button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )
                  ),
                ),
              ],
            ),
          )
          

        ]
      ),
    );
  }
}