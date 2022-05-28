import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:healthcare/src/presentation/widget/app_next_bt.dart';
import 'package:healthcare/src/presentation/widget/app_text_field.dart';
import 'package:intl/intl.dart';

import '../../controller/booking_controller.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController dateOFBirth = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController dayDate = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final FocusNode _dateOfBirth = FocusNode();
  final FocusNode _description = FocusNode();
  final FocusNode _fullName = FocusNode();
  final FocusNode _dayDate = FocusNode();
  final FocusNode _phone = FocusNode();
  final List<String> sexItems = [
    'Nam',
    'Nữ',
  ];
  final List<String> serviceItem = [
    'Khám Chấn Thương Chỉnh Hình',
    'Khám Phụ Sản',
    'Khoa Cấp Cứu',
    'khoa Mắt',
    'Khám Nội Tổng Quát(Hô hấp)',
    'Khám khoa Nhi ',
  ];
  final List<String> doctorItem = [
    'BSCKII Đặng Quang Thuyết',
    'TS.BS. Tạ Thị Thanh Thủy',
    'ThS.BS Nguyễn Hữu Tùng',
    'BSCKII Trịnh Bạch Tuyết',
    'BSCKII Dương Anh Phượng',
    'BSCKII Nguyễn Bạch Huệ',
  ];
  DateTime selectedDateOfBirth = DateTime.now();
  DateTime selectedDateDay = DateTime.now();
  String? selectedSex;
  String? selectedService;
  String? selectedDoctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColorBg,
      body: GestureDetector(
        onTap: () {
          unFocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thông tin cá nhân',
                        style: AppStyle().heading2,
                      ),
                      AppTextField(
                        textCapitalization: TextCapitalization.words,
                        hint: 'Họ tên',
                        controller: fullName,
                        focusNode: _fullName,
                      ),
                      GestureDetector(
                        onTap: () => _selectDateOfBirth(context),
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
                                suffixIcon:
                                    const Icon(Icons.calendar_today_outlined),
                                contentPadding: const EdgeInsets.all(20),
                                filled: true,
                                fillColor: AppColor.colorWhile,
                                hintText: 'Ngày sinh',
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
                      const SizedBox(
                        height: 10,
                      ),
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
                      AppTextField(
                        textInputType: TextInputType.phone,
                        hint: 'Số điện thoại',
                        controller: phone,
                        focusNode: _phone,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Thông tin Lịch hẹn', style: AppStyle().heading2),
                      const SizedBox(
                        height: 10,
                      ),
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
                            'Loại dịch vụ',
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
                          items: serviceItem
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
                              selectedService = value.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                            'Chọn bác sĩ',
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
                          items: doctorItem
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
                              selectedDoctor = value.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => _selectDateDay(context),
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
                              controller: dayDate,
                              focusNode: _dayDate,
                              decoration: InputDecoration(
                                suffixIcon:
                                    const Icon(Icons.calendar_today_outlined),
                                contentPadding: const EdgeInsets.all(20),
                                filled: true,
                                fillColor: AppColor.colorWhile,
                                hintText: 'Ngày khám',
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
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: description,
                        focusNode: _description,
                        enableInteractiveSelection: true,
                        maxLines: 5,
                        scrollPadding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom * 3),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20),
                          filled: true,
                          fillColor: AppColor.colorWhile,
                          hintText: 'Mô tả tình trạng vủa bạn',
                          hintStyle: AppStyle()
                              .heading4
                              .copyWith(color: AppColor.colorGrey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  AppNextBt(
                    label: 'Đặt lịch khám',
                    onPressed: () {
                      createBooking();
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateOfBirth,
      firstDate: DateTime(1901, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDateOfBirth) {
      setState(
        () {
          selectedDateOfBirth = picked;
          String convertedDateTime =
              DateFormat.yMd().format(selectedDateOfBirth);
          dateOFBirth.value = TextEditingValue(text: convertedDateTime);
        },
      );
    }
  }

  Future<void> _selectDateDay(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateDay,
        firstDate: DateTime.now(),
        lastDate: DateTime(2200));
    if (picked != null && picked != selectedDateOfBirth) {
      setState(
        () {
          selectedDateDay = picked;
          String convertedDateTime = DateFormat.yMd().format(selectedDateDay);
          dayDate.value = TextEditingValue(text: convertedDateTime);
        },
      );
    }
  }

  void unFocus() {
    _dayDate.unfocus();
    _description.unfocus();
    _fullName.unfocus();
    _dateOfBirth.unfocus();
    _phone.unfocus();
  }

  Future<void> createBooking() async {
    if (fullName.text.length < 8 || fullName.text.length > 32) {
      EasyLoading.showError('Họ Tên tài khoản phải có 8 -32 kí tự');
    } else if (description.text.isEmpty) {
      EasyLoading.showError('Thêm mô tả tình trạng của bạn');
    } else if (phone.text.length < 10 || phone.text.length > 10) {
      EasyLoading.showError('Số điện thoại ko hợp lệ');
    } else {
      BookingController().createBookingList(
        fullName: fullName.text,
        dateOfBirth: dateOFBirth.text,
        sex: selectedSex ?? 'nam',
        phoneNumber: phone.text,
        typeService: selectedService ?? '',
        doctorSelector: selectedDoctor ?? '',
        bookingDate: dayDate.text,
        bookingStatus: 0,
        description: description.text,
        creationDate: DateFormat.yMd().format(DateTime.now()),
      );
      EasyLoading.showSuccess('Đăng kí thành công',
          maskType: EasyLoadingMaskType.custom);
      context.router.replace(const BookingEndRoute());
    }
  }
}
