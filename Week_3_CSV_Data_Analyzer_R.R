# WEEK 3 PROJECT: CSV DATA ANALYZER
# Programming Language: R

cat("========================================\n")
cat("           CSV DATA ANALYZER\n")
cat("========================================\n")

# 1. Read numeric values from a CSV file
cat("\n1. READ VALUES FROM CSV\n")
if (file.exists("values.csv")) {
  values_data <- read.csv("values.csv", stringsAsFactors = FALSE)
  if ("Values" %in% names(values_data)) {
    values <- as.numeric(values_data$Values)
  } else {
    values <- as.numeric(values_data[[1]])
  }
  cat("Values read from values.csv:\n")
  print(values)
} else {
  values <- c(10, 20, 30, 40, 50)
  cat("values.csv not found. Using sample values:\n")
  print(values)
}

# 2. Generate a sequence
cat("\n2. GENERATE A SEQUENCE\n")
start_value <- 2
end_value <- 12
step_value <- 2
generated_sequence <- seq(from = start_value, to = end_value, by = step_value)
cat("Generated sequence:\n")
print(generated_sequence)

# 3. Combine two vectors
cat("\n3. COMBINE TWO VECTORS\n")
vector_a <- c(1, 3, 5)
vector_b <- c(2, 4, 6)
combined_vector <- c(vector_a, vector_b)
cat("First vector:\n")
print(vector_a)
cat("Second vector:\n")
print(vector_b)
cat("Combined vector:\n")
print(combined_vector)

# 4. Extract temperatures by index
cat("\n4. EXTRACT SELECTED TEMPERATURES\n")
if (file.exists("temperatures.csv")) {
  temperature_data <- read.csv("temperatures.csv", stringsAsFactors = FALSE)
  if ("Temperature" %in% names(temperature_data)) {
    temperatures <- as.numeric(temperature_data$Temperature)
  } else {
    temperatures <- as.numeric(temperature_data[[1]])
  }
} else {
  temperatures <- c(29, 30, 31, 32, 30, 28, 27, 28, 29, 30, 29, 28)
  cat("temperatures.csv not found. Using sample monthly temperatures.\n")
}

selected_indices <- c(1, 4, 7, 10)
selected_indices <- selected_indices[selected_indices <= length(temperatures)]
cat("Temperatures at indices 1, 4, 7, and 10 (where available):\n")
print(temperatures[selected_indices])

# 5. Calculate average marks for subjects
cat("\n5. SUBJECT AVERAGES\n")
if (file.exists("marks.csv")) {
  marks <- read.csv("marks.csv", stringsAsFactors = FALSE)
  numeric_columns <- vapply(marks, is.numeric, logical(1))
  if (any(numeric_columns)) {
    subject_averages <- colMeans(marks[, numeric_columns, drop = FALSE], na.rm = TRUE)
    print(round(subject_averages, 2))
  } else {
    cat("marks.csv contains no numeric subject columns.\n")
  }
} else {
  marks <- data.frame(
    Maths = c(80, 75, 90),
    Science = c(85, 88, 79),
    English = c(78, 82, 87)
  )
  cat("marks.csv not found. Using sample marks:\n")
  print(marks)
  cat("Average marks for each subject:\n")
  print(round(colMeans(marks), 2))
}

cat("\nWeek 3 project completed successfully.\n")
