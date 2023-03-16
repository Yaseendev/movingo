import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onSignUp;
  const LoginForm({
    super.key,
    required this.onSignUp,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            TextFormField(
             // key: _emailKey,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)),
                hintText: 'E-mail',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              //autofocus: true,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              maxLines: 1,
              initialValue: email,
              onChanged: (value) => email = value,
              validator: (value) {
                return !GetUtils.isEmail(value ?? '')
                    ? 'Please enter a valid email'
                    : null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)),
                hintText: 'Password',
                // labelText: 'Password',
                prefixIcon: Icon(Icons.password),
                suffixIcon: passwordVisible
                    ? IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () => setState(() {
                          passwordVisible = false;
                        }),
                      )
                    : IconButton(
                        onPressed: () => setState(() {
                          passwordVisible = true;
                        }),
                        icon: const Icon(Icons.visibility_off),
                      ),
              ),
              keyboardType: TextInputType.visiblePassword,
              maxLines: 1,
              onChanged: (value) => password = value,
              obscureText: passwordVisible,
              validator: (value) {
                return value!.trim().isNotEmpty
                    ? value.trim().length > 6
                        ? null
                        : 'Password must be longer than 6 characters'
                    : 'This field is required';
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
