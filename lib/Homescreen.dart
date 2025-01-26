
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _controller=TextEditingController();
  final List<String> _items=[];

  void _addItem(){
    if(_controller.text.isNotEmpty){
      setState(() {
        _items.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removItem(int index){
    setState(() {
      _items.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("allllllllllp"),
      backgroundColor: Colors.black45,
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child: TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: "Entere your Name"),
              ),
              ),
              ElevatedButton(onPressed: _addItem, child: Text("ADD")),
            ],
          ),),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index)=>ListTile(
                title: Text(_items[index]),
                trailing: IconButton(  icon: Icon(Icons.delete,color: Colors.red,),
                onPressed:()=>_removItem(index)),
              ),

            ))
        ],
      ),
    
     
    );
  }
}