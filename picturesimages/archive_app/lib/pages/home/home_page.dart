import 'package:archive_app/shared/components/searchbar.dart';
import 'package:archive_app/shared/components/small_asset.dart';
import 'package:archive_app/shared/utils/functional_flutter_hooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Searchbar("Search in memes..."),
            ),
          ),
          HomePageAssetsFragment()
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Color(0xff2B2B2B),items: [
        BottomNavigationBarItem(icon: Icon(Icons.filter),title: Text("")),
        BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("")),
      ]),
    );
  }
}

class HomePageAssetsFragment extends StatelessWidget {
  const HomePageAssetsFragment();
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      shrinkWrap: true,
      children: List.generate(
          10,
          (index) => SmallAssetCard(
              title: const Text("Stolen memes"),
              background: const FlutterLogo(),
              onTap: () {
                print("changed page" + DateTime.now().toIso8601String());
              },
              settingsButton: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () => showEditAssetSheet(context)),
              ))),
    );
  }
}

showEditAssetSheet(BuildContext context) {
  showModalBottomSheet(
      context: context, builder: (c) => EditAssetBottomSheet());
}

class EditAssetBottomSheet extends StatelessWidget {
  const EditAssetBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          decoration: BoxDecoration(
              color: Color(0xff494949),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Material(
            child: Column(children: [
              ListTile(
                leading: IconButton(icon: Icon(Icons.folder), onPressed: () {}),
                title: Text("DogeMeme.png"),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                onTap: () {},
                leading: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                title: Text("Edit file"),
              ),
              ListTile(
                onTap: () {},
                leading: IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                title: Text("Delete file"),
              ),
              ListTile(
                onTap: () {},
                leading: IconButton(icon: Icon(Icons.share), onPressed: () {}),
                title: Text("Share"),
              )
            ]),
          )),
    );
  }
}
