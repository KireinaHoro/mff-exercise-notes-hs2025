#let exercise() = {
  let counter = counter("Exercise")

  context [*Exercise #counter.display("1.1") #h(.5em)*]
  counter.step(level: 2)
}

#let exsheet(number, body) = {
  set document(title: [Exercise Sheet Submission #number], author: "Pengcheng Xu")
  set enum(numbering: "(a)(i)")
  set heading(numbering: none)
  set page(
    header: [
      Exercise Sheet #number Submission
      #h(1fr)
      Pengcheng Xu (21-951-876) \<#link("mailto:pengcheng.xu@inf.ethz.ch", "pengcheng.xu@inf.ethz.ch")>
    ],
    footer: context [
      #h(1fr)
      #counter(page).display("1/1", both: true)
    ]
  )
  
  let counter = counter("Exercise")
  counter.update((number, 1))
  
  [= Exercise Sheet #number Submission]
  
  body
}