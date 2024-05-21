import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:visual_dictionary/ui/authenticate/authenticate_view_model.dart';

class AuthenticateView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _name = TextEditingController();
  final _surname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  AuthenticateView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AuthenticateViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: const Color(0xFF69C7D0),
        body: viewModel.hasAnAccount
            ? _signIn(viewModel.login, viewModel.changePage)
            : _signUp(viewModel.register),
      ),
    );
  }

  Widget _signIn(Function(String email, String password) login,
      VoidCallback switchWidget) {
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 1,
                            color: const Color(0xFFEC1F52),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'DictionAIry',
                          style: TextStyle(
                            color: Color(0xFFEC1F52),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/S3SNU.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Welcome back text
                const Text(
                  'TEKRAR HOŞGELDİNİZ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFEC1F52),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Please input your login details text
                const Text(
                  'Erişim sağlamak için lütfen Giriş bilgilerinizi girin.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black, // 787878 rengi
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _email,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Lütfen E-postanızı girin';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'E-postanızı giriniz',
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(120, 120, 120, 1)),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.mail, color: Color(0xFF69C7D0)),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _password,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Şifrenizi giriniz Lütfen';
                    }
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Şifrenizi giriniz',
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(120, 120, 120, 1)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF69C7D0)),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      login(
                        _email.text,
                        _password.text,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEC1F52), // Buton rengi
                  ),
                  child: const Text(
                    'Giriş Yap',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        // Şifremi unuttum işlemi
                      },
                      child: const Text(
                        'Parolanızı mı unuttunuz?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Şifremi unuttum işlemi
                      },
                      child: const Text(
                        'Şifreyi Yenile',
                        style: TextStyle(
                          color: Color(0xFFEC1F52),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () => switchWidget(),
                      child: const Text(
                        'Hesap Oluştur',
                        style: TextStyle(
                          color: Color(0xFFEC1F52),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUp(
      Function(String name, String surname, String email, String password)
          register) {
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Şimdi Üye Ol',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFEC1F52),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _name,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Lütfen adınızı giriniz';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Adınızı giriniz',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(120, 120, 120, 1),
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF69C7D0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _surname,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Lütfen soyadınızı giriniz';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Soyadınızı giriniz',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(120, 120, 120, 1),
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF69C7D0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _email,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Lütfen E-postanızı girin';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'E-postanızı giriniz',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(120, 120, 120, 1),
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF69C7D0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _password,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Şifrenizi giriniz Lütfen';
                    }
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Şifrenizi giriniz',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(120, 120, 120, 1),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF69C7D0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        register(
                          _name.text,
                          _surname.text,
                          _email.text,
                          _password.text,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text("Hesap Oluştur"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
