library(dplyr)

# Define filenames and corresponding sampling dates
filenames <- list(
    "uber-raw-data-apr14.csv",
    "uber-raw-data-aug14.csv",
    "uber-raw-data-jul14.csv",
    "uber-raw-data-jun14.csv",
    "uber-raw-data-may14.csv",
    "uber-raw-data-sep14.csv"
)

# Convert filenames list to a character vector
filenames <- unlist(filenames)

sampling_dates <- c("2014-04", "2014-08", "2014-07", "2014-06", "2014-05", "2014-09")

# Read and merge files, adding the sampling date column
merged_data <- bind_rows(
    lapply(1:length(filenames), function(i) {
        file <- filenames[i]  # filenames[i] now works as a character string
        data <- read.csv(file, col.names = c("Date    time  ", "latitude", "longitude", "Base"))
        data$sampling_date <- sampling_dates[i]  # Add the sampling date column
        return(data)
    })
)

# View the first few rows of the merged data
print(head(merged_data))
