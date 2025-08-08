# Marscope Starter Kit (v0.1)
Date: 2025-08-08

This starter kit contains:
- iOS SwiftUI app skeleton (files to drop into a new Xcode iOS App project)
- WidgetKit sample
- Local notification scheduler (09:00)
- Localization (EN/TR) via Localizable.strings
- Legal Disclaimer view (entertainment-only)
- Cloudflare Worker backend stub to serve normalized Mars weather JSON
- App icon placeholder

## Quick Start (iOS)
1) Open Xcode → File → New → App
   - Product Name: **Marscope**
   - Interface: SwiftUI
   - Language: Swift
   - Use Core Data: Unchecked (we'll use SwiftData later if desired)
   - Include Tests: Unchecked
2) Quit Xcode. In Finder, open your project folder.
3) Copy the contents of `iOS/App` into your project's folder:
   - Drag **Models**, **Services**, **ViewModels**, **Views**, **Legal**, **Localization**, **Assets** into your Xcode project (check 'Copy items if needed').
   - Replace the default `ContentView.swift` and `{
   }App.swift` with the provided ones.
4) Add the App Icon:
   - In Xcode → Assets.xcassets → AppIcon → Drag `Assets/AppIcon_1024.png` into the 1024px slot (or generate full set later).
5) Enable push notifications (later, optional):
   - Signing & Capabilities → + Capability → Push Notifications
6) Run the app. You should see a Today screen with mock Mars data.

## Firebase (Recommended)
I'll create the Firebase project now and later send you the `GoogleService-Info.plist`.
When you get it:
- Drag it into the Xcode project root (Copy if needed, add to all targets).

## AdMob
Currently set with test IDs only. Later replace with your real Ad Unit IDs.

## Backend (Cloudflare Workers)
1) Install Node.js and Wrangler CLI.
2) In `Backend/cloudflare-worker`, run:
   ```
   npm install
   npm run dev
   ```
   or `npm run deploy` after you log in to Cloudflare.
3) The worker serves JSON at `/v1/mars/weather/today`.

## Legal
- See `Views/DisclaimerView.swift` and Localization strings. Displayed on first launch + in Settings.
- Text includes: "This app is for entertainment purposes only" (EN/TR).

## Contact
- Support email (in Settings): trknsrv@gmail.com
- Developer name: Red Dune Labs
