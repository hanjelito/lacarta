import 'package:flutter/material.dart';

import 'package:resto/src/providers/restos_provider.dart';
import 'package:resto/src/search/search_delegate.dart';

import 'package:resto/src/widgets/home/card_widget.dart';

class CardsPage extends StatelessWidget {
  final restosProvider = RestosProvider();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset('assets/icons/menu.png', fit: BoxFit.cover),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: (){
              showSearch(
                context: context,
                delegate: DataSearch()
              );
            },
          ),
        ],
      )
      ,
      body: Stack(
          children: <Widget>[
            _cardWidget(),
          ],
      )
    );
  }
  Widget _cardWidget() {
    
    return FutureBuilder(
      future: restosProvider.getOnline(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if(snapshot.hasData){
            return CardWidget(restos: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}