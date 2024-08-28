import 'package:flutter/material.dart';


import '../app_colors.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;

  const SearchWidget({super.key, this.controller,this.hint, this.onChanged, this.onFieldSubmitted, this.onSaved});
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        style: const TextStyle(
            fontWeight: FontWeight.w400, color :AppColors.blackColor),
        controller: widget.controller,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          filled: true,
          fillColor:  AppColors.grayColor,
          prefixIcon: const Icon(
            Icons.search_outlined,
            size: 25,
            color: AppColors.whiteColor,
          ),
          hintText: widget.hint,
          hintStyle:TextStyle(
            color: AppColors.whiteColor.withAlpha(150),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide:  BorderSide(
              color: Colors.grey.shade500,
              width: 3,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide:
            BorderSide(width: 1, color: Colors.grey.shade500),

          ),
        ),
      ),
    );
  }
}

