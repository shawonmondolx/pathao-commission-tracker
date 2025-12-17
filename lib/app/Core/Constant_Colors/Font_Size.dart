class GlobalFontSizes {
  // ==============================================================================
  // 1. HEADERS & DISPLAY (The Big Stuff)
  // ==============================================================================

  /// The huge number on the Yellow Card (e.g., "$ 4,250.00").
  /// Needs to be massive and readable.
  static const double displayIncome = 42.0;

  /// Page Titles (e.g., "Hello, Rider!", "Work History", "Global Chat").
  static const double pageHeader = 35.0;

  /// Section Headers (e.g., "Recent Entries", "Today's Stats").
  static const double sectionHeader = 20.0;

  // ==============================================================================
  // 2. CARDS & STATS (The Grid)
  // ==============================================================================

  /// The numbers inside the small grid cards (e.g., "98%", "150").
  static const double statValue = 22.0;

  /// The labels below the numbers (e.g., "Perf Ratio", "Parcels").
  static const double statLabel = 13.0;

  // ==============================================================================
  // 3. LISTS & ENTRIES (History & Logs)
  // ==============================================================================

  /// The main text in a list item (e.g., "Amazon Hub Order").
  static const double listTitle = 12.0;

  /// The money amount in the list (e.g., "+$5.50").
  /// Slightly larger than body text to highlight earnings.
  static const double listAmount = 20.0;

  /// Dates and secondary info (e.g., "Oct 24, 2023").
  static const double listSubtitle = 12.0;

  // ==============================================================================
  // 4. INTERACTIVE ELEMENTS (Buttons & Inputs)
  // ==============================================================================

  /// Text inside the big buttons (e.g., "Upload Entry", "Export").
  static const double buttonText = 18.0;

  /// Text inside the Chat Input field.
  static const double inputText = 16.0;

  // ==============================================================================
  // 5. CHAT
  // ==============================================================================

  /// The actual message text inside chat bubbles.
  static const double chatMessage = 15.0;

  /// The small timestamp next to a message (e.g., "10:45 AM").
  static const double chatTimestamp = 10.0;

  // auth

  /// "Welcome Back" title.
  static const double authTitle = 32.0;

  /// "Login" or "Sign Up" text inside the big buttons.
  static const double authButtonText =
      20.0; // Slightly bigger than normal buttons

  /// "Forgot Password?" or "New here?".
  static const double authSmallLink = 14.0;
}
