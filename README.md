# Placement Tracker (Salesforce)
Custom object + Apex trigger + Apex tests + Lightning Web Component.

## Steps (Hinglish)
1. developer.salesforce.com/signup -> free Developer Edition org banao.
2. Install: VS Code, "Salesforce Extension Pack" (VS Code extension) aur Salesforce CLI (developer.salesforce.com/tools/salesforcecli).
3. Ye folder VS Code mein kholo (File > Open Folder).
4. Ctrl+Shift+P -> "SFDX: Authorize an Org" -> Project Default -> login karo.
5. `force-app` pe right click -> "SFDX: Deploy Source to Org".
6. Org mein: Setup -> Permission Sets -> Job Tracker Access -> Manage Assignments -> apne user ko add karo.
7. App Launcher -> "Job Applications" -> 5-6 records banao. Same Company+Role dobara daalo, error aana chahiye.
8. Home page pe: Setup gear -> Edit Page -> left se "Job Application List" drag karo -> Save -> Activate.
9. Tests: VS Code mein "SFDX: Run Apex Tests" (ya Developer Console > Test). Coverage % note karo.
10. GitHub pe push karo.
