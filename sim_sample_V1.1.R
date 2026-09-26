# Define a function to generate simulated exam marks on a 0–100 scale

rnorm2marks <- function(n = 10020, m = 0, s = 1) {
  a <- rnorm(n, m, s) # Generate 10,020 values from a normal distribution (mean = 0, sd = 1)
  a <- sort(a) # Sort generated values in ascending order
  a <- a[11:10010] # Trim off the 10 lowest and 10 highest extreme values (outliers)
  r <- range(a) # Find the minimum and maximum values of the remaining vector
  round((a - r[1]) * 100 / (r[2] - r[1])) # Min-max scale values to 0-100 range and round to integers
}

# Define a custom helper function to calculate summary statistics for a numeric vector
mysumry <- function(x = 1:10) {
  data.frame(
    N = length(x), # Number of observations
    Min = round(min(x), 1), # Minimum value rounded to 1 decimal place
    Max = round(max(x), 1), # Maximum value rounded to 1 decimal place
    Mean = round(mean(x), 1), # Mean value rounded to 1 decimal place
    SD = round(sd(x), 1) # Standard deviation rounded to 1 decimal place
  )
}

# Set seed for reproducibility and create baseline population 'a' (10,000 simulated marks)
set.seed(231)
a <- rnorm2marks()

# Define a function to simulate sample means with default values for population, repetitions, and sample size

sm <- function(pop = c(1:10), rpt = 100, ss = 64) {
  r <- c() # Initialize an empty vector 'r' to store the sample means

  # Loop 'rpt' times to perform the sampling experiment
  for (i in 1:rpt) {
    # Draw a random sample of size 'ss' from the 'pop' vector with replacement
    x <- sample(pop, ss, replace = TRUE)

    # Calculate the mean of the current sample
    mu <- mean(x)

    # Append the calculated mean to the results vector 'r'
    r <- c(r, mu)
  }

  # Return the vector containing all calculated sample means
  return(r)
}

# --- SIMULATION 1: Sample size 64, Repetitions 100 ---

set.seed(231) # Reset seed for reproducible sampling

r64100 <- sm(pop = a, rpt = 100, ss = 64) # Save vector of 100 sample means
s64r100 <- mysumry(r64100) # Calculate summary stats for this simulation

# --- SIMULATION 2: Sample size 64, Repetitions 1000 ---

set.seed(231) # Reset seed for reproducible sampling

r641000 <- sm(pop = a, rpt = 1000, ss = 64) # Save vector of 1,000 sample means
s64r1000 <- mysumry(r641000) # Calculate summary stats for this simulation

# --- SIMULATION 3: Sample size 256, Repetitions 100 ---

set.seed(231) # Reset seed for reproducible sampling

r256100 <- sm(pop = a, rpt = 100, ss = 256) # Save vector of 100 sample means
s256r100 <- mysumry(r256100) # Calculate summary stats for this simulation


# --- SIMULATION 4: Sample size 256, Repetitions 1000 ---

set.seed(231) # Reset seed for reproducible sampling

r2561000 <- sm(pop = a, rpt = 1000, ss = 256) # Save vector of 1,000 sample means
s256r1000 <- mysumry(r2561000) # Calculate summary stats for this simulation


# Combine summary outputs vertically (row-wise binding) into a single data frame
y <- rbind(s64r100, s64r1000)
y <- rbind(y, s256r100)
y <- rbind(y, s256r1000)

# Create a data frame for the sample size metadata matching each simulation configuration
sample_size <- data.frame(SSize = c(64, 64, 256, 256))

# Column-bind the sample size column to the summary results table
z <- cbind(sample_size, y)
