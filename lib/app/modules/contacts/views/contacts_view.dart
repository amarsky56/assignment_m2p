import 'package:assignment/app/res/dimens.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../res/strings.dart';
import '../../../widgets/common_progress.dart';
import '../../../widgets/empty_page.dart';
import '../controllers/contacts_controller.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.contacts),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const CommonProgress()
            : controller.permissionDenied.value
                ? EmptyPage(title: Strings.permissionDenied)
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.pad8),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) => controller.search(value),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimens.radius16)),
                              hintText: Strings.search,
                              suffixIcon: const Icon(Icons.search),
                            ),
                          ),
                          ListTile(
                            title: Text(Strings.recentContacts),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:  controller.filteredContacts.length,
                            itemBuilder: (context, index) {
                              final contact = controller.filteredContacts[index];
                              return ListTile(
                                onTap: () => controller.sendMoney(contact: contact),
                                leading: CircleAvatar(
                                    backgroundImage: contact.thumbnail == null ? const AssetImage(Assets.imgProfile) : MemoryImage(contact.thumbnail!)),
                                title: Text(
                                  contact.displayName,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text("${Strings.bank} ${(contact.phones.firstOrNull?.number ?? "")}"),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(Strings.allContacts),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.filteredContacts.length,
                            itemBuilder: (context, index) {
                              final contact = controller.filteredContacts[index];
                              return ListTile(
                                onTap: () => controller.sendMoney(contact: contact),
                                leading: CircleAvatar(
                                    backgroundImage: contact.thumbnail == null ? const AssetImage(Assets.imgProfile) : MemoryImage(contact.thumbnail!)),
                                title: Text(
                                  contact.displayName,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text("${Strings.bank} ${(contact.phones.firstOrNull?.number ?? "")}"),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
