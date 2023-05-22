# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

split_low <- lapply(split_math, tolower)

str(split_low)

# Transform: use anonymous function inside lapply
names <- lapply(split_low, function(x) x[1])
years <- lapply(split_low, function(x) x[2])

# Generic select function
select_el <- function(x, index) {
  x[index]
}

names <- lapply(split_low, select_el, index = 1)
years <- lapply(split_low, select_el, index = 2)

lapply(split_low, function(x) {
  if (nchar(x[1]) > 5) {
    return(NULL)
  } else {
    return(x[2])
  }
})
