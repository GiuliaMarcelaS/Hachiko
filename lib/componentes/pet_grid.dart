import 'package:flutter/cupertino.dart';
import 'package:hachiko/componentes/pet.dart';
import 'package:hachiko/componentes/pet_item.dart';
import 'package:hachiko/componentes/pet_list.dart';
import 'package:provider/provider.dart';

class PetGrid extends StatelessWidget {
  const PetGrid({super.key});


  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<PetList>(context);
  final List<Pet> loadedPets = provider.items;
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedPets.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider(
          create: (_) => loadedPets[i], 
          child: const PetItem()),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ), 
        ),
    );
  }
}