import 'package:dogbin_mobile/models/user.dart';
import 'package:dogbin_mobile/providers/dogbin_login_provider.dart';
import 'package:dogbin_mobile/service_locator.dart';
import 'package:dogbin_mobile/views/documents_view.dart';
import 'package:dogbin_mobile/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final waiting = StateProvider<bool>((ref) => false);

class LoginView extends StatelessWidget {
  static const String id = '/login';

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'LoginForm');

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(
          builder: (BuildContext context,
              T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
            StateController<bool> ignore = watch(waiting);

            return IgnorePointer(
              ignoring: ignore.state,
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 8),
                      !ignore.state
                          ? OutlineButton(
                              child: Text('Login'),
                              onPressed: () async {
                                ignore.state = true;
                                try {
                                  await doLogin();
                                } catch (e) {
                                  print(e);
                                }
                                ignore.state = false;
                              })
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> doLogin() async {
    {
      if (_formKey.currentState.validate()) {
        try {
          final login = locator<DogbinLogin>();
          User user = await login.login(
              _usernameController.text, _passwordController.text);
          Navigator.pushNamedAndRemoveUntil(_formKey.currentContext,
              DocumentsView.id, ModalRoute.withName(HomeView.id),
              arguments: user);
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
