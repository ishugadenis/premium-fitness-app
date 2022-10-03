import 'package:flutter/material.dart';

class AuthenticationForm extends StatefulWidget {
  //const AuthenticationForm({Key? key}) : super(key: key);
  AuthenticationForm(
    this.submitFn, this.isLoading

      );

  final bool isLoading;
  final void Function(
      String email,
      String password,
      String username,
      bool isLogin,
      BuildContext context,
      ) submitFn;
  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {

  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName ='';
  var _userPassword='' ;


  void _trySubmit(){
   final _isValid= _formKey.currentState!.validate();
   FocusScope.of(context).unfocus();

   if (_isValid){
     _formKey.currentState!.save();
     widget.submitFn(
       _userEmail,
       _userPassword,
       _userName,
       _isLogin,
         context,
     );
   }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Form(
              key:_formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('email'),
                    validator:(value){
                     if(value!.isEmpty || !value.contains('@')) {
                       return 'Please enter a valid email address';
                     }
                     return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address'
                    ),
                    onSaved: (value){
                      _userEmail =value!;
                    },

                  ),
                  if(!_isLogin)
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (value){
                     if(value!.isEmpty || value.length<4 ){
                       return 'Please enter atleast 4 characters';
                     }
                    },
                    decoration: InputDecoration(
                      labelText: 'Username'
                    ),
                    onSaved: (value){
                      _userName =value!;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value){
                      if(value!.isEmpty || value.length< 7){
                        return 'Password should be atleast 7 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                     labelText:  'Password',
                    ),
                    onSaved: (value){
                      _userPassword =value!;
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 12,),

                  if(widget.isLoading)
                    CircularProgressIndicator(),
                  if(!widget.isLoading)
                  RaisedButton(onPressed: _trySubmit,
                  child: Text(_isLogin ? 'Log In' : 'Sign Up'),
                  ),
                  if(!widget.isLoading)
                  FlatButton(onPressed:(){
                    setState(() {
                      _isLogin =!_isLogin;
                    });

                  },
                      textColor: Theme.of(context).primaryColor,
                   child: Text(_isLogin ? 'Create New Account': 'I already have an account'))

                ],
              ),
            ),
          ),
        ),

        ),


    );
  }
}
