import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider.dart';
import 'package:provider_state/secondpage.dart';
class HomePage extends StatelessWidget {
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ///j================
    final providerObj = Provider.of<NumberListProvider>(context);
    return Consumer(
      builder: (context,numberListModel,child)=>
     Scaffold(
        appBar: AppBar(title: Text('HomePage'),actions: [IconButton(onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage(),));}
            , icon: Icon(Icons.navigate_next))],),
        floatingActionButton: FloatingActionButton(onPressed: (){ providerObj.add(); },child: Text('Add'),),

        body: Column(
          children: [
            Text('Total Couont = ${providerObj.numbers.length}'),
            Expanded(child: ListView.builder(itemCount:providerObj.numbers.length,itemBuilder: (context,index){
              return ListTile(title: Text(providerObj.numbers[index].toString()),);
            }))
          ],
        ),
      ),
    );
  }
}
