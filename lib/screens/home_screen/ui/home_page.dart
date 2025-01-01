import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/form_screen/ui/form_page.dart';
import 'package:untitled/screens/home_screen/bloc/home_bloc.dart';
import 'package:untitled/screens/products/ui/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeNavigationToProductScreenState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductsScreen()));
          } else if (state is HomeNavigationToFormScreenState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocFormScreen()));
          } 
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Assignment"),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: Text('Assignment'),
                  ),
                  ListTile(
                    title: const Text('Products'),
                    onTap: () {
                      print("On Tap Event");
                      homeBloc.add(HomeNavigationToProductsScreen());
                    },
                  ),
                  ListTile(
                    title: const Text('Form'),
                    onTap: () {
                      homeBloc.add(HomeNavigationToFormScreen());
                    },
                  ),
                  
                ],
              ),
            ),
            body: const Center(
              child: Text("Assignment"),
            ),
          );
        },
      ),
    );
  }
}
