import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/login/login_bloc.dart';
import 'package:flutter_ecatalog/data/models/request/login_request_model.dart';
import 'package:flutter_ecatalog/presentation/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Text("Login User")),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "password"),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ));
                }
                if (state is LoginLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('berhasil register'),
                    backgroundColor: Colors.green,
                  ));
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                    onPressed: () {
                      final requestModel = LoginRequestModel(
                          email: emailController!.text,
                          password: passwordController!.text);
                      context
                          .read<LoginBloc>()
                          .add(DoLoginEvent(model: requestModel));
                    },
                    child: const Text("Login"));
              },
            )
          ],
        ),
      ),
    );
  }
}
