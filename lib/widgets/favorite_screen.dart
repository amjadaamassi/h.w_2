import 'package:flutter/material.dart';
import 'package:gsg/data/product_data.dart';
import 'package:gsg/model/product_model.dart';
import 'package:gsg/widgets/product_widget.dart';


class FavoriteWidget extends StatefulWidget {
  Product _product;
  FavoriteWidget(this._product);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                // blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(0.2, 0.2),
                color: Colors.grey,
              ),
            ],
          ),
        ),
        Positioned(
          top: 10.2,
          left: 9,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Image.network(
                    widget._product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    widget._product.name,
                    //  textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      //  fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "price: ",
                        //  textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15, color: Colors.grey
                          //  fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget._product.price,
                        //  textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15, color: Colors.grey
                          //  fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),

            ],
          ),
        ),
      ],
    );

  }
}



class FavoriteScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

      return
        ListView(
          children: products.map((e) {
            return FavoriteWidget(e);
          }).where((element) => element._product.isFavorite == true).toList()
          ,);
    }
  }


