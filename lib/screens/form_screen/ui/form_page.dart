import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/form_screen/bloc/form_bloc.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';

class BlocFormScreen extends StatelessWidget {
  BlocFormScreen({super.key});
  final TextEditingController selectedCountry = TextEditingController();
  final TextEditingController selectedState = TextEditingController();
  final TextEditingController selectedCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formBloc = FormBloc();
    return BlocProvider(
      create: (context) => formBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Validation'),
          backgroundColor: Colors.teal,
        ),
        body: BlocBuilder<FormBloc, AppFormState>(builder: (context, state) {
          String? selectedGender;
          if (state is GenderValidState) {
            selectedGender = state.gender;
          }
          return Container(
            padding: const EdgeInsets.all(30),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        formBloc.add(NameChanged(name: value));
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        errorText: state is NameInvalidState ? state.error : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0), // Set border radius
                          borderSide: BorderSide(
                            color: Colors.grey, // Default border color
                            width: 1.0,         // Default border width
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey, // Border color when enabled
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.blue, // Border color when focused
                            width: 2.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red, // Border color when there's an error
                            width: 1.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red, // Border color when focused and there's an error
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                        hintText: 'Enter your name',
                      ),
                    ),
                      const SizedBox(height: 10,),
                   TextField(
                    onChanged: (value) {
                      formBloc.add(EmailChanged(email: value));
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: state is EmailInvalidState ? state.error : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        borderSide: BorderSide(
                          color: Colors.grey, // Default border color
                          width: 1.0,         // Default border width
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.grey, // Border color when enabled
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.blue, // Border color when focused
                          width: 2.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.red, // Border color when there's an error
                          width: 1.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.red, // Border color when focused and there's an error
                          width: 2.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                      hintText: 'Enter your email',
                    ),
                  ),
                  const SizedBox(height: 10,), // Add spacing between fields
                    TextField(
                      onChanged: (value) {
                        formBloc.add(PhoneChanged(phone: value));
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        errorText: state is PhoneInvalidState ? state.error : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                          borderSide: BorderSide(
                            color: Colors.grey, // Default border color
                            width: 1.0,         // Default border width
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey, // Border color when enabled
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.blue, // Border color when focused
                            width: 2.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red, // Border color when there's an error
                            width: 1.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red, // Border color when focused and there's an error
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                        hintText: 'Enter your phone number',
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: selectedGender,
                      hint: const Text("Select Gender"),
                      items: ['Male', 'Female', 'Other']
                          .map((gender) => DropdownMenuItem<String>(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (value) {
                        formBloc.add(GenderChanged(value!));
                      },
                     decoration: InputDecoration(
                        errorText: state is GenderInvalidState ? state.errorMessage : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0), // Adjust radius as needed
                          borderSide: BorderSide(
                            color: Colors.grey, // Border color
                            width: 1.0,         // Border width
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey, // Border color when enabled
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.teal, // Border color when focused
                            width: 2.0,         // Border width when focused
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red, // Border color when there's an error
                            width: 2.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red, // Border color when focused with an error
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                        hintText: 'Enter your gender',
                      ),
                    ),
                    const SizedBox(height: 10,),
                    CountryStateCityPicker(
                      country: selectedCountry, // Pass the selected country
                      state: selectedState, // Pass the selected state
                      city: selectedCity, // Pass the selected city
                      dialogColor: Colors.grey.shade200,
                      textFieldDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0), // Set border radius
                          borderSide: BorderSide(
                            color: Colors.grey, // Border color
                            width: 1.0,         // Border width
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey, // Border color when enabled
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.blue, // Border color when focused
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                        hintText: 'Select',
                      ),
                    ),
                   
                   
                    const SizedBox(height: 60),
                    SizedBox(
                      width: double.infinity, // Match parent width
                      child: ElevatedButton(
                        onPressed: () {
                          // formBloc.add(FormSubmitted());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal, // Teal background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.0), // Vertical padding
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 16.0, // Text size
                            fontWeight: FontWeight.bold, // Text style
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
