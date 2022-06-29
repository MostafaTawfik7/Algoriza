import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task1/screens/login.dart';
import 'package:task1/screens/onboarding.dart';
import 'package:task1/widgets/componants.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.asset(
                    'assets/images/bk2.jpg',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.18,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 16),
                    child: MaterialButton(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        navigateTo(context, OnBoardingScreen());
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome to fashion Daily'),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: const [Text('Help'), Icon(Icons.help)],
                            ))
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Email'),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      hint: 'Eg.example@gmail.com',
                      textValidator: 'enter email address is required',
                    ),
                    const SizedBox(height: 8.0),
                    const Text('Phone Number'),
                    const SizedBox(height: 8.0),
                    IntlPhoneField(
                      initialCountryCode: 'EG',
                      dropdownIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      controller: phoneController,
                      showCountryFlag: false,
                      disableLengthCheck: false,
                      dropdownTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 16),
                      flagsButtonMargin: const EdgeInsets.only(left: 16),
                      dropdownIconPosition: IconPosition.trailing,
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        fillColor: Colors.grey.shade50,
                        hintText: '1012151434',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      onCountryChanged: (country) {
                        print('Country changed to: ' + country.name);
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Text('Password'),
                    const SizedBox(height: 8.0),
                    MyTextFormField(
                      controller: passwordController,
                      type: TextInputType.text,
                      hint: 'Password',
                      textValidator: 'enter Password is required',
                      isPassword: true,
                      suffixIcon: Icons.visibility,
                    ),
                    const SizedBox(height: 30),
                    MyButton(
                      text: 'Register',
                      onClick: () {
                        if (formkey.currentState!.validate()) {}
                      },
                      color: Colors.blue,
                      width: double.infinity,
                      radius: 2,
                    ),
                    const SizedBox(height: 30),
                    divider(),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      height: 55,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(2)),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google1.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Sign with by google',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Has any account ? '),
                        TextButton(
                            onPressed: () {
                              navigateTo(context, LoginScreen());
                            },
                            child: const Text('Sign here'))
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'By registering your account ,you agree to our',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'terms and conditions',
                            style: TextStyle(fontSize: 12),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


