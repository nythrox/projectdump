import 'package:trekkers/main.dart';
import 'package:trekkers/shared/components/custom_button.dart';
import 'package:trekkers/shared/components/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key key}) : super(key: key);
  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final _formKey = GlobalKey<FormState>();
  MaskedTextController _phoneTextController;
  TextEditingController _stateController;
  TextEditingController _cityController;

  @override
  void initState() {
    _phoneTextController = MaskedTextController(mask: '(00) 0 0000-0000');
    _stateController = TextEditingController();
    _cityController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneTextController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authBloc = AuthenticationProvider.of(context).authenticationBloc;
    final user = _authBloc.user.value;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 255, 0, 1),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text("PERFIL"),
        textTheme: TextTheme(
          title: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: MenuDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Hero(
                      tag: 'profile',
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user?.avatar ??
                            "https://cdn.cinepop.com.br/2019/10/batman-r-rated-750x380.jpg"),
                        radius: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                        '${user?.name}',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Text(
                      "Cascavel - PR",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 40, left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          left: 13, right: 13, top: 16, bottom: 16),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 242, 242, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            hintText: "Celular",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 1, height: 17),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 13, right: 13, top: 16, bottom: 16),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 242, 242, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            hintText: "Cidade",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 1, height: 17),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 13, right: 13, top: 16, bottom: 16),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 242, 242, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            hintText: "Estado",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 30, top: 30, right: 30, left: 30),
              child: CustomButton(
                  texto: 'ATUALIZAR',
                  corbt: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
