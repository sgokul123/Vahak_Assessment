import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vahak_assessment/controller/wiki_search_controller.dart';

class SearchWikiInput extends StatelessWidget {
  String hint;
  BuildContext context;
  String initialValue;
  onClickOfSearchBtnCallback onSearchBtnCallback;
  TextEditingController textEditingController;
  OnValueChanged onValueChanged;
  bool disabled = true;

  SearchWikiInput({
    @required this.hint,
    @required this.context,
    this.initialValue,
    this.disabled,
    this.textEditingController,
    this.onSearchBtnCallback,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 12.0, top: 12.0, right: 12.0, bottom: 12.0),
        child: Container(
          height: 45.0,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            controller: textEditingController,
            enabled: disabled == null || !disabled,
            onChanged: (value) {
              initialValue = value;
              if (onValueChanged != null) onValueChanged(value);
            },
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (searchKey) {
              if (searchKey != null && searchKey.isNotEmpty) {
                if (onSearchBtnCallback != null) onSearchBtnCallback();
                Get.find<WikiSearchController>().callIMDSearchLeadApi(
                    context: context, strRequest: searchKey);
              }
            },
            keyboardType: TextInputType.text,
            maxLength: 15,
            decoration: InputDecoration(
              filled: true,
              counterText: '',
              fillColor: Colors.white,
              labelStyle: Theme.of(context).textTheme.bodyText1,
              errorStyle: Theme.of(context).textTheme.bodyText1,
              hintText: hint,
              suffixIcon: GestureDetector(
                onTap: () {
                  print(textEditingController.text);
                  if (textEditingController != null) {
                    if (textEditingController.text.trim().isNotEmpty) {
                      if (onSearchBtnCallback != null) onSearchBtnCallback();
                      Get.find<WikiSearchController>().callIMDSearchLeadApi(
                          context: context, strRequest: initialValue);
                    }
                  }
                },
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              border: getOutlineBorder(true),
              focusedBorder: getOutlineBorder(true),
              enabledBorder: getOutlineBorder(false),
            ),
          ),
        ),
      ),
    );
  }

  InputBorder getOutlineBorder(bool isFocused) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
            width: isFocused ? 2.0 : 1.0,
            color: isFocused ? Colors.redAccent : Colors.grey));
  }
}

typedef OnSearchLeadResponse = void Function(
    Map<String, dynamic> searchLead, String strLead);
typedef onClickOfSearchBtnCallback = void Function();
typedef OnValueChanged = void Function(String newValue);
