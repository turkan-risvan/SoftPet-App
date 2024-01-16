import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softpati/theme/app_color.dart';
import 'package:softpati/view/petProfile/pet_profile_page.dart';
import 'package:softpati/view_model/profile_page_view_model.dart';

class ProfileAdoptionPage extends StatelessWidget {
  const ProfileAdoptionPage({super.key});

  @override
  Widget build(BuildContext context) {
   ProfilePageViewModel viewModel = Provider.of<ProfilePageViewModel>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "İLANLARIM",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: () {
          viewModel.openAddPetPage(context);
        },
        backgroundColor: ConstantsColor.bottomNavColor,
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<ProfilePageViewModel>(
      builder: (context, viewModel, child) => viewModel.type == 'Sahiplendirme'
          ? ListView.builder(
        itemCount: viewModel.pets.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Color.fromARGB(255, 255, 255, 255),
            child: _buildListTile(index),
          );
        },
      )
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: viewModel.pets.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Color.fromARGB(255, 255, 255, 255),
            child: _buildGridView(index),
          );
        },
      ),
    );
  }

  Widget _buildListTile(int index) {
    return Consumer<ProfilePageViewModel>(
      builder: (context, viewModel, child) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PageProfilePet(viewModel.pets[index])),
        ),
        child: ListTile(
          title: Align(
            alignment: Alignment.center,
            child: Text(viewModel.pets[index].name,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 20)),
          ),
          subtitle: Row(
            children: [
              CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(viewModel.pets[index].image)),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Tür: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        viewModel.pets[index].type,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Cinsiyet: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        viewModel.pets[index].gender,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Tarih: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        viewModel.pets[index].date,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Şehir: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        viewModel.pets[index].city,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildGridView(int index) {
  return Consumer<ProfilePageViewModel>(
    builder: (context, viewModel, child) => GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PageProfilePet(viewModel.pets[index])),
      ),
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(viewModel.pets[index].image)),
            Text(
              viewModel.pets[index].name,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Text(
                  'Tür: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
                Text(
                  viewModel.pets[index].type,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Cinsiyet: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
                Text(
                  viewModel.pets[index].gender,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Tarih: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
                Text(
                  viewModel.pets[index].date,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Şehir: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
                Text(
                  viewModel.pets[index].city,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
