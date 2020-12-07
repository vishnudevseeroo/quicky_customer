import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quicky_customer/pages/Api_service/api_service.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/select_city/select_city.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';
import 'package:quicky_customer/utils/constants.dart';
import 'package:quicky_customer/utils/snackbar.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profilescreen';

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  var _nameController = new TextEditingController();
  var _emailController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstName;
  String lastName;

  bool _isEdit = false;
  int selectedCityId = 0;
  String selectedImagePath = "";
  bool isLoading = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        leading: Transform.scale(
          scale: 0.6,
          child: FlatButton(
            shape: CircleBorder(),
            color: primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          buildTranslate(context, 'create_profile'),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ModalProgressHUD(inAsyncCall: isLoading, child: contentLayout()),
    );
  }

  @override
  void initState() {
    // replace hardacoded text with profile api call
    super.initState();
  }

  Future<void> updateProfile() async {
    bool _isNetWorkavailable = await getNetworkAvailability();
    print('is_network_available: ' + _isNetWorkavailable.toString());

    if (_isNetWorkavailable) {
      setState(() {
        if (_formKey.currentState.validate()) {
          isLoading = true;
          updateProfiles();
        }
      });
    } else {
      showSnackBar(scaffoldKey, buildTranslate(context, 'no_network'));
    }
  }

  updateProfiles() {
    print('login or register api call working........');
    addProfileDetails(
            userId: '${SharedPrefs.getUserId()}',
            name: _nameController.text,
            email: _emailController.text)
        .then((response) {
      setState(() {
        isLoading = false;
      });
      if (response.status == "success") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SelectCity()));
      } else {
        showSnackBar(scaffoldKey, response.message ?? 'Something went wrong');
      }
    });
  }

  Widget buildFirstName() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: buildTranslate(context, 'name'),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return buildTranslate(context, 'please enter profile name');
        }
        return null;
      },
      onChanged: (String value) {
        firstName = value;
      },
    );
  }

  Widget buildEmail() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(labelText: buildTranslate(context, 'email')),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter a valid email Address';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
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
            padding: EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildFirstName(),
                  SizedBox(height: 5),
                  buildEmail(),
                  SizedBox(height: 60),
                  getBottomButton()
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
      padding: EdgeInsets.only(bottom: 30, top: 30),
      width: double.infinity,
      child: Column(
        children: [
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
        ],
      ),
    );
  }

  Widget getBottomButton() {
    return GestureDetector(
      onTap: () {
        print('submit clicked');

        updateProfile();
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buildTranslate(context, 'submit'),
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
