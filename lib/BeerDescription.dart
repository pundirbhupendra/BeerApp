
import 'package:beer_list/Beer.dart';
import 'package:flutter/material.dart';

class BeerDescription extends StatelessWidget {
  final Beer beer;
  const BeerDescription({Key key,@required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BeerDescription'),
        ),
        body: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Hero(
                  
                  tag: beer.name,
                   child: CircleAvatar(
                  radius: 100.0,
                  child: Image.network(beer.imageUrl),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: Text(beer.name,style: TextStyle(
            color: Colors.black.withOpacity(0.8)
            ,fontSize: 16.0
            ,fontWeight: FontWeight.bold
          ),),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: Text(beer.description
                ,style: TextStyle(
            color: Colors.black.withOpacity(0.8)
            ,fontSize: 16.0
            ,fontWeight: FontWeight.bold
          ),),
              )
            ],
          ),
        )
      );
    
  }
}
