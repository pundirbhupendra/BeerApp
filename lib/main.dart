import 'package:beer_list/Beer.dart';
import 'package:beer_list/BeerDescription.dart';
import 'package:beer_list/BeerList.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BeersList'),),
      body: FutureBuilder<List<Beer>>(
        future: getBeers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? BeersList(beers: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

}

class BeersList extends StatelessWidget {
  const BeersList({Key key, this.beers}) : super(key: key);
  final List<Beer> beers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: beers.length,
      padding: const EdgeInsets.all(2.0),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Hero(
            tag: beers[index].name,
                      child: GestureDetector(
              child: CircleAvatar(
                radius: 30.0,
                child: Image.network(beers[index].imageUrl),),),
          ),
          title: Text('${beers[index].name}',style: TextStyle(
            color: Colors.black
            ,fontSize: 18.0
            ,fontWeight: FontWeight.bold
          ),),
        
          subtitle: Text('${beers[index].tagline}',
          style: TextStyle(
            color: Colors.black.withGreen(1),
            fontSize: 15.0
            ,fontWeight: FontWeight.normal
          ),),
          onTap: ()=> Navigator.push(context, MaterialPageRoute(
            builder: (context)=>BeerDescription(beer:beers[index])
          )),
        );
      },
    );
  }
}
