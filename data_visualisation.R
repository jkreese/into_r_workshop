# Load the relevant data
library(tidyverse)

# Load the data
mpg

# Learn more about a data set
?mpg

# Set up plot
library(ggplot2)
library(ggthemes)

ggplot(data=mpg)

# Map Aesthetics
ggplot(data = mpg, mapping = aes(x = displ, y =hwy))
ggplot(data = mpg, mapping = aes(x = displ, y =hwy)) + geom_point()

# Looking at groups in the data
ggplot(data = mpg, mapping = aes(x=displ, y = hwy, color = class)) + geom_point()

# Add more information
ggplot(data = mpg, mapping = aes(x=displ, y = hwy, color = class)) + 
  geom_point()+ geom_point() + 
  geom_smooth(method = "lm") + 
  scale_color_colorblind()

# Look at the relationship across all
ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) + 
  geom_point(mapping = aes (color = class))+
  geom_smooth(method = "lm") + 
  scale_color_colorblind()

# Add useful titles and labels
ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) + 
  geom_point(mapping = aes (color = class))+
  geom_smooth(method = "lm") +
  labs(
    title = "Engine displacement and highway miles per gallon",
    subtitle = "Values for seven different classes of cars",
    x = "Engine displacement (L)",
    y = "Highway miles per gallon"
  )
scale_color_colorblind()

# Adding a caption

ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) + 
  geom_point(mapping = aes (color = class))+
  geom_smooth(method = "lm") +
  labs(
    title = "Engine displacement and highway miles per gallon",
    subtitle = "Values for seven different classes of cars",
    caption = "Data come from the ggplot2 package",
    x = "Engine displacement (L)",
    y = "Highway miles per gallon"
  )
scale_color_colorblind()

# How many rows are in mpg?
nrow(mpg)
ncol(mpg)

# What does the drv variable describe?
?mpg

# Make a scatterplot of hwy vs cyl & class vs drv
ggplot(data = mpg, mapping = aes(x=hwy, y = cyl, color = class)) + geom_point()
ggplot(data = mpg, mapping = aes(x=class, y = drv, color = class)) + geom_point()

# How to address errors - tidyverse gives the most helpful error message
ggplot(data=mpg) +
  geom_point()

# Flexible visualization
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class == "2 seater"))
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class == "compact"))
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class == "suv"))

# Seeing two classes at the same time
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class %in% c("2 seater", "suv")))

# Finding specific class names
distinct(mpg, class)

# Changing the look of your plots
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "red")

# Map a continuous variable to color, size, and shape
# How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ))
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = displ))

# A continuous variable cannot be mapped to the shape aesthetic b/c there's not an infinite number of shapes
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = displ))

# Let's clean up our graph
ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) + 
  geom_point(mapping = aes (color = class))+
  geom_smooth(method = "lm") +
  theme(
    legend.background = element_rect(),
    legend.position = "top",
    plot.caption.position = "plot",
    plot.subtitle = element_text(color = "red"),
    plot.title = element_text(face = "bold", color = "blue")
  ) +
  labs(
    title = "Engine displacement and highway miles per gallon",
    subtitle = "Values for seven different classes of cars",
    caption = "Data come from the ggplot2 package",
    x = "Engine displacement (L)",
    y = "Highway miles per gallon"
  )
scale_color_colorblind()

# Creating your own theme
ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) + 
  geom_point(mapping = aes (color = class))+
  geom_smooth(method = "lm") +
  theme(
    legend.position = "bottom",
    panel.grid = element_blank(),
    panel.background = element_blank(),
    plot.title = element_text(face = "bold", color = "blue"),
    plot.title.position = "plot",
  ) +
  labs(
    title = "Engine displacement and highway miles per gallon",
    subtitle = "Values for seven different classes of cars",
    caption = "Data come from the ggplot2 package",
    x = "Engine displacement (L)",
    y = "Highway miles per gallon"
  )
scale_color_colorblind()

# Visualizing distributions
ggplot(mpg, aes(x = drv)) + 
  geom_bar()

# Visualizing distributions--reorder in relation to frequency
ggplot(mpg, aes(x = fct_infreq(drv))) +
  geom_bar()

# Visualizing numeric variables option 1
ggplot(mpg, aes(x = hwy)) +
  geom_histogram()

# Visualizing numeric variables option 2
ggplot(mpg, aes(x = hwy)) +
  geom_density()

# Visualizing numeric variables option 2 with color line
ggplot(mpg, aes(x = hwy, color = drv)) +
  geom_density()

# Visualizing numeric variables option 2 with color fill--alpha = transparency
ggplot(mpg, aes(x = hwy, colour = drv, fill = drv)) +
  geom_density(alpha = 0.5)


