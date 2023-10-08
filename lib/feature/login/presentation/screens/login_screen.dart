import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_acrtect/feature/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_clean_acrtect/feature/login/presentation/widgets/textfiled.dart';
import 'package:flutter_clean_acrtect/shared/common_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSnackbar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void _lisenLogin(BuildContext context, LoginState state) {
    state.whenOrNull(
      succes: (user) => _showSnackbar('Login succes'),
      error: (mesaage) => _showSnackbar('Login Failed ,$mesaage'),
    );
  }

  void _handleOnLogin() {
    context.read<LoginBloc>().add(Login(
        username: _userNameController.text,
        password: _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonTextFormFiled(
                    validator: (value) =>
                        CommonValidators.emptyValidator('username', value),
                    controller: _userNameController,
                    labelText: 'Username'),
                const SizedBox(
                  height: 20,
                ),
                CommonTextFormFiled(
                    validator: (value) =>
                        CommonValidators.emptyValidator('password', value),
                    controller: _passwordController,
                    labelText: 'Password'),
                const SizedBox(
                  height: 10,
                ),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) => _lisenLogin(context, state),
                  builder: (context, state) {
                    return state.maybeWhen(
                        loading: () => const CircularProgressIndicator(),
                        orElse: () => ElevatedButton(
                            onPressed: _handleOnLogin,
                            child: const Text('Login')));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
