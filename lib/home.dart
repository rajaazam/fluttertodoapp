

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class home extends StatefulWidget {
 
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

 var   output= "";
  List<dynamic>lst=[1,2,3];
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: Center(child: Text('ToDoo App'),
      ),
      ), 
      body: ListView.builder(
        
        padding: EdgeInsets.only(top: 50),
        itemCount: lst.length,
        itemBuilder: (context,index){
          return Container(
            height: 50,
            color: Colors.greenAccent,
            margin: EdgeInsets.only(top: 15),
            child: ListTile(
              title: Text('${lst[index]}'),
            trailing: Container(
              width: 50,
              child: Row(
                children: [
                  
                  GestureDetector(onTap: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text('edit item',),
                        content: TextField(
                          decoration: InputDecoration(
                           labelStyle:TextStyle(fontSize: 100,fontWeight: FontWeight.bold ,color: Colors.green)
                          ),

                          onChanged: (value){
                            output= value;
                          },
                          
                        ),
                        actions: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                              lst.replaceRange(index, index+1,{ output});
                            });
                            Navigator.of(context).pop();
                          }, child: Text('edit',style: TextStyle(color: Colors.greenAccent),))
                        ],
                      );
                    },
                    );
                    
                  },
             child:Icon(Icons.edit),
                  ),
                  //for delete
                  GestureDetector(onTap: (){
                    setState(() {
                      lst.removeAt(index);
                    });

                  },
                  child: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
            ),
          );

    

        }
        ),

        floatingActionButton:FloatingActionButton(onPressed: (){
    
          showDialog(context: context, builder: (context){
            return AlertDialog(
            title: Text('Add item'),
            content: TextField(

              onChanged: (value){
                output=value;
              }
            ),
            actions: [

              ElevatedButton(onPressed: (){
                setState(() {
                  lst.add(output);
                });
               Navigator.of(context).pop();
              }, child: Text('add'))
            ],

            );


          });
        },
        
        child: Text('Add'),
        ),
      
    );
  }
}
