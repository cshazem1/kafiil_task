import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';
import 'package:kafiil_task/features/auth/data/models/dependencies_models/Tags.dart';import 'package:kafiil_task/features/auth/presentation/manger/Dependent/dependent_cubit.dart';

import '../../../../../../../core/utils/theming/colors.dart';
import '../../../../../../../core/utils/theming/styles.dart';
import 'custom_ship.dart';

class CustomSkills extends StatefulWidget {
  void Function( Set<TagsAuth>) onSaved;
  List<Tags>? tags;
  List<TagsAuth>? tagsSelected;

  CustomSkills({
    this.tagsSelected,
    required this.onSaved,
    this.tags,
  });

  @override
  State<CustomSkills> createState() => _CustomSkillsState();
}

class _CustomSkillsState extends State<CustomSkills> {
  Set<TagsAuth> setListSkills = {};

  List<Widget> widgetListSkills = [];
  int chipCounter = 0;
  bool showMore = false;
  @override
  void initState() {
    if(widget.tagsSelected?.isNotEmpty??false)
      {
        for(var selectSkills in widget.tagsSelected!)
          {

            setListSkills.add(TagsAuth(name: selectSkills.name!, id: selectSkills.id));
          }

      }
    searchList = widget.tags!; // Initialize with all tags
    controllerSearch?.addListener(_filterTags); //
    super.initState();
  }

  void _filterTags() {
    final query = controllerSearch!.text.toLowerCase();
    setState(() {
      if (controllerSearch!.text.isNotEmpty) {
        searchList = widget.tags!
            .where((tag) => tag.label!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  TextEditingController? controllerSearch = TextEditingController();
  List<Tags> searchList = [];
  int showSizeSkills = 10;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills",
          style:
              TextStyles.font12ColorGray500500Weight.copyWith(fontSize: 12.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        GestureDetector(
          onTap: () {
            int showSizeSkills = 10;

            showMore = false;
            controllerSearch!.text = "";
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

                return Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: keyboardHeight),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * .5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'select your skills',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextField(
                                    textAlign: TextAlign
                                        .center, // Center align the text

                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    onChanged: (value) {
                                      if (searchList.length > 10) {
                                        showMore = true;
                                        setState(() {});
                                      }
                                    },
                                    controller: controllerSearch,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      _filterTags();
                                    },
                                    icon: const Icon(
                                      Icons.search,
                                      size: 30,
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Wrap(
                                    children: List.generate(
                                      searchList.length > showSizeSkills
                                          ? showSizeSkills
                                          : searchList.length,
                                      (index) {
                                        return ItemSkills(
                                          id: searchList[index].value!,
                                          skills: searchList[index].label!,
                                          skillsSelect: (skills, id) {

                                            setListSkills.add(TagsAuth(name: skills, id: id));
                                            print(setListSkills.length);
                                            widget.onSaved(setListSkills);
                                            setState(() {});
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          !showMore
                              ? const SizedBox()
                              : IconButton(
                                  icon: const Icon(Icons.expand_more_outlined,
                                      size: 50),
                                  onPressed: () {
                                    showSizeSkills =
                                        showSizeSkills + 10 < searchList.length
                                            ? showSizeSkills + 10
                                            : searchList.length;
                                    setState(() {
                                      if (searchList.length == showSizeSkills) {
                                        showMore = false;
                                        setState(() {});
                                      }
                                    });
                                  },
                                ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ));
              },
            );
          },
          child: Container(
            height: 94.h,
            width: 334.w,
            decoration: BoxDecoration(
                color: ColorManager.gray50,
                borderRadius: BorderRadius.circular(16.h)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Wrap(
                  children: List<Widget>.generate(
                    setListSkills.length??0,
                    (index) {
                      return CustomChip(
                        idSkills:setListSkills.toList()[index].id ,

                        onSaved: (p0) {
                          setState(() {

                          });
                        },
                        onDelete: () {
                          setState(() {

                           setListSkills
                                .remove(setListSkills.elementAt(index));
widget.onSaved(setListSkills);
                            print(setListSkills.length);
                          });
                        },
                        text:setListSkills.toList()[index].name!,

                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ItemSkills extends StatefulWidget {
  ItemSkills({
    required this.skills,
    super.key,
    required this.skillsSelect,
    required this.id
  });
  int id;
  final String skills;
  void Function(String, int) skillsSelect;

  @override
  State<ItemSkills> createState() => _ItemSkillsState();
}

class _ItemSkillsState extends State<ItemSkills> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: ChoiceChip(
        label: Text(widget.skills),
        selected: isSelected,
        onSelected: (value) {
          setState(() {
            isSelected = !isSelected;
            widget.skillsSelect(widget.skills, widget.id);
          });
        },
      ),
    );
  }
}
