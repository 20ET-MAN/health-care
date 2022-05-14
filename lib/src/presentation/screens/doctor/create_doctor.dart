import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthcare/src/presentation/controller/doctor_controller.dart';
import 'package:intl/intl.dart';

import '../../config/app_color.dart';
import '../../config/app_style.dart';
import '../../controller/validator_controller.dart';
import '../../widget/app_next_bt.dart';
import '../../widget/app_text_field.dart';

class CreateDoctor extends StatefulWidget {
  const CreateDoctor({Key? key}) : super(key: key);

  @override
  State<CreateDoctor> createState() => _CreateDoctorState();
}

class _CreateDoctorState extends State<CreateDoctor> {
  final TextEditingController eMail = TextEditingController();

  final TextEditingController description = TextEditingController();

  final TextEditingController rank = TextEditingController();

  final TextEditingController fullName = TextEditingController();

  final TextEditingController dateOFBirth = TextEditingController();

  final TextEditingController phone = TextEditingController();

  final FocusNode _focusNodeEmail = FocusNode();

  final FocusNode _phone = FocusNode();

  final FocusNode _focusNodeDescription = FocusNode();

  final FocusNode _focusNodePassWord = FocusNode();

  final FocusNode _focusNodeConfirmPassWord = FocusNode();

  final FocusNode _fullName = FocusNode();

  final FocusNode _dateOfBirth = FocusNode();

  final GlobalKey _globalKey = GlobalKey();

  DateTime selectedDate = DateTime.now();

  final List<String> userItems = [
    'user',
    'admin',
  ];
  final List<String> sexItems = [
    'Nam',
    'Nữ',
  ];
  final List<String> departmentsItems = [
    'Hồi sức cấp cứu',
    'Mắt',
    'Tai mũi họng',
    'Thần kinh',
    'Chấn thương chỉnh hình',
    'Hồi sức tích cực',
    'Xương khớp',
    'Tim mạch',
    'Nội khoa',
    'Ngoại khoa',
  ];
  String? selectedSex;
  String? selectedDepartments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      appBar: AppBar(
        backgroundColor: AppColor.colorWhile,
        title: const Text('Thêm bác sĩ'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          unFocus();
        },
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Form(
                  key: _globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Full name',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        textCapitalization: TextCapitalization.words,
                        hint: 'Họ tên',
                        controller: fullName,
                        focusNode: _fullName,
                      ),
                      Row(
                        children: [
                          Text(
                            'Date of Birth',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.colorWhile,
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextField(
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom *
                                          4),
                              controller: dateOFBirth,
                              focusNode: _dateOfBirth,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.calendar_today_outlined,
                                  color: AppColor.colorOrange,
                                ),
                                contentPadding: const EdgeInsets.all(20),
                                filled: true,
                                fillColor: AppColor.colorWhile,
                                hintText: "Ngày sinh",
                                hintStyle: AppStyle()
                                    .heading4
                                    .copyWith(color: AppColor.colorGrey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              //style: AppStyle().heading4,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Giới tính',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.colorWhile,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'Giới tính',
                            style: TextStyle(fontSize: 14),
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColor.colorOrange,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding:
                              const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          items: sexItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select gender.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedSex = value.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Phone',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        hint: 'Số điện thoại',
                        textInputType: TextInputType.phone,
                        controller: phone,
                        focusNode: _phone,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Description',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        //textCapitalization: TextCapitalization.words,
                        hint: 'Mô tả',
                        controller: description,
                        focusNode: _focusNodeDescription,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Rank',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        focusNode: _focusNodePassWord,
                        hint: 'Cấp bậc',
                        controller: rank,
                        textInputFormatter: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'[/\\á-úÁ-Ú|]')),
                        ],
                        validator: (value) =>
                            Validator.validatePassword(password: value),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Departments',
                            style: AppStyle().heading2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.colorWhile,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'Chuyên khoa',
                            style: TextStyle(fontSize: 14),
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColor.colorOrange,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding:
                              const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            color: AppColor.colorOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          items: departmentsItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select gender.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedDepartments = value.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      AppNextBt(
                        onPressed: () async {
                          if ((selectedSex ?? '').isEmpty) {
                            EasyLoading.showError(
                                'Giới tính là trường bắt buộc');
                          } else if ((selectedDepartments ?? '').isEmpty) {
                            EasyLoading.showError(
                                'Chuyên khoa là trường bắt buộc');
                          } else {
                            createDoctor();
                          }
                        },
                        label: 'Thêm tài khoản',
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void unFocus() {
    _focusNodePassWord.unfocus();
    _focusNodeEmail.unfocus();
    _focusNodeConfirmPassWord.unfocus();
    _focusNodeDescription.unfocus();
    _fullName.unfocus();
    _dateOfBirth.unfocus();
    _phone.unfocus();
  }

  Future<void> createDoctor() async {
    if (fullName.text.length < 8 || fullName.text.length > 32) {
      EasyLoading.showError('Họ Tên tài khoản phải có 8 -32 kí tự');
    } else if (dateOFBirth.text.isEmpty) {
      EasyLoading.showError('Vui lòng chọn ngày sinh');
    } else if (phone.text.length < 10 || phone.text.length > 10) {
      EasyLoading.showError('Số điện thoại phải gồm 10 kí tự');
    } else if (description.text.length < 32) {
      EasyLoading.showError('Mô tả ít nhất 32 kí tự');
    } else if (rank.text.length < 8) {
      EasyLoading.showError('Cấp bậc ít nhất 8 kí tự');
    } else {
      DoctorController().doctorSetup(
          dateOfBirth: dateOFBirth.text,
          departments: selectedDepartments!,
          description: description.text,
          imageUrl: '',
          phone: phone.text,
          fullName: fullName.text,
          rank: rank.text,
          sex: selectedSex!,
          typeDoctor: 0);
      EasyLoading.showSuccess('Tạo tài khoản thành công',
          maskType: EasyLoadingMaskType.custom);
      context.router.pop();
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1901, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
          String convertedDateTime = DateFormat.yMd().format(selectedDate);
          dateOFBirth.value = TextEditingValue(text: convertedDateTime);
        },
      );
    }
  }
}
