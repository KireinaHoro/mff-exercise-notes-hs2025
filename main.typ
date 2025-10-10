#import "template.typ": *

#let title = "Mathematical Foundations for Finance (Exercise Sessions)"
#let author = "Prof. Dr. M. Schweizer"
#let professor = "Chiara Rossato"
#let creater = "Pengcheng Xu"
#let time = "Fall 2025"
#let abstract = [
  These are notes during the exercise sessions in HS2025. Exercise sessions are Friday 8:00-10:00 in HG D 5.2. Office hours are Monday and Thursday 12:00-13:00 in HG G. Course website at #link("https://metaphor.ethz.ch/x/2025/hs/401-3913-01L/").  Since these notes are public on GitHub, the materials password is not posted here.
]

#show: note_page.with(title, author, professor, creater, time, abstract)

#set footnote(numbering: "[1]")
#set enum(numbering: "(a)")

// Notes during exercise sessions
#include "ex1.typ"
#include "ex2.typ"
#include "ex3.typ"
#include "ex4.typ"