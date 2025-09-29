// import 'package:flutter/material.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'package:massaging_ui_design/utils/assets_image.dart';
//
// class ContactScreen extends StatelessWidget {
//   const ContactScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Contact'),
//       ),
//       body: GroupedListView<Map<String, dynamic>, String>(
//         elements: AssetsImages.imageDataList,
//         groupBy: (contact) => contact['name']![0].toUpperCase(), // প্রথম অক্ষর দিয়ে group
//         groupSeparatorBuilder: (String groupByValue) => Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             groupByValue,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         itemBuilder: (context, Map<String, dynamic> element) {
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: AssetImage(element['imagePath']!),
//             ),
//             title: Text(
//               element['name']!,
//               style: const TextStyle(fontWeight: FontWeight.w600),
//             ),
//             subtitle: Text(element['description']!),
//           );
//         },
//         itemComparator: (item1, item2) =>
//             item1['name']!.compareTo(item2['name']!), // নাম অনুসারে sort
//         order: GroupedListOrder.ASC, // A-Z ক্রমে দেখাবে
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:massaging_ui_design/utils/assets_image.dart';

import '../../utils/helper_function.dart';
import '../../widgets/custom_text.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ১. ডেটা সাজানো
    List<Map<String, dynamic>> sortedList = List.from(AssetsImages.imageDataList)
      ..sort((a, b) => a['name'].compareTo(b['name']));


    // ২. গ্রুপ তৈরি
    Map<String, List<Map<String, dynamic>>> groupedContacts = {};
    for (var contact in sortedList) {
      String firstLetter = contact['name'][0].toUpperCase();
      if (!groupedContacts.containsKey(firstLetter)) {
        groupedContacts[firstLetter] = [];
      }
      groupedContacts[firstLetter]!.add(contact);
    }


    // ৩. গ্রুপ key গুলো list এ রূপান্তর
    List<String> groupKeys = groupedContacts.keys.toList()..sort();

    return Scaffold(

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.black, // background color
          statusBarIconBrightness: Brightness.light, // Android = white icons
          statusBarBrightness: Brightness.dark, // iOS = white icons
        ),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerWidget(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: groupKeys.length,
                      itemBuilder: (context, groupIndex) {
                        String letter = groupKeys[groupIndex];
                        List<Map<String, dynamic>> contacts = groupedContacts[letter]!;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // গ্রুপের অক্ষর
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Text(
                                letter,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            // প্রতিটি গ্রুপের কন্টাক্ট
                            ...contacts.map((contact) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(contact['imagePath']),
                                ),
                                title: Text(
                                  contact['name'],
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(contact['description']),
                                trailing: contact['count'] != null
                                    ? CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    contact['count'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                )
                                    : Text(
                                  contact['time'],
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              );
                            }).toList(),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _headerWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Icon(Icons.search, color: Colors.white),
          ),
          Expanded(
            child: Text(
              'Calls',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          circuleBox(
            child: Icon(Icons.person_add_alt_1  , color: Colors.white),
            boxColor: Colors.transparent,
            borderWidth: 2,
          ),
        ],
      ),
    );
  }
}
