import 'package:beauty/src/bloc/auth/auth_event.dart';
import 'package:beauty/src/bloc/auth/auth_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth/auth_bloc.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: 
         BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamed(context, '/home');
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
                    TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password')),
                    
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(LoginEvent(
                          emailController.text,
                          passwordController.text,
                        ));
                      },
                      child: Text('Login'),
                    ),
                    
                  ],
                ),
              );
            },
          ),
        ),
      
    );
  }
}
