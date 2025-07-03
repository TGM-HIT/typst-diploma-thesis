// import external packages here, so that package versions do not diverge
#import "@preview/alexandria:0.2.0"
#import "@preview/codly:1.3.0"
#import "@preview/datify:0.1.4"
#import "@preview/glossarium:0.5.6"
#import "@preview/hydra:0.6.1"
#import "@preview/i-figured:0.2.4"
#import "@preview/linguify:0.4.2"
#let outrageous = if sys.version < version(0, 13, 0) {
  import "@preview/outrageous:0.3.0"
  outrageous
} else {
  import "@preview/outrageous:0.4.0"
  outrageous
}
