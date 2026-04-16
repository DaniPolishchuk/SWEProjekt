// LTeX: enabled=false

#import "@preview/glossarium:0.5.10": gls, glspl, make-glossary, print-glossary, register-glossary
#import "@preview/hydra:0.6.2": hydra
#import "@preview/codly-languages:0.1.10": *
#import "@preview/codly:1.3.0": *
#import "@preview/drafting:0.2.2": *
#import "utils.typ": program-specific
#import "@preview/zebraw:0.6.1": zebraw

#let page_numbering = "1 / 1"
#let heading_numbering = "1.1.1"

#let __tpl_messages_array = (
  "submission_date": (
    "de": "Abgabedatum",
    "en": "Submission Date",
  ),
  "processing_period": (
    "de": "Bearbeitungszeitraum",
    "en": "Processing Period",
  ),
  "course": (
    "de": "Kurs",
    "en": "Course",
  ),
  "company": (
    "de": "Ausbildungsfirma",
    "en": "Training Company",
  ),
  "department": (
    "de": "Abteilung",
    "en": "Department",
  ),
  "supervisor_company": (
    "de": "Betreuer der Ausbildungsfirma",
    "en": "Supervisor of the Training Company",
  ),
  "supervisor_university": (
    "de": "Gutachter der Dualen Hochschule",
    "en": "Reviewer of the Duale Hochschule",
  ),
  "part_of": (
    "de": "Im Rahmen der Prüfung:",
    "en": "As part of the examination:",
  ),
  "at_the": (
    "de": "an der",
    "en": "at the",
  ),
  "university_pos": (
    "de": "Dualen Hochschule Baden-Württemberg Karlsruhe",
    "en": "Baden-Württemberg Cooperative State University Karlsruhe",
  ),
  "by": (
    "de": "von",
    "en": "by",
  ),
  "list_contents": (
    "de": "Inhaltsverzeichnis",
    "en": "Table of Contents",
  ),
  "list_abbreviations": (
    "de": "Abkürzungsverzeichnis",
    "en": "List of Abbreviations",
  ),
  "list_figures": (
    "de": "Abbildungsverzeichnis",
    "en": "Table of Figures",
  ),
  "list_tables": (
    "de": "Tabellenverzeichnis",
    "en": "Table Directory",
  ),
  "list_code": (
    "de": "Quellcodeverzeichnis",
    "en": "Source Code Directory",
  ),
  "list_bibliography": (
    "de": "Literaturverzeichnis",
    "en": "Bibliography",
  ),
  "appendix": (
    "de": "Anhang",
    "en": "Appendix",
  ),
  "list_appendix": (
    "de": "Anhangsverzeichnis",
    "en": "Index of Appendices",
  ),
  "list_of_notes": (
    "de": "Notizenverzeichnis",
    "en": "List of Notes",
  ),
)

#let __tpl_program_messages_array = (
  "identification_number": (
    "de": (
      "dhbw": "Matrikelnummer",
      "ihk": "Prüflingsnummer",
    ),
    "en": (
      "dhbw": "Matriculation Number",
      "ihk": "Examinee Number",
    ),
  ),
  "course_of_study": (
    "de": (
      "dhbw": "des Studienganges",
      "ihk": "des Ausbildungsberufes",
    ),
    "en": (
      "dhbw": "in",
      "ihk": "of the apprenticeship occupation",
    ),
  ),
)

#let __tpl_message(idx, lang) = __tpl_messages_array.at(idx).at(lang)

#let __tpl_program_message(idx, lang, program) = (
  __tpl_program_messages_array.at(idx).at(lang).at(program)
)

// usage: caption_with_source("text", [@source])
// prevents the using of the source in the outlines, to enable right sorting when using ieee for bibliography
#let in-outline = state("in-outline", false)
#let caption_with_source(caption_text, source) = context {
  if in-outline.at(here()) {
    caption_text
  } else {
    caption_text + " " + source
  }
}

#let get-separator(v) = if v != none { ", " + v } else { "" }

