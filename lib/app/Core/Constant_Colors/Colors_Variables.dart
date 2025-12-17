import 'dart:ui';

class GlobalVariables {
  // ==============================================================================
  // 1. BACKGROUNDS & SURFACES (The Matte Plastic Base)
  // ==============================================================================

  /// Main app background color.
  /// A deep, matte charcoal to make the neon/yellow pop.
  static const Color scaffoldBackground = Color(0xFF151517);

  /// Background for the "Daily List" items and "Grid Stats".
  /// Slightly lighter than the background to create a "raised tile" 3D effect.
  static const Color secondaryCardSurface = Color(0xFF222228);

  // ==============================================================================
  // 2. MAIN DASHBOARD ACCENTS (The Nano Banana Vibe)
  // ==============================================================================

  /// The "Banana Yellow" - High Gloss.
  /// USE FOR: The big "Total Income" card background and the "Upload" FAB.
  static const Color primaryBananaAccent = Color(0xFFFFD600);

  /// Text color specifically for inside the Yellow Card/Button.
  /// Dark grey to contrast heavily against the yellow.
  static const Color textOnYellow = Color(0xFF1A1A1A);

  // ==============================================================================
  // 3. STATS & DATA INDICATORS
  // ==============================================================================

  /// Neon/Slime Green.
  /// USE FOR: Income numbers ($), "Delivered" counts, and Positive trends.
  static const Color incomeAndSuccess = Color(0xFF00E676);

  /// Plastic Blue.
  /// USE FOR: "Export CSV" button, Performance gauge fill, and clickable links.
  static const Color actionAndPerformance = Color(0xFF2979FF);

  /// Warning Amber.
  /// USE FOR: Pending orders or low performance warnings.
  static const Color warningStatus = Color(0xFFFFAB00);

  // ==============================================================================
  // 4. TYPOGRAPHY (Text Colors)
  // ==============================================================================

  /// Pure White.
  /// USE FOR: Headings ("Hello Rider", "Work History") on the dark background.
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// Soft Grey.
  /// USE FOR: Subtitles, Dates, and Labels (e.g., "Parcels", "Perf Ratio").
  static const Color textSecondary = Color(0xFFA0A0A0);

  // ==============================================================================
  // 5. GLOBAL CHAT SPECIFIC
  // ==============================================================================

  /// Glossy Blue.
  /// USE FOR: Outgoing chat bubbles (The User's messages).
  static const Color chatBubbleMe = Color(0xFF2979FF);

  /// Matte Grey.
  /// USE FOR: Incoming chat bubbles (Other drivers).
  static const Color chatBubbleFriend = Color(0xFF2C2C35);

  /// Light Grey.
  /// USE FOR: Text input field background.
  static const Color chatInputBackground = Color(0xFF1E1E24);

  // 6. AUTHENTICATION & INPUTS
  // ==============================================================================

  /// Background for Input Fields (Email/Pass).
  /// Darker than the card surface to look "pressed in" or recessed.
  static const Color inputRecessedBackground = Color(0xFF0F0F10);

  /// Border/Stroke color for inputs when focused (Active state).
  static const Color inputFocusBorder = Color(0xFFFFD600); // Yellow glow

  /// Text color for placeholders (e.g., "Enter your email").
  static const Color placeholderText = Color(0xFF555555);

  /// Social Button Background (Google/Apple circles).
  static const Color socialButtonSurface = Color(0xFF2C2C35);
}
