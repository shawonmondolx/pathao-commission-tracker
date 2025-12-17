import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiServices extends GetxService {
  // Singleton getter
  ApiServices get to => Get.find<ApiServices>();

  late SupabaseClient _client;

  SupabaseClient get client => _client;

  Future<ApiServices> init() async {
    // Initialize Supabase
    await Supabase.initialize(
      url:
          'https://gcnfidfhtjpovjyfucsy.supabase.co', // Replace with your Supabase project URL
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdjbmZpZGZodGpwb3ZqeWZ1Y3N5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjEzMTAxMDUsImV4cCI6MjA3Njg4NjEwNX0.rOwsqRz8FD6TrLpiVufdN4ULgyfZ3nXAc2S2wrY4DyU', // Replace with your Supabase anon key
    );

    _client = Supabase.instance.client;

    return this;
  }
}
