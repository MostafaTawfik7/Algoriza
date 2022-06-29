import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task1/screens/register.dart';
import 'package:task1/widgets/componants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/bk2.jpg',
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.30,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome to fashion Daily'),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign in',
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
                    const Text('Phone Number'),
                    const SizedBox(height: 8.0),
                    IntlPhoneField(
                      initialCountryCode: 'EG',
                      dropdownIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      controller: phoneController,
                      // disableLengthCheck: true,
                      showCountryFlag: false,
                      dropdownTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 16),
                      flagsButtonMargin: const EdgeInsets.only(left: 16),
                      dropdownIconPosition: IconPosition.trailing,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade50,
                        filled: true,
                        hintText: '1012151434',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      validator: (p0) {
                        if (p0!.completeNumber.isEmpty) {
                          return 'Phone number is not registered';
                        }
                      },
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      onCountryChanged: (country) {
                        print('Country changed to: ' + country.name);
                      },
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      text: 'Sign in',
                      onClick: () {
                        if (formkey.currentState!.validate()) {}
                      },
                      color: Colors.blue,
                      width: double.infinity,
                      radius: 2,
                    ),
                    const SizedBox(height: 20),
                    divider(),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Doesn\'t has any account ? '),
                        TextButton(
                            onPressed: () {
                              navigateTo(context, RegisterScreen());
                            },
                            child: const Text('Register here'))
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'Use the appliction according to policy rules,Any kinds of violations willbe subject to sanctions.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
