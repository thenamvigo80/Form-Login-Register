import 'package:flutter/material.dart';

class FormDangNhap extends StatefulWidget {
  const FormDangNhap({super.key});

  @override
  State<FormDangNhap> createState() => _FormDangNhapState();
}

class _FormDangNhapState extends State<FormDangNhap> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng nhập thành công'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ===== HEADER =====
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              "FORM ĐĂNG NHẬP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 30),

          // ===== FORM =====
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Username
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: "Họ tên",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập Họ tên";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Password
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Mật khẩu",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập mật khẩu";
                      }
                      if (value.length < 6) {
                        return "Mật khẩu phải >= 6 ký tự";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // Button Login
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: _login,
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ===== LINK SANG FORM ĐĂNG KÝ =====
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      "Chưa có tài khoản? Đăng ký",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
