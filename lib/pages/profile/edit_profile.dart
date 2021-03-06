import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'package:image_picker/image_picker.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/select_city/select_city.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class EditProfile extends StatefulWidget {
  static const routeName = '/editprofile';
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _nameController = new TextEditingController();
  var _emailController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _isShowNameError = false;

  bool _nameEnable = false;

  String firstName;
  String lastName;

  bool _isEdit = false;
  int selectedCityId = 0;
  String selectedImagePath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contentLayout(),
    );
  }

  @override
  void initState() {
    // replace hardacoded text with profile api call
    super.initState();

    _nameController.text = 'Name';
    _emailController.text = 'organic@gmail.com';
  }

  Widget buildFirstName() {
    return TextFormField(
      controller: _nameController,
      //decoration: InputDecoration(labelText: 'Name'),
      decoration:
          InputDecoration(prefixIcon: Icon(Icons.person), labelText:buildTranslate(context, 'name')),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter profile name';
        }
        return null;
      },
      onChanged: (String value) {
        firstName = value;
      },
    );
  }

  Widget buildLastName() {
    return TextFormField(
      controller: _emailController,
      decoration:
          InputDecoration(prefixIcon: Icon(Icons.email), labelText: buildTranslate(context,'email')),
      validator: (String value) {
        if (value.isEmpty) {
          return 'this field is required';
        }
        return null;
      },
      onChanged: (String value) {
        lastName = value;
      },
    );
  }

  Widget phoneNumber() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone), labelText: buildTranslate(context,'phone_number')),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onChanged: (String value) {
        lastName = value;
      },
    );
  }

  Widget contentLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          getHeaderLayout(),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: heading4),
                ),
                FlatButton(
                    height: 35,
                    onPressed: () {
                      setState(() {
                        if (_isEdit) {
                          _isEdit = false;
                        } else {
                          _isEdit = true;
                        }
                      });
                    },
                    shape: new CircleBorder(),
                    color: primaryColor,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildFirstName(),
                  SizedBox(height: 8),
                  buildLastName(),
                  SizedBox(height: 8),
                  phoneNumber(),
                  SizedBox(height: 60),
                  _isEdit ? getBottomButton() : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getHeaderLayout() {
    return Container(
      padding: EdgeInsets.only(bottom: 50, top: 30),
      decoration: BoxDecoration(
          image: new DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10.0)],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      width: double.infinity,
      child: Column(
        children: [
          commonToolbar(context, 'create_profile', false),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              openImagePicker();
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 55.0,
                  backgroundImage: selectedImagePath.isEmpty
                      ? AssetImage('assets/images/logo1.png')
                      : FileImage(File(selectedImagePath)),
                  backgroundColor: Colors.transparent,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 15, left: 20, right: 20),
          //   child: Text(
          //     'Organic',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //         fontSize: heading2),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget getBottomButton() {
    return GestureDetector(
      onTap: () {
        print('submit clicked');
        validateField();
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(buildTranslate(context,
              'submit'),
              style: TextStyle(color: Colors.white, fontSize: normalSize),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  void validateField() {
    // setState(() {
    //   Fluttertoast.showToast(msg: 'Profile Updated Successfully');
    // });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectCity()));
  }

  Widget getCommonSpinnerForProfile({
    @required String labelName,
    @required List<DropdownMenuItem<int>> list,
    @required Function(int) validator,
    @required Function(String) onSaved,
    @required Function(int) onChanged,
    @required Function(String) onSubmitted,
    @required String dropDownHint,
    Color backgroundColor,
  }) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labelName,
            style: TextStyle(fontSize: normalSize, color: Colors.grey),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Icon(
                  Icons.location_on_outlined,
                  color: primaryColor,
                ),
              ),
              DropdownButtonFormField(
                hint: Text(dropDownHint),
                disabledHint: Text('Kalamassery'),
                items: list,
                onChanged: _isEdit
                    ? (value) => setState(() => onChanged(value))
                    : null,
                isExpanded: true,
                validator: (value) {
                  return validator(value);
                },
                onSaved: (value) => onSaved(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 25.0, right: 10.0),
                  focusColor: primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
        ]);
  }

  Future<void> openImagePicker() async {
    PickedFile pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print('image path: ' + pickedImage.path);
      setState(() {
        // selectedImageList.add(pickedImage.path);
        selectedImagePath = pickedImage.path;
      });
    } else {
      print('No image selected');
    }
  }
}
