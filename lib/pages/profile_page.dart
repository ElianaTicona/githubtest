import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fullname = "";
  String address = "";
  bool darkmode = false;
  int gender = 0;

  getData() async {
    SharedPreferences _mandarina = await SharedPreferences.getInstance();
    fullname = _mandarina.getString("fullname") ?? "";
    //print(fullname);
    address = _mandarina.getString("address") ?? "";
    darkmode = _mandarina.getBool("darkmode") ?? false;
    gender = _mandarina.getInt("gender") ?? 0;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('PÁGINA DE PERFIL')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                blurRadius: 12.0,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(fullname),
                subtitle: Text("Nombre completo"),
              ),
              ListTile(
                title: Text(address),
                subtitle: Text("Dirección"),
              ),
              ListTile(
                title: Text(darkmode ? "Activo" : "Inactivo"),
                subtitle: Text("Modo oscuro"),
              ),
              ListTile(
                title: Text(gender == 1 ? "Masculino" : "Femenino"),
                subtitle: Text("Género"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
