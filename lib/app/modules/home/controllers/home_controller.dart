// Flutter & Dart imports

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';
import 'package:share_plus/share_plus.dart';

// Project imports
import 'package:pathao_heros/app/data/Api_Services.dart';
import '../../../data/Data_Model/User_Model.dart';

class HomeController extends GetxController {
  // ----------------------
  // Variables
  // ----------------------
  RxString totalMothlyIncome = RxString('0');
  RxString totalMothlyParcel = RxString('0');
  RxString totalMothlyPerformence = RxString('0');
  RxString id = ''.obs;
  RxInt totalDelivery = 0.obs;
  RxInt totalAssignedParcel = 0.obs;
  Rxn<int> performance = Rxn<int>();
  Rx<DateTime> createdAt = DateTime.now().obs;
  RxString atendanse = RxString('0');
  RxBool isloading = RxBool(false);
  RxString name_MonthlyData = RxString('');
  final RxList<int> years = RxList<int>.from(
    List.generate(1001, (index) => 2000 + index), // 2000 to 3000
  );
  RxInt currentYear = RxInt(DateTime.now().year);
  // Months for selection
  RxList<String> months = RxList<String>(const [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ]);

  RxInt selectedMonth = RxInt(DateTime.now().month);
  Rx<DateTime> selectedDate = DateTime.now().obs;

  // User commission lists
  RxList<UserCommission> userCommissions = RxList<UserCommission>();
  RxList<UserCommission> latest = RxList<UserCommission>();

  // ----------------------
  // Lifecycle Methods
  // ----------------------
  @override
  void onInit() {
    getDate(); // Load saved month
    getData();
    // Fetch user commission data
    super.onInit();
  }

