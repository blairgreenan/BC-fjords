# Script to plot map of BC fjord locations

library(tidyverse)
library(ggOceanMaps)
library(ggspatial)

# specify the fjord lat/lon
# Rivers Inlet
RI <- data.frame(lon=-127.548, lat=51.518)
# Knight Inlet
KI <- data.frame(lon=-125.621, lat=50.790)
# Bute Inlet
BI <- data.frame(lon=-124.883, lat=50.667)
# Vancouver Island
VI <- data.frame(lon=-126.25, lat=50)

basemap(limits = c(-129, -122, 49, 52), bathy.style = "rcb", rotate = TRUE) +
  ggspatial::geom_spatial_point(data = RI, aes(x = lon, y = lat), color = "red", size = 2) +
  ggspatial::geom_spatial_label(data = RI, aes(x = lon+0.6, y = lat+0.0), label = "Rivers Inlet", color = "black") +
  ggspatial::geom_spatial_point(data = KI, aes(x = lon, y = lat), color = "red", size = 2) +
  ggspatial::geom_spatial_label(data = KI, aes(x = lon+0.6, y = lat+0.3), label = "Knight Inlet", color = "black") +
  ggspatial::geom_spatial_point(data = BI, aes(x = lon, y = lat), color = "red", size = 2) +
  ggspatial::geom_spatial_label(data = BI, aes(x = lon+0.6, y = lat-0.0), label = "Bute Inlet", color = "black") +
  ggspatial::geom_spatial_text(data = VI, aes(x = lon, y = lat, label = "Vancouver Island"), angle = -45, color = "black")


ggsave("BC_fjords_map.jpg", width = 7, height = 6, units = "in", scale = 1.1, dpi = 1200)

