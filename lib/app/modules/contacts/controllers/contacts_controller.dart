
import 'package:assignment/app/routes/app_pages.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  final RxList<Contact> contacts = <Contact>[].obs;
  final RxList<Contact> filteredContacts = <Contact>[].obs;
  final RxBool permissionDenied = false.obs;
  final RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _fetchContacts();
    isLoading.value = false;
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      permissionDenied.value = true;
    } else {
      final contactsData = await FlutterContacts.getContacts();
      contacts.value = contactsData;
      filteredContacts.value = contactsData;
    }
  }

  sendMoney({required Contact contact}) => Get.toNamed(Routes.SEND_MONEY, arguments: contact);

  search(value) {
    if (value.isEmpty) {
      filteredContacts.value = contacts;
    } else {
      filteredContacts.value = contacts.where((element) => element.displayName.toLowerCase().contains(value.toLowerCase())).toList();
    }
  }
}
