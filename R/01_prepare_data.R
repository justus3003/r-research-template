# Step 1: read the raw data, clean it and save the result.
# Run from the project root: Rscript R/01_prepare_data.R

source(here::here("R", "helpers.R"))

# Example data that ships with R. Replace this with your own data source.
data <- datasets::mtcars
data$car <- rownames(data)
rownames(data) <- NULL

dir.create(here::here("data"), showWarnings = FALSE)
utils::write.csv(data, here::here("data", "mtcars_clean.csv"), row.names = FALSE)

message("Saved ", nrow(data), " rows to data/mtcars_clean.csv")
