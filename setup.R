
library(flexdashboard)
library(plotly)
library(tidyverse)# cut this down??
library(readxl)
library(tidyr) # required for separate functionality
library(leaflet)
library(htmlwidgets)
library(htmltools)
# Install thematic and un-comment for themed static plots (i.e., ggplot2)
# thematic::thematic_rmd()

# colorblind-friendly palettes from http://www.cookbook-r.com/Graphs/Colors_%28ggplot2%29/#a-colorblind-friendly-palette -
# original credit looks like  http://jfly.iam.u-tokyo.ac.jp/color/, but that no longer exists.

# The palette with grey:
#cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# The original palette with black:
cbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

SQA_input_file = "./data-sources/attainment-statistics-december-2022.xlsx"
SQA_LA_input_file = "./data-sources/attainment-statistics-december-2022-education-authorities-nationalprogressionawards.xlsx"
## We have to store these files locally - something about the web setup means this won't load directly

# could fetch this one live
#LA_mapping_boundaries_file = "https://martinjc.github.io/UK-GeoJSON/json/sco/topo_lad.json"
LA_mapping_boundaries_file = "./data-sources/topo_lad-Scotland-LAs.json"

# There are no easy distance metrics to fuzzy match the LA names as given by the NPA to those of the mapping resource.
name_mapping_file = "./data-sources/geojson-namematching.csv" # constructed by hand