#let project(
  lang: "en",
  program: "dhbw",
  is_digital: true,
  confidentiality_clause: true,
  examination: none,
  theme: none,
  study_field: none,
  dr_lutz: none,
  title_long: none,
  title_short: none,
  thesis_type: none,
  authors: (
    (
      firstname: none,
      lastname: none,
      identification_number: none,
      course: none,
    ),
  ),
  signature_place: none,
  submission_date: none,
  processing_period: none,
  department: none,
  supervisor_company: none,
  supervisor_university: none,
  abstract: [],
  appendices: none,
  library_paths: (),
  acronyms: (),
  body,
) = {
  // page setup
  set document(title: title_long)
  set page(paper: "a4")

  // set text language (e. g. for smart quotes)
  set text(lang: lang)

  // justify content
  set par(justify: true)

  // font setup (LaTeX Look: 'New Computer Modern')
  set text(font: "New Computer Modern", size: 12pt)

  // heading setup
  set heading(numbering: heading_numbering)

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    it
  }

  show heading: it => {
    text(font: "Libertinus Serif", it)
    v(0.2cm)
  }

  show heading.where(level: 1): it => {
    text(size: 18pt, it)
  }

  show heading.where(level: 2): it => {
    v(weak: true, 1.2cm)
    text(size: 16pt, it)
  }


  show heading.where(level: 3): it => {
    text(size: 14pt, it)
  }

  // load additional syntaxes for code
  set raw(syntaxes: "syntax/cds.sublime-syntax")

  // fancy inline code
  // if you don't like them, just remove this section.
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 2pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // fancy code blocks
  // if you don't like them, just remove this section.
  // show: codly-init.with()
  // let languages-extended = codly-languages
  // languages-extended.insert()
  // codly(
  //   languages: languages-extended,
  //   zebra-fill: none,
  //   display-icon: false,
  //   display-name: false,
  //   number-align: right + top,
  // )

  // fancy inline links
  // if you don't like them, just remove this section.
  show link: it => {
    if type(it.dest) == str {
      set text(fill: gray.darken(80%))
      underline(
        stroke: (paint: gray, thickness: 0.5pt, dash: "densely-dashed"),
        offset: 4pt,
        it,
      )
    } else {
      it
    }
  }

  // Block quotes
  set quote(block: true)

  // Configure inline notes
  let caution-rect = rect.with(radius: 0.5em)
  set-margin-note-defaults(rect: caution-rect, fill: orange.lighten(80%))

  // Allow code blocks to span multiple pages
  show figure.where(kind: raw): set block(breakable: true)

  let ident_label = __tpl_program_message(
    "identification_number",
    lang,
    program,
  )

  if authors.any(it => "course" in it) {
    ident_label += ", " + __tpl_message("course", lang)
  }

  // Coversheet
  grid(
    rows: (12em, 12em, 12em),
    // align: (_, row) => (center + top, center + top, center + bottom).at(row),
    // SAP and DHBW logo
    grid(
      columns: 1fr,
      align(center)[
        #program-specific(program, (
          "dhbw": image("assets/DHBW-logo.svg.png", height: 2.5cm),
        ))
      ],
    ),

    // Meta
    align(center)[
      #set par(justify: false)

      #text(23pt)[*#title_long*]

      #linebreak()

      #smallcaps(text(1.25em, weight: "semibold")[#thesis_type])

      #linebreak()

      #text(25pt, luma(100))[*#theme*]

      #linebreak()

      #text(15pt)[#study_field]

      #linebreak()

      #for author in authors {
        text(13pt)[*#author.firstname #author.lastname*\: #author.identification_number #linebreak() ]
      }

      #linebreak()

      #text(15pt)[#dr_lutz]
    ],
  )

  // table of contents
  // show level 1 headings in outline in a fancier way, if not desired feel free to remove it
  [#show outline.entry.where(level: 1): it => {
      v(12pt, weak: true)
      strong(it)
    }
    #outline(
      title: [#__tpl_message("list_contents", lang)],
      depth: 3,
      indent: auto,
      target: selector(heading).before(
        <__appendix-start>,
      ),
    )
  ]

  // only display certain outlines if elements for it exist
  context {
    // list of figures
    if query(figure.where(kind: image)).len() > 0 {
      pagebreak()
      heading(__tpl_message("list_figures", lang), numbering: none)
      outline(
        target: figure.where(kind: image).before(<__appendix-start>),
        title: none,
      )
    }

    // list of tables
    if query(figure.where(kind: table)).len() > 0 {
      pagebreak()
      heading(__tpl_message("list_tables", lang), numbering: none)
      outline(
        target: figure.where(kind: table).before(<__appendix-start>),
        title: none,
      )
    }

    // list of source code
    if query(figure.where(kind: raw)).len() > 0 {
      pagebreak()
      heading(__tpl_message("list_code", lang), numbering: none)
      outline(
        target: figure.where(kind: raw).before(<__appendix-start>),
        title: none,
      )
    }
  }

  // display header
  set page(header: {
    context {
      context {
        if here().page-numbering() == page_numbering {
          grid(
            columns: (auto, 1fr),
            align(left, text(title_short)),
            align(right, emph(hydra(1, display: (_, it) => {
              it.body
            }))),
          )
          line(length: 100%, stroke: (paint: gray))
        }
      }
    }
  })

  // display main document and reset page counter
  set page(
    numbering: page_numbering,
    footer: align(center)[
      #context counter(page).display() / #context {
        let end = query(<__thesis_end>).first()
        counter(page).at(end.location()).first()
      }
    ],
    margin: (top: 4cm, x: 2.5cm, bottom: 2.5cm),
  )
  counter(page).update(1)

  set par(leading: 0.9em)

  body
  [#[] <__thesis_end>]

  // display appendix
  if appendices != none {
    set heading(level: 1, outlined: false)
    set page(numbering: "A", footer: auto)
    counter(page).update(1)
    counter(heading).update(0)

    heading(
      __tpl_message("list_appendix", lang),
      numbering: none,
      outlined: true,
    )

    outline(
      depth: 3,
      indent: auto,
      title: none,
      target: selector(heading).after(<__appendix-start>),
    )

    pagebreak(weak: true)
    [#[] <__appendix-start>]

    for appendix in appendices {
      let (appendix_heading, appendix_content) = appendix

      pagebreak()
      set heading(supplement: __tpl_message("appendix", lang), outlined: true)
      heading(
        [#__tpl_message("appendix", lang): #appendix_heading],
        outlined: true,
      )

      appendix_content
    }
  }
}
