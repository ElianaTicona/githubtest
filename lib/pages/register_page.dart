import 'package:flutter/material.dart';
import 'package:flutter_5x_sharedpref/pages/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool darkmode = false;
  int gender = 1;

  // Paso 1: Declarar los controladores para controlar el texto que se escribe en ambos Textfield
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();

  // saveData(){
  //   print(fullnamecontroller.text);
  //   print(adresscontroller.text);
  //   print(darkmode);
  //   print(gender);
  // }

  //Paso 3: Crear un metodo asincrono para GUARDAR
  saveData() async {
    SharedPreferences _fresita = await SharedPreferences.getInstance();
    _fresita.setString("fullname", fullnamecontroller.text);
    _fresita.setString("address", adresscontroller.text);
    _fresita.setBool("darkmode", darkmode);
    _fresita.setInt("gender", gender);
    print("Guardando datos...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('PAGINA DE REGISTRO')),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.hdwallpapers.in/thumbs/2020/high_resolution_dark_red_background_4k_hd_red_aesthetic-t2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/1181686/pexels-photo-1181686.jpeg"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Juana Martinez',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Database User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mi perfil'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('Portafolio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ajustes'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Cambiar clave'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'AJUSTES DE PAGINA',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF424242),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller:
                    fullnamecontroller, //Paso 2: Asignar los controladores a los Textfield
                decoration: InputDecoration(
                  labelText: 'Nombre completo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller:
                    adresscontroller, //Paso 2: Asignar los controladores a los Textfield
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                ),
              ),
              SwitchListTile(
                title: Text('Modo oscuro'),
                value: darkmode,
                onChanged: (bool value) {
                  setState(() {
                    darkmode = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                "Género",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424242),
                ),
              ),
              RadioListTile(
                value: 1,
                groupValue: gender,
                title: Text("Masculino"),
                onChanged: (int? value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: gender,
                title: Text("Femenino"),
                onChanged: (int? value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    saveData();
                  },
                  icon: Icon(Icons.save),
                  label: Text(
                    "GUARDAR",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Paso 4: llamara al metodo guardar cuando se presione el boton