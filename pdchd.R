
DiagrammeR::grViz("
digraph {
  graph [ranksep = 0.2]
  node [shape = plaintext]
    E [label = 'PD']
    O [label = 'CHD']
    B [label = 'Tooth loss']
    C [label = 'Diet']
  edge [minlen = 2]
    E->O
    E->B
    B->C
    C->O
  { rank = max; E; O }
}
")


