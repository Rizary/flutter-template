//import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:template/app/bloc/RegisterBloc.dart';
import 'package:template/app/model/core/AppProvider.dart';

class RegisterPage extends StatefulWidget {
  static const String PATH = '/register';

  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterBloc bloc;
  Color greyColor = Color.fromARGB(255, 163, 163, 163);
  var listViewKey = UniqueKey();

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _init();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Text('Nusaaidu - Daftar')
        ),
        body: SingleChildScrollView (child: Padding (
          padding: const EdgeInsets.all(16.0),        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.nameStream,
                builder: (BuildContext streamContext, AsyncSnapshot snapshot) {
                  return TextField (
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      errorText: snapshot.error,
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: bloc.nameChanged,
                  );
                },
              ),
              SizedBox (
                height: 15,
              ),
              StreamBuilder<String>(
                stream: bloc.emailStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return TextField(
                    decoration: InputDecoration(
                      labelText: 'Alamat Email',
                      errorText: snapshot.error,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: bloc.emailChanged,
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              StreamBuilder<String>(
                stream: bloc.passwordStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return TextField(
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      errorText: snapshot.error,
                    ),
                    obscureText: true,
                    onChanged: bloc.passwordChanged,
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              StreamBuilder<bool>(
                stream: bloc.registerCheck,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return RaisedButton(
                    child: Text('Daftar'),
                    onPressed: snapshot.hasData 
                      ? () => print('Daftar') 
                      : null
                  );
                },
              ),
 
            ],
          ),
        )
        )
    );
  }

  void _init(){
    if(null == bloc){
      bloc = RegisterBloc(AppProvider.getApplication(context));
      //bloc.loadFeedList();
    }
  }
}
