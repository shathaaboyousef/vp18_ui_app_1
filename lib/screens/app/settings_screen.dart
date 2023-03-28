import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vp18_ui_app_1/models/works_feild.dart';
import 'package:vp18_ui_app_1/utils/context_extentions.dart';

import '../../models/addreses.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;
  String? _gender;
  late RangeValues priceValues;
  int? _selectedWorksFieldId;
  late TextEditingController _experincesController;

  double age = 10;
  List<String> _experincess = <String>[];
  final List<Addresses> _address = <Addresses>[
    Addresses("Gaza"),
    Addresses("Eygpt"),
    Addresses("Morico"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    priceValues = RangeValues(20, 80);
    _experincesController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _experincesController.dispose();
    super.dispose();
  }

  final List<WorksField> worksField = <WorksField>[
    const WorksField(1, 'Flutter developer'),
    const WorksField(2, 'Web developer'),
    const WorksField(3, 'IOS developer'),
    const WorksField(4, 'Android developer'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: Colors.yellow,
            // activeThumbImage: , هاي لو بدي  اغير المفتاح ل صورة
            activeTrackColor: Colors.yellow.shade200,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey.shade200,
            title: Text(
              "Notifications",
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            subtitle: Text(
              "Turn on/off notifications ",
              style: GoogleFonts.poppins(fontSize: 13),
            ),
            value: _notifications,
            onChanged: (bool value) => setState(() {
              _notifications = value;
            }),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Gender",
            style: GoogleFonts.poppins(fontSize: 18),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                    title: Text("Male"),
                    value: 'm',
                    groupValue: _gender,
                    onChanged: (String? value) => setState(() {
                          _gender = value;
                        })),
              ),
              Expanded(
                child: RadioListTile<String>(
                    title: Text("Female"),
                    value: 'f',
                    groupValue: _gender,
                    onChanged: (String? value) => setState(() {
                          _gender = value;
                        })),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Addresses",
            style: GoogleFonts.poppins(fontSize: 18),
          ),
          for (Addresses addresses in _address)
            CheckboxListTile(
              title: Text(addresses.title),
              value: addresses.checked,
              onChanged: (bool? value) => setState(() {
                if (value != null) {
                  addresses.checked = value;
                }
              }),
            ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Age",
            style: GoogleFonts.poppins(fontSize: 18),
          ),
          Slider(
            max: 100,
            min: 0,
            value: age,
            label: age.toString(),
            divisions: 100,
            onChanged: (value) => setState(() {
              age = value;
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Prices",
            style: GoogleFonts.poppins(fontSize: 18),
          ),
          RangeSlider(
            max: 500,
            min: 0,
            labels: RangeLabels(
                priceValues.start.toString(), priceValues.end.toString()),
            divisions: 25,
            values: priceValues,
            onChanged: (value) => setState(() {
              priceValues = value;
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "WorksField",
            style: GoogleFonts.poppins(fontSize: 18),
          ),
          DropdownButton<int>(
            isExpanded: true,
            hint: const Text(" Select your works Field"),
            value: _selectedWorksFieldId,
            items: worksField
                .map((e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(e.name),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedWorksFieldId = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Experiences",
            style: GoogleFonts.poppins(fontSize: 18),
          ),
          TextField(
            controller: _experincesController,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) => _performSave(),
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.work),
                hintText: ' Enter your experiences',
                suffixIcon: IconButton(
                  onPressed: () => _performSave(),
                  icon: const Icon(Icons.save),
                )),
          ),
          SizedBox(height: 10,),
          Wrap(
            spacing: 10,
            children: _experincess
                .map((exp) => Chip(
              deleteIcon: const Icon(Icons.close),
                    onDeleted: ()=> _delete(exp),
                deleteButtonTooltipMessage: "Delete",
                    avatar: const Icon(
                      Icons.work,
                    ),
                    label: Text(exp)))
                .toList(),
          )
        ],
      ),
    );
  }

  void _performSave() {
    if (_checkData()) {
      save();
    }
  }

  bool _checkData() {
    if (_experincesController.text.isNotEmpty) {
      return true;
    }
      context.showSnackBar(massage: "Enter your experiences ", error: true);
      return false;

  }

  void save() {
    setState(() {
      _experincess.add(_experincesController.text);
    });
    _clear();
  }

  void _clear() {
    _experincesController.clear();
  }
  void _delete (String experinces){
setState(() {
  _experincess.remove(experinces);
});
  }
}
