# Create new objects with <-
x <- 3 * 4

x
x <- 3 * 10

x

# R Functions
seq(1, 10)
x <- seq(1, 10)

x

# Install gapminder package
install.packages("gapminder")

# Access gapminder data
library(tidyverse)
library(gapminder)

head(gapminder)

# Data types in gapminder: fctr = factors, int = integer, and dbl= doubles

# Introducing dplyr functions: filter(), arrange(), select(), mutate(), summarise()

# Filter rows with filter()
filter(gapminder, country == "Australia", year > 2000)
filter(gapminder, continent %in% c("Asia", "Oceania"))
filter(gapminder, pop > 500000 & pop < 1000000)
# Using the symbol "&" is more restrictive
filter(gapminder, pop > 500000 | pop < 1000000)

# Make a dataframe
df <- filter(gapminder, continent %in% c("Asia", "Oceania"))

# Distint function
distinct(gapminder, continent)
distinct(gapminder, continent, country)

# Base function
gapminder$continent
gapminder$country

# Using distinct with filter--easier way
distinct(filter(gapminder, continent == "Oceania"), country)
distinct(filter(gapminder, continent %in% c("Asia", "Europe")), country)

# Handy operations: == (equal to) & =! (isn't equal to)
# Handy operations: >= (greater than or equal to) & <= (less than or equal to)
# Handy operations: | (OR), & (AND), %in% (in)

# Arrange rows with arranger function
arrange(gapminder, country, year)
arrange(gapminder, country, desc(year))

# Min and Max of the arrange function
slice_min(gapminder, lifeExp)
slice_max(gapminder, pop)

# Select columns with select()
select(gapminder, country, year, pop)
select(gapminder, country:pop)
select(gapminder, -(lifeExp:pop))
vars <- c("country", "year", "lifeExp")
select(gapminder, starts_with("c"))

# Add new variables with mutate()
mutate(gapminder, gdp = gdpPercap * pop)

# Select, transform, and add new variables with transmute()
transmute(gapminder, country, year, gdp = gdpPercap * pop)

# Create summaries with summarise()
summarise(
  gapminder, avg_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap)
)

# Creating grouped summaries with group_by() and summarise()
gapminder_continent <- group_by(gapminder, continent)

summarise(
  gapminder_continent, avg_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap)
)

# Combine multiple operations with the pipe
gapminder |> 
  group_by(continent) |> 
  summarise(avg_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap)) |> 
  arrange(avg_gdp_per_cap)

gapminder |> 
  group_by(continent) |> 
  summarise(avg_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap)) |> 
  ggplot(aes(x = continent, y = avg_gdp_per_cap)) + 
  geom_col() + 
  theme_minimal()

# A HANDY SHORTCUT FOR COUNTING DATA WITH count()
gapminder |> 
  distinct(continent, country) |> 
  group_by(continent) |> 
  summarise(n_countries = n())

gapminder |> 
  distinct(continent, country) |> 
  count(continent)