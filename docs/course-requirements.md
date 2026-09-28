# Projektkrav som PitCheck uppfyller

| Kategori              | Krav | Poäng |
| --------------------- | ---: | ----: |
| Tekniska krav         |    9 |    11 |
| Entreprenöriella krav |    4 |     6 |
| Totalt                |   13 |    17 |

## Tekniska krav (11 p)

### Modulär kod (2 p)

Funktionen för inspection sheets (och alla andra features) är uppdelad i `ui/`, `state/`, `models/` och `repository/`. Skärmen läser data via en Riverpod provider som använder en repository. README beskriver strukturen och länkar till källorna vi följer

[Arkitektur i README](../README.md#code-architecture), [provider](../lib/features/inspection_sheets/state/inspection_sheet_providers.dart), [repository](../lib/features/inspection_sheets/repository/inspection_sheet_repository.dart)

### Självständiga widgets och lokalt state (1 p)

Skärmarna håller tillfälligt UI state där det används. Skärmen för inspection sheets håller valet mellan aktiva och arkiverade sheets lokalt. `StartInspectionForm` håller valt sheet, vald kategori och exkluderade underkategorier lokalt. Delad data kommer från providers

[InspectionSheetsScreen](../lib/features/inspection_sheets/ui/list/inspection_sheets_screen.dart), [StartInspectionForm](../lib/features/inspections/ui/setup/start_inspection_form.dart), [SettingsScreen](../lib/features/settings/ui/settings_screen.dart)

### Provider för app state (1 p)

Skärmen (och många andra screens/widgets) för inspection sheets använder `ref.watch(inspectionSheetsProvider(...))`. Settings och `MaterialApp` delar valt tema via en provider

[InspectionSheetsScreen](../lib/features/inspection_sheets/ui/list/inspection_sheets_screen.dart), [theme provider](../lib/features/settings/state/theme_mode_provider.dart)

### Forms validation (2 p)

Formuläret för inspection sheets kräver namn och beskrivning. Det kontrollerar också att årtalet är ett tal innan det sparas

[InspectionSheetForm](../lib/features/inspection_sheets/ui/list/inspection_sheet_form.dart)

### Routes med `go_router` (1 p)

`/sheets/:sheetId` öppnar ett specifikt inspection sheet. Appens skärmar definieras med `GoRoute`

[router.dart](../lib/router.dart)

### Real time updates (1 p)

Firestore `snapshots()` stream:ar listor och dokument. När ett inspection sheet ändras uppdateras list screen via en stream provider

[firestore_stream_helpers.dart](../lib/shared/firestore_stream_helpers.dart), [InspectionSheetsScreen](../lib/features/inspection_sheets/ui/list/inspection_sheets_screen.dart)

### Enkel inloggning mot Firebase (1 p)

Användare kan skapa konto och logga in med e-postadress och lösenord via Firebase Authentication

[AuthRepository](../lib/features/users/repository/auth_repository.dart), [SignInForm](../lib/features/users/ui/auth/sign_in_form.dart), [SignUpForm](../lib/features/users/ui/auth/sign_up_form.dart)

### Tredjepartsinloggning med Google (1 p)

Google-inloggning ger en Firebase-användare via Google-credential. Samma Google-metod räknas bara en gång

[AuthRepository](../lib/features/users/repository/auth_repository.dart), [SignInForm](../lib/features/users/ui/auth/sign_in_form.dart)

### Tredjepartsinloggning med Facebook (1 p)

Facebook-inloggning ger en Firebase-användare via Facebook-credential. Samma Facebook-metod räknas bara en gång

[AuthRepository](../lib/features/users/repository/auth_repository.dart), [SignInForm](../lib/features/users/ui/auth/sign_in_form.dart)

## Entreprenöriella krav (6 p)

### Cloud Firestore (2 p)

`InspectionSheetRepository`(och alla andra repositories) läser och sparar inspection sheets i Firestore

[inspection_sheet_repository.dart](../lib/features/inspection_sheets/repository/inspection_sheet_repository.dart)

### UX-inställning (1 p)

Användaren kan välja `System`, `Light` eller `Dark` i Settings. Valet sparas på enheten och laddas nästa gång appen startar

[appearance_picker.dart](../lib/features/settings/ui/appearance_picker.dart), [main.dart](../lib/main.dart)

### Performance Monitoring (1 p)

Firebase Performance Monitoring är aktiverat i appen. SDK:t mäter starttid automatiskt enligt [Firebase-dokumentationen](https://firebase.google.com/docs/perf-mon/flutter/get-started)

`firebase_performance` finns i [pubspec.yaml](../pubspec.yaml). Androids Performance plugin är aktiverat i [build.gradle.kts](../android/app/build.gradle.kts)

### Analytics (2 p)

`AppAnalytics` loggar custom events till Firebase Analytics när användaren gör actions i appen. Fem exempel:

- `inspection_sheet_created` när ett sheet skapas i [InspectionSheetsScreen](../lib/features/inspection_sheets/ui/list/inspection_sheets_screen.dart)
- `inspection_sheet_archived` när ett sheet arkiveras eller aktivers i [InspectionSheetsScreen](../lib/features/inspection_sheets/ui/list/inspection_sheets_screen.dart)
- `scrut_point_edited` när en punkt ändras i [ScrutPointDetailsScreen](../lib/features/scrut_points/ui/point_details/scrut_point_details_screen.dart)
- `inspection_joined` när en användare går med i en inspection i [HomeActiveInspection](../lib/features/inspections/ui/home/home_active_inspection.dart)
- `decision_saved` när en judge sparar ett beslut i [JudgeDecisionForm](../lib/features/inspections/ui/judge/judge_decision_form.dart)

[AppAnalytics](../lib/shared/app_analytics.dart)
