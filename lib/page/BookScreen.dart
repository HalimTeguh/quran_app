import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Bookscreen extends StatefulWidget {
  const Bookscreen({super.key});

  @override
  State<Bookscreen> createState() => _BookscreenState();
}

class _BookscreenState extends State<Bookscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Button"),
                    ],
                  )),
              TextButton(onPressed: () {}, child: Text("Button")),
              OutlinedButton(onPressed: () {}, child: Text("Button")),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 100,
                child: FloatingActionButton(
                  backgroundColor: Color(0xff672CBC),
                  foregroundColor: Colors.white,
                  onPressed: () {
                    showDialog(context: (context), builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Add Content"),
                        content: Text("Add your Content here!"),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: Text("Close"))
                        ],
                        
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Ionicons.add),
                      SizedBox(width: 5,),
                      Text("Add", style: TextStyle(fontFamily: "Poppins", fontSize: 16),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
