import 'package:flutter/material.dart';

class FormDangKy extends StatefulWidget {
  const FormDangKy({super.key});

  @override
  State<FormDangKy> createState() => _FormDangKyState();
}

class _FormDangKyState extends State<FormDangKy> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  bool _obscurePass = true;
  bool _obscureConfirmPass = true;

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Đăng ký thành công"),
          backgroundColor: Colors.green,
        ),
      );

      // ⏱ Đợi 1 chút rồi quay về Form đăng nhập
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context); // quay về /login
      });
    }
  }

  OutlineInputBorder _roundedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    );
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
              "FORM ĐĂNG KÝ TÀI KHOẢN",
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
                  // Họ tên
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Họ tên",
                      prefixIcon: const Icon(Icons.person),
                      border: _roundedBorder(),
                      enabledBorder: _roundedBorder(),
                      focusedBorder: _roundedBorder(),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Vui lòng nhập họ tên" : null,
                  ),

                  const SizedBox(height: 20),

                  // Email
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      border: _roundedBorder(),
                      enabledBorder: _roundedBorder(),
                      focusedBorder: _roundedBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return "Vui lòng nhập email";
                      if (!value.contains("@")) return "Email không hợp lệ";
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Mật khẩu
                  TextFormField(
                    controller: passController,
                    obscureText: _obscurePass,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      prefixIcon: const Icon(Icons.lock),
                      border: _roundedBorder(),
                      enabledBorder: _roundedBorder(),
                      focusedBorder: _roundedBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePass
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePass = !_obscurePass;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return "Vui lòng nhập mật khẩu";
                      if (value.length < 6) return "Mật khẩu phải >= 6 ký tự";
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Xác nhận mật khẩu
                  TextFormField(
                    controller: confirmPassController,
                    obscureText: _obscureConfirmPass,
                    decoration: InputDecoration(
                      labelText: "Xác nhận mật khẩu",
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: _roundedBorder(),
                      enabledBorder: _roundedBorder(),
                      focusedBorder: _roundedBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPass
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPass = !_obscureConfirmPass;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return "Vui lòng xác nhận mật khẩu";
                      if (value != passController.text) {
                        return "Mật khẩu không trùng khớp";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // Button đăng ký
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _register,
                      child: const Text(
                        "Đăng ký",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ===== QUAY VỀ ĐĂNG NHẬP =====
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Đã có tài khoản? Đăng nhập"),
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
