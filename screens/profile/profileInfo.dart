import 'package:doctor/core/constant/imagePaths.dart';
import 'package:doctor/core/constant/listConstant.dart';
import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/screens/profile/service/profileController.dart';
import 'package:doctor/screens/profile/widgets/dateInput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicInformationPage extends StatefulWidget {
  const BasicInformationPage({super.key});

  @override
  State<BasicInformationPage> createState() => _BasicInformationPageState();
}

class _BasicInformationPageState extends State<BasicInformationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController adderessController = TextEditingController();
  final ProfileController profileController = Get.put(ProfileController());
  List<String> gender = ['Male', 'Female'];
  var state = '';
  var selectedGender = '';

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return Scaffold(
        backgroundColor: const Color(0xffFAFFFE),
        appBar: AppBar(
          backgroundColor: const Color(0xffFAFFFE),
          centerTitle: true,
          title: Text(
            'Fill Basic Information',
            style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.blackText),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: width * 0.2,
                  width: width * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        18), // Apply border radius to the image
                    child: Image.asset(
                      ImagePaths.profileAvatar,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Upload Profile Picture',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xff011411),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                _buildLabelText("Your name*"),
                const SizedBox(
                  height: 10,
                ),
                _buildTextField(
                  controller: nameController,
                  hint: 'Enter name',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                _buildLabelText('your phone*'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xffF1F4F3),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xffF1F4F3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            ImagePaths.indFlag, // Add your flag asset here
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 4),
                          const Text('+91', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildTextField(
                          hint: '1213432423', controller: phoneController),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.check_circle, color: Colors.green),
                    // DateInputField(
                    //     hint: 'Select Date', controller: nameController)
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                _buildLabelText('Date of Birth*'),
                const SizedBox(
                  height: 10,
                ),
                DateInputField(
                  hint: 'select Date',
                  controller: dobController,
                  icon: Icons.date_range,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                _buildLabelText('Gender'),
                const SizedBox(
                  height: 10,
                ),
                _buildGenderDropdown(gender),
                SizedBox(
                  height: height * 0.02,
                ),
                _buildLabelText('state'),
                const SizedBox(
                  height: 10,
                ),
                _buildStateDropdown(ListConstants.states),
                SizedBox(
                  height: height * 0.02,
                ),
                _buildLabelText('Adderess'),
                SizedBox(
                  height: 10,
                ),
                _buildTextField(
                    hint: 'Enter adderess', controller: adderessController),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                    height: height * 0.07,
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () async {
                        await profileController.createProfile(
                            name: nameController.text,
                            dob: dobController.text,
                            adderess: 'Samastipur, Bihar');
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 60),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: const BoxDecoration(
                            color: Color(0xff2A9988),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: Text(
                            "Save",
                            style: GoogleFonts.rubik(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                height: 15 / 20,
                                color: const Color(0xffFAFFFE)),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  Widget _buildLabelText(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: GoogleFonts.lato(
            color: AppColors.blackText,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 12 / 18),
      ),
    );
  }

  Widget _buildTextField(
      {required String hint,
      required TextEditingController controller,
      TextInputType inputType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.lato(
            color: AppColors.blackText,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 14 / 18),
        filled: true,
        fillColor: const Color(0xffF1F4F3),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xffF1F4F3)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        focusedBorder: InputBorder.none,
      ),
    );
  }

  Widget _buildGenderDropdown(List<String> items) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xffF1F4F3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffF1F4F3)),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: items[0],
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: GoogleFonts.lato(
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 14 / 18),
            ),
          );
        }).toList(),
        onChanged: (value) {
          selectedGender = value!;
        },
      ),
    );
  }

  Widget _buildStateDropdown(List<String> items) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xffF1F4F3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffF1F4F3)),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: items[0],
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: GoogleFonts.lato(
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 14 / 18),
            ),
          );
        }).toList(),
        onChanged: (value) {
          state = value!;
        },
      ),
    );
  }
}
