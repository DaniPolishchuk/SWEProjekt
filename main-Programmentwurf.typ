#import "template.typ": caption_with_source, project, zebraw
#import "utils.typ": include-chapters-with-break

#show: project.with(
  // 'de' for german or 'en' for english.
  // Pull Requests for other languages are welcome! :)
  lang: "de",

  // 'dhbw' or 'ihk'
  program: "dhbw",

  // Your degree program
  examination: "Bachelor of Science (B. Sc.)",

  // Your field of study
  study_field: "Studiengang Informatik \n Duale Hochschule Baden-Württemberg Karlsruhe",

  dr_lutz: "Dr.-Ing. R. Lutz \n Institut für Automation und angewandte Informatik (IAI) \n Karlsruher Institut für Technologie (KIT)",

  ///
  /// Cover Sheet
  ///
  // Full title of your project
  title_long: "Software-Engineering: Verwaltungssoftware für Bauunternehmen",
  // Shortened title, which is displayed in the header on every page
  title_short: "Verwaltungssoftware für Bauunternehmen",
  // The type of your project
  thesis_type: "Programmentwurf
TINF24B1
3./4. Semester (2025/2026)",
  // Other information about you and your project
  authors: (
    (
      firstname: "",
      lastname: "",
      identification_number: "",
    ),
    (
      firstname: "",
      lastname: "",
      identification_number: "...",
    ),
  ),

  theme: "Thema: Verwaltungssoftware für Bauunternehmen",
)

#include "Kapitel_Original.typ"

#include "Kapitel_Edit.typ"