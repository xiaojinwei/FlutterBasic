import 'package:flutter/material.dart';
import 'package:flutter_basic/presentation/platform_adaptive.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_basic/models/app_state.dart';
import 'package:flutter_basic/actions/auth_actions.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.ac_unit), onPressed: ()=>{

          })
        ],
      ),
      body: new Container(
        child: new Padding(
            padding: new EdgeInsets.fromLTRB(32, MediaQuery.of(context).padding.top + 32, 32, 32),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                  child: new Center(
                    child: new FlutterLogo(
                      colors: Colors.blue,
                      size: 180,
                    ),
                  )
              ),
              new LoginForm(),
            ],
          ),
        ),
      ),
    );
  }

}

class LoginForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm>{

  final _formKey = new GlobalKey<FormState>();

  FocusNode _passwordFocusNode;

  String _username;
  String _password;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  void _submit(){
    var formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,dynamic>(
      converter: (Store<AppState> store){
        return (BuildContext context,String username,String password) => 
              store.dispatch(login(context,username,password));
      },
      builder: (context,loginAction){
        return new Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(labelText: '请输入用户名',hintText: 'Username'),
                  validator: (val) =>
                  val.isEmpty ? 'Please enter your username.' : null,
                  onSaved: (val) => _username = val,
                  onFieldSubmitted: (v) => FocusScope.of(context).requestFocus(_passwordFocusNode),
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: '请输入密码',hintText: 'Password'),
                  validator: (val) =>
                  val.isEmpty ? 'Please enter your password.' : null,
                  onSaved: (val) => _password = val,
                  focusNode: _passwordFocusNode,
                  onFieldSubmitted: (value) => _submit(),
                ),
                new Padding(
                    padding: EdgeInsets.only(top: 20),
                  child: PlatformAdaptiveButton(
                    icon: Icon(Icons.done),
                    child: new Text('Log In'),
                    onPressed: (){
                      _submit();
                      loginAction(context,_username,_password);
                    },
                  ),
                )
              ],
            )
        );
      },
    );
  }

}