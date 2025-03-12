import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Cliente {
  String nombre;
  String apellido;
  String domicilio;
  String fechaNacimiento;

  Cliente({
    required this.nombre,
    required this.apellido,
    required this.domicilio,
    required this.fechaNacimiento,
  });
}

class MyApp extends StatelessWidget {
  final List<Map<String, String>> clientesData = [
    {
      'Nombre': 'Juan',
      'Apellido': 'Pérez',
      'Domicilio': 'Calle 123, Ciudad A',
      'Fecha_nacimiento': '1990-05-15'
    },
    {
      'Nombre': 'María',
      'Apellido': 'Gómez',
      'Domicilio': 'Avenida 456, Ciudad B',
      'Fecha_nacimiento': '1985-10-20'
    },
    {
      'Nombre': 'Carlos',
      'Apellido': 'López',
      'Domicilio': 'Calle 789, Ciudad C',
      'Fecha_nacimiento': '1995-03-25'
    },
    {
      'Nombre': 'Ana',
      'Apellido': 'Martínez',
      'Domicilio': 'Avenida 012, Ciudad D',
      'Fecha_nacimiento': '1980-12-10'
    },
    {
      'Nombre': 'Jose',
      'Apellido': 'Perea',
      'Domicilio': 'Calle Luz, Ciudad E',
      'Fecha_nacimiento': '1987-02-27'
    },
  ];

  List<Cliente> get clientes {
    return clientesData
        .map((data) => Cliente(
              nombre: data['Nombre']!,
              apellido: data['Apellido']!,
              domicilio: data['Domicilio']!,
              fechaNacimiento: data['Fecha_nacimiento']!,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Perea Listile, Mat:22308051281272'),
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            fontSize: 18, // Tamaño de fuente más pequeño
            fontWeight: FontWeight.bold,
            color: Color(0xff000000), // Color del texto
          ),
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(16),
          itemCount: clientes.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          itemBuilder: (context, index) {
            final cliente = clientes[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.primaries[index % Colors.primaries.length]
                    .withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                title: Text('${cliente.nombre} ${cliente.apellido}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Domicilio: ${cliente.domicilio}'),
                    Text('Fecha de Nacimiento: ${cliente.fechaNacimiento}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
