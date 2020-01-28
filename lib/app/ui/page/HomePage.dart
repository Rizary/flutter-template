import 'package:fluro/fluro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:template/app/bloc/HomeBloc.dart';
import 'package:template/app/model/core/AppProvider.dart';
import 'package:template/app/ui/page/RegisterPage.dart';
import 'package:template/app/ui/page/DashboardPage.dart';

class HomePage extends StatefulWidget {
  static const String PATH = '/';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    HomeBloc bloc;
    //TapGestureRecognizer _tapRecognizer;
    Color greyColor = Color.fromARGB(255, 163, 163, 163);

    @override
    void dispose() {
      super.dispose();
      bloc.dispose();
      //_tapRecognizer.dispose();
    }

    @override
    Widget build(BuildContext context) {
      _init(context);
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              title: Text('Template - Title of App')
          ),
          body: SingleChildScrollView (child: Padding (
            padding: const EdgeInsets.all(16.0),        
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                  stream: bloc.loginCheck,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return RaisedButton(
                      child: Text('Masuk'),
                      onPressed: snapshot.hasData 
                        ? () {  print('Masuk');
                                AppProvider.getRouter(context)
                                  .navigateTo(context, DashboardPage.PATH);
                             }
                        : null
                    );
                  },
                ),
                
                RichText( 
                  text: TextSpan (
                    children: [
                      TextSpan (
                        text: "Belum punya Akun? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan (
                        text: "Daftar disini",
                        style: TextStyle(color: Colors.blue),
                        recognizer: new TapGestureRecognizer() //_tapRecognizer
                          ..onTap = () {
                            return AppProvider.getRouter(context)
                              .navigateTo(context, RegisterPage.PATH, transition: TransitionType.fadeIn);
                          },
                      ),
                    ],
                  ),
                ),
   
              ],
            ),
          )
          )
      );
    }

    void _init(BuildContext context){
      if(null == bloc){
        bloc = HomeBloc(AppProvider.getApplication(context));
        //bloc.loadFeedList();
      }
    }
}
