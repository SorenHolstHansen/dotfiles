#import "@preview/lilaq:0.6.0" as lq
#import "@preview/tiptoe:0.3.1"
#import "@preview/elembic:1.1.0" as e

#let lq = lq

#let template(
  doc,
) = {
  set document(author: "Søren Holst Hansen")
  set page(margin: (x: 10em, y: 7em))
  set par(spacing: 0.75em, justify: true)
  set text(font: "New Computer Modern")
  show raw: set text(font: "New Computer Modern")
  show math.equation: set text(weight: "regular")
  show heading: set block(above: 1.4em, below: 1em)

  set enum(numbering: "a)")
  
  doc
}

#let pretty-diagram = it => {
  show: lq.set-tick(inset: 1.5pt, outset: 1.5pt, pad: 0.4em)
  show: lq.set-spine(tip: tiptoe.stealth)
  show: lq.set-diagram(
    xaxis: (position: 0, tick-distance: 1, filter: (value, distance) => value != 0),
    yaxis: (position: 0, tick-distance: 1, filter: (value, distance) => value != 0),
    grid: (stroke: 0.5pt + gray, stroke-sub: 0.2pt + silver)
  )

  show: lq.set-label(pad: none, angle: 0deg)
  show: e.show_(
    lq.label.with(kind: "y"),
    it => place(bottom + right, dy: -100%, dx: -.5em, it)
  )
  show: e.show_(
    lq.label.with(kind: "x"),
    it => place(left + top, dx: 100%, dy: .4em, it)
  )

  it
}

#let theorem = it => {
  rect(
    width: 100%,
    stroke: (left: 1pt + black),
    it
  )
}

/*
#import "@local/template:0.1.0": *
#show: template

#theorem[
  *Sætning*: Bayes' formel

  Lad $A$ og $B$...
]

#show: pretty-diagram
#lq.diagram(
  width: 7cm,
  height: 7cm,
  legend: (position: top + left),
  xlabel: $x$,
  ylabel: $y$,
  xaxis: (lim: (-4.9, 4.9)),
  yaxis: (lim: (-4.9, 4.9)),
)
*/
