
import 'package:flutter/material.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';

class CardPayment extends StatefulWidget {
  @override
  _CardPaymentState createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Transform.scale(
          scale: 0.6,
          child: FlatButton(
            shape: CircleBorder(),
            color: primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Card",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
body: buildBody(),
      bottomNavigationBar: bottomButton(),
    );
  }

Widget buildBody(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            height: 70,
            width:500,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),

          child:  TextFormField(
decoration: InputDecoration(
    border: InputBorder.none,
  labelText: "Card Number",
  labelStyle: TextStyle(fontSize: 18)
),
          )
          ),
SizedBox(
  height:20
),
          Row(
            children: [
              Container(
                  height: 70,
                  width:200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child:  TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Expiration Date (MM/YY)",
                        labelStyle: TextStyle(fontSize: 18)
                    ),
                  )
              ),
              SizedBox(
                width:40
              ),
              Container(
                  height: 70,
                  width:70,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child:  TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "CVV",
                        labelStyle: TextStyle(fontSize: 18)
                    ),
                  )
              ),],),
              SizedBox(
                  height:20
              ),
              Container(
                  height: 70,
                  width:500,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child:  TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Cardholder Name",
                        labelStyle: TextStyle(fontSize: 18)
                    ),
                  )
              ),

        ],
      ),
    );
}



  Widget bottomButton() {
    return GestureDetector(
      onTap: () {
        print('button clicked');
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 23, 20, 23),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Card',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
SizedBox(
  width: 10,
),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

}


