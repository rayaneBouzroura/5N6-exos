import 'package:flutter/material.dart';

class PassisimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo!"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 300,
              child: Row(
                children: [
                  Expanded(flex: 2,child: Container(color:  Colors.red),),
                  //Expanded(child: Container(color: Colors.blue),flex: 1,),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(child: Container(child: Text("Yo",style: TextStyle(color: Colors.red),),),flex: 1,),
                              Expanded(child: Container(color: Colors.white),flex: 1,),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(child: Container(color: Colors.white),flex: 1,),
                              Expanded(child: Container(color: Colors.black),flex: 1,),
                            ],
                          ),
                        ),
                        
                      ],
                    ),                   
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Expanded(child: Container(color: Colors.purple),flex: 1,),
                  //           Expanded(child: Container(color: Colors.green),flex: 1,),
                  //         ],
                  //       ),
                        
                  //     ],
                  //   ),                   
                  // ),
                  
                  
                ],
              )
              ),
              //fill l espace avec un spacer
            Spacer(),
            SizedBox(             
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text("child")),
            ),
          ],
        ));
  }
}