  // ----------------------
  // Date Picker Method
  // ----------------------
  void pickeDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    } else {
      selectedDate.value = DateTime.now();
    }
  }

  // ----------------------
  // Shared Preferences: Load and Save Month
  // ----------------------
  Future<void> getDate() async {
    final preff = await SharedPreferences.getInstance();
    selectedMonth.value = preff.getInt('date') ?? DateTime.now().month;
    currentYear.value = preff.getInt('year') ?? DateTime.now().year;
  }

  Future<void> saveDate() async {
    final preff = await SharedPreferences.getInstance();
    await preff.setInt('date', selectedMonth.value);
    await preff.setInt('year', currentYear.value);
  }

  // ----------------------
  // Change Month
  // ----------------------
  void changeMonth() {
    saveDate(); // Save the selected month and year
    getData(); // Fetch data for the new month
  }

  // ----------------------
  // Calculate Commission Multiplier
  // ----------------------
  int calculateMultiplier(int delivery, String type) {
    if (type == 'Outside City') {
      if (delivery >= 40) return 38 * delivery;
      if (delivery >= 34) return 37 * delivery;
      if (delivery >= 30) return 36 * delivery;
      if (delivery >= 25) return 33 * delivery;
      return 30 * delivery;
    } else {
      if (delivery >= 50) return 35 * delivery;
      if (delivery >= 40) return 33 * delivery;
      if (delivery >= 30) return 31 * delivery;
      if (delivery >= 25) return 27 * delivery;
      return 23 * delivery;
    }
  }

  // ----------------------
  // Save Delivery Data
  // ----------------------
  Future<void> savedelavery() async {
    try {
      final supabase = ApiServices().to.client;

      // Fetch all users (optional, can be removed if not needed)
      final allUsers = await supabase.from('userinfo').select();

      // Get current user's email
      final String currentEmail = supabase.auth.currentUser!.email!;

      // Fetch user info by email
      final userInfo = await supabase
          .from('userinfo')
          .select()
          .eq('email', currentEmail)
          .maybeSingle(); // Avoid exception if no data found

      if (userInfo == null) {
        Get.snackbar('Error', 'User info not found');
        return;
      }
      name_MonthlyData.value = userInfo['user_name'];

      final String agent = userInfo['agent_type'];

      // Create UserCommission object
      final UserCommission userCommission = UserCommission(
        userId: supabase.auth.currentUser!.id,
        totalAssignedParcel: totalAssignedParcel.value,
        totalDelivery: totalDelivery.value,
        createdAt: selectedDate.value,
        agentType: agent,
        totalAmount: calculateMultiplier(totalDelivery.value, agent),
      );

      // Insert into Supabase table
      final response = await supabase
          .from('user_commissions')
          .insert(userCommission.toJson());
      Get.snackbar('Success', 'Data saved successfully!');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to save data');
    }
  }

  // ----------------------
  // Fetch User Commission Data
  // ----------------------
  Future<void> getData() async {
    isloading.value = true;
    try {
      userCommissions.clear();
      final supabase = ApiServices().to.client;
      final userId = supabase.auth.currentUser!.id;

      // Start: previous month 25
      final start = DateTime(currentYear.value, selectedMonth.value - 1, 25);
      final end = DateTime(currentYear.value, selectedMonth.value, 25);

      final res = await supabase
          .from('user_commissions')
          .select()
          .eq('user_id', userId)
          .gt('created_at', start.toIso8601String())
          .lte('created_at', end.toIso8601String());
      userCommissions.value = res
          .map((e) => UserCommission.fromJson(e))
          .toList();
      userCommissions.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      MonthlyIcomeAndParcel();
      atendanse.value = userCommissions.length.toString();
      isloading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isloading.value = false;
      print(e);
    }
  }

  void MonthlyIcomeAndParcel() {
    // Total amount
    final total = userCommissions.fold(
      0,
      (sum, item) => sum + item.totalAmount,
    );
    totalMothlyIncome.value = total.toString();

    //   Total parcel
    final totalParcel = userCommissions.fold(
      0,
      (sum, item) => sum + item.totalDelivery,
    );
    totalMothlyParcel.value = totalParcel.toString();
    //   total performance
    final totalassignedParcel = userCommissions.fold(
      0,
      (sum, item) => sum + item.totalAssignedParcel,
    );
    final totalPerformance = (100 / totalassignedParcel) * totalParcel;
    final fixed = totalPerformance.toStringAsFixed(2);
    totalMothlyPerformence.value = fixed;
  }

  Future<void> delete({required String id}) async {
    try {
      final supabse = await ApiServices().to.client
          .from('user_commissions')
          .delete()
          .eq('id', id);

      Get.snackbar('Success', 'Data deleted successfully!');
      userCommissions.removeWhere((element) => element.id == id);
      MonthlyIcomeAndParcel();
      atendanse.value = userCommissions.length.toString();
    } catch (e) {
      Get.snackbar('Error', 'Something Went wrong');
      print(e);
    }
  }

  Future<void> shareData(BuildContext context) async {
    if (userCommissions.isEmpty) {
      Get.snackbar('Error', 'No data to share');
      return;
    }

    // Capture RenderBox early to avoid async context issues (iPad requirement)
    final box = context.findRenderObject() as RenderBox?;

    // Create CSV data
    final List<List<dynamic>> userData = [];
    userData.add([
      'Date',
      'Total Assigned Parcel',
      'Total Delivery',
      'Total Amount',
    ]);

    for (var item in userCommissions) {
      userData.add([
        item.createdAt.toIso8601String().split('T').first,
        item.totalAssignedParcel,
        item.totalDelivery,
        item.totalAmount,
      ]);
    }

    final csvData = ListToCsvConverter().convert(userData);

    // Get temporary directory
    final dir = await getTemporaryDirectory();

    // Ensure file has a valid name
    final fileName = name_MonthlyData.value.isNotEmpty
        ? '${name_MonthlyData.value}_MonthlyData.csv'
        : 'MonthlyData.csv';

    // Write CSV content to a real file
    final file = File('${dir.path}/$fileName');
    await file.writeAsString(csvData);

    // Share the file
    final params = ShareParams(
      files: [XFile(file.path)],
      text: "Monthly Delivery Report",
      sharePositionOrigin: box != null
          ? box.localToGlobal(Offset.zero) & box.size
          : Rect.zero,
    );

    final result = await SharePlus.instance.share(params);

    if (result.status == ShareResultStatus.success) {
      print("Shared successfully!");
    } else {
      print("Share cancelled or failed.");
    }
  }
}
