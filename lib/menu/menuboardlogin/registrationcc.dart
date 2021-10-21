import 'package:flutter/material.dart';

import '../login.dart';



void main(){
  runApp(Registrationcc());
}

class Registrationcc extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Manusia {
  int ID,Umur;
  String Nama,email;

  Manusia(
      this.ID,
      this.Nama,
      this.email,
      this.Umur
      );
}

class _MyAppState extends State<Registrationcc> {
  int SelectedPageIndex = 0;
  bool IsRailExtended=false;

  List<Manusia> DaftarUser = <Manusia> [
    Manusia(1,  "Andi554@gmail.com","Andi", 20),
    Manusia(2,  "SofyanHadi2@gmail.com","Sofyan", 35)
  ];

  final formKey           = new GlobalKey<FormState>();
  var ID_Controller       = new TextEditingController();
  var Email_Controller    = new TextEditingController();
  var Name_Controller     = new TextEditingController();
  var Age_Controller      = new TextEditingController();
  var lastID=2;

  @override
  void initState() {
    super.initState();
    lastID++;
    ID_Controller.text=lastID.toString();
  }


  refreshList() {
    setState(() {
      ID_Controller.text=lastID.toString();
    });
  }

  validate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      String ID =ID_Controller.text;
      String N  =Name_Controller.text;
      String E  =Email_Controller.text;
      String A  =Age_Controller.text;

      Manusia baru = Manusia(int.parse(ID),N,E,int.parse(A));
      DaftarUser.add(baru);
      lastID++;
      refreshList();
      Email_Controller.text="";
      Name_Controller.text="";
      Age_Controller.text="";
    }
  }

  bool NotIntCheck(var N){
    final V=int.tryParse(N);

    if(V==null){
      print("Bukan Angka");
      return true;
    }
    else{
      print("Angka");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()))
          ),
          title: Text("Data Tabel"),
          centerTitle: true,
        ),
        body:
        ListView(
          children: <Widget>[
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("ID:"),
                    TextField(
                      controller:ID_Controller,
                      enabled:false,
                    ),
                    Text("Nama:"),
                    TextFormField(
                      controller: Name_Controller,
                      keyboardType: TextInputType.text,
                      validator: (val) => val!.length == 0 ? 'Masukan Nama' : null,
                    ),
                    Text("Email:"),
                    TextFormField(
                      controller: Email_Controller,
                      keyboardType: TextInputType.text,
                      validator: (val) => val!.length == 0 ? 'Masukan Email' : null,
                    ),
                    Text("Umur :"),
                    TextFormField(
                      controller: Age_Controller,
                      maxLength:2,
                      keyboardType: TextInputType.number,
                      validator: (val) => NotIntCheck(val) ? 'Masukan Umur' : null,
                    ),
                    SizedBox(
                      width:double.infinity,
                      child:RaisedButton(
                        color: Colors.green,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child:
                        Text(
                          'Tambah Data',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: validate,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text("ID"),),
                  DataColumn(label: Text("Nama"),),
                  DataColumn(label: Text("Email"),),
                  DataColumn(label: Text("Age"),),
                ],
                rows: DaftarUser.map((p) => DataRow(
                    cells: [
                      DataCell(Text(p.ID.toString()),),
                      DataCell(Text(p.email),),
                      DataCell(Text(p.Nama),),
                      DataCell(Text(p.Umur.toString()),),
                    ]),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}