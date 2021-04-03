# Trouver les easter eggs

f <- st_read("../data/Jardin_true_836_788.gpkg")

osm_ids <- f$osm_id

length(osm_ids)

length(osm_ids)/50

osm_ids_easter <- sample(osm_ids, 500)

# Easter egg 1
osm_ids_easter1 <- sample(osm_ids_easter, length(osm_ids_easter)/10)

# Easter egg 2
remaining <- setdiff(osm_ids_easter, osm_ids_easter1)
osm_ids_easter2 <- sample(remaining, length(remaining)/2)

# Easter egg3
remaining <- setdiff(remaining, osm_ids_easter2)
osm_ids_easter3 <- remaining

length(osm_ids_easter1)
length(osm_ids_easter2)
length(osm_ids_easter3)

row1 <- paste0("osm_id in (", paste(osm_ids_easter1, collapse=","), ")") # coller cette ligne dans le filtre QGIS
row2 <- paste0("osm_id in (", paste(osm_ids_easter2, collapse=","), ")") # coller cette ligne dans le filtre QGIS
row3 <- paste0("osm_id in (", paste(osm_ids_easter3, collapse=","), ")") # coller cette ligne dans le filtre QGIS

write.table(row1, "easter-egg1.txt", row.names = F, col.names = F, quote = F)
write.table(row2, "easter-egg2.txt", row.names = F, col.names = F, quote = F)
write.table(row3, "easter-egg3.txt", row.names = F, col.names = F, quote = F)

length(osm_ids_easter)
