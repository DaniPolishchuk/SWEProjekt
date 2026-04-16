#let pageSettings(
  author1: (
    vorname: "", 
    nachname: ""
  ),
  author2: (
    vorname: "", 
    nachname: ""
  ),
  body
) = {
  let name = author1.vorname + " " + author1.nachname + " und " + author2.vorname + " " + author2.nachname
  let docTitle = "Verwaltungssoftware für ein Bauunternehmen"
  let colorBorderSection = color.rgb(140, 140, 140);
  let accentColor = colorBorderSection
  let sizeBorderSection = 10pt;

  let colorBlue = color.rgb("0000FF");
  let colorLightBlue = color.rgb("3479CC")
  let colorRed = color.rgb("FF0000");


  set heading(numbering: "1.1.1")
  set text(lang: "de", font: "Arial", size: 11pt)
  set par(justify: true)
  set document(author: name, title: docTitle)
  set page(paper: "a4",
  margin: (bottom: 1.75cm, top: 2.25cm))

  // --- Titelseiten --- 
  align(top+center)[
    #set par(leading: 12pt, spacing: 50pt )
    #text(fill: colorBlue, size: 20pt)[*Software-Engineering I*]

    #text(fill: colorRed, size: 18pt)[
      *Programmentwurf \
      TINF24B1 \
      3./4. Semester (2025/2026)*
    ]
  ]

  align(horizon+center)[
    #set par(leading: 12pt, spacing: 50pt )
    #text(size: 20pt)[_*Thema:*_ \ ] 
    #text(fill: colorBlue, size: 20pt)[_*#docTitle*_] 

    #text(size: 14pt)[
      DHBW Karlsruhe \
      Studiengang Angewandte Informatik \

      Dr.-Ing. Richard Lutz \
    ]
    #text(size: 13pt)[
      Institut für Automation und angewandte Informatik (IAI) \
      Karlsruher Institut für Technologie (KIT)
    ]
  ]


  align(bottom+center)[
    #text(size: 14pt)[
        Bearbeitet von \
        #author1.vorname #author1.nachname und #author2.vorname #author2.nachname
    ]
  ]

  // --- Verzeichnisse ---
  pagebreak()

  outline(title: "Inhaltsverzeichnis", indent: auto)

  // --- Header & Footer ---
  set page(
    header: context {
    let on-page = query(heading.where(level: 1, outlined: true))
      .filter(h => h.location().page() == here().page())
    
    let display-heading = if on-page.len() > 0 {
      on-page.first().body
    } else {
      let before = query(heading.where(level: 1, outlined: true)
        .before(here()))
      if before.len() > 0 { before.last().body } else { none }
    }

    if display-heading != none {
      grid(
        columns: (55%, 10%, 35%),
        align(left, text(fill: colorBorderSection, weight: "bold", sizeBorderSection, display-heading)),
        [],
        align(right, text(fill: colorBorderSection, weight: "bold", sizeBorderSection, docTitle))
      )
      line(length: 100%, stroke: (paint: colorBorderSection))
    }
  },
  footer:
    grid(
      columns: (33%,) * 3,
      rows: 1, 
      [],
      [#align(center)[
        #text(fill: colorBorderSection, weight: "bold", size: sizeBorderSection)[#name]]], 
      [#align(right)[
        #text(fill: colorBorderSection, weight: "bold", size: sizeBorderSection)[Seite #context counter(page).display("1 / 1", both: true)]
      ]]
    )
  )

  // --- Regeln ---
  set ref(supplement: it => {
    if(it.func() == heading){
      /*let num = it.numbering.trim("1.1.1")
      let name = it.body.text
      [num + name]*/
      if(kind == "Drehbuch" or kind == "Disposition"){
        ""
      }else{
        "Kapitel" 
      }
    }else if (it.func() == figure){
      "Abbildung"
    }else{
      "AnpaassungTemplate"
    }
  }) 

  show heading.where(level: 1, outlined: true): it => {
    pagebreak()
    text(size: 16pt, fill: colorLightBlue)[*#it*]
  }

  show heading.where(level: 2): it => {
    text(size: 14pt, fill: colorLightBlue)[#it]
  }

  show table: set par(justify: false)
  
  show table.cell: it => {
    align(left)[#it]
  }

  body
}