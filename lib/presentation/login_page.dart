import 'package:flutter/material.dart';

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
      body: Column(
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
          ElevatedButton(onPressed: () {}, child: const Text("Login"))
        ],
      ),
    );
  }
}
