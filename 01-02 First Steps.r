# %% Penguins

library(tidyverse)
library(palmerpenguins)
library(ggthemes)

# %% Plot

ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
    geom_point(mapping = aes(color = species, shape = species)) +
    geom_smooth(method = "lm") +
    labs(
        title = "Penguin Body Mass vs. Flipper Length",
        x = "Flipper Length (mm)",
        y = "Body Mass (g)",
        color = "Species", shape = "Species"
    )

# %% 1.2.5 Exercises

# %% 1. How many rows are in penguins? How many columns?

print(nrow(penguins))
print(ncol(penguins))

# %% 2. What does the bill_depth_mm variable in the penguins data frame describe? Read the help for ?penguins to find out.

# It measures the depth in mm of the bills of the penguins. The depth is the height of the bill, as opposed to the length. Bill width is not measured.

# %% 3. Make a scatterplot of bill_depth_mm vs. bill_length_mm. That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm on the x-axis. Describe the relationship between these two variables.

ggplot(
    data = penguins,
    mapping = aes(x = bill_length_mm, y = bill_depth_mm, color = species)
) +
    geom_point(mapping = aes(shape = species), na.rm = TRUE) +
    geom_smooth(method = "lm", na.rm = TRUE) +
    labs(
        title = "Penguin Bill Length vs. Depth (mm)",
        subtitle = "Segmented by species: Adelie, Chinstrap, & Gentoo",
        x = "Bill Length (mm)",
        y = "Bill Depth (mm)",
        color = "Species", shape = "Species"
    )

# %% 4. What happens if you make a scatterplot of species vs. bill_depth_mm? What might be a better choice of geom?

# Well, I assume it's going to be a lot of lines...'

# %% 4a.

ggplot(
    data = penguins,
    mapping = aes(x = species, y = bill_depth_mm, color = species, shape = species)
) +
    geom_point(na.rm = TRUE) +
    labs(
        title = "Penguine Bill Depth by Species",
        x = "Species",
        y = "Bill Depth (mm)",
        color = "Species", shape = "Species"
    )

# %% 4b.

ggplot(
    data = penguins,
    mapping = aes(x = species, y = bill_depth_mm, color = species)
) +
    geom_boxplot(na.rm = TRUE) +
    labs(
        title = "Penguine Bill Depth by Species",
        x = "Species",
        y = "Bill Depth (mm)",
        color = "Species"
    )


# Obligatory link to https://nightingaledvs.com/ive-stopped-using-box-plots-should-you/

# %% 4c.

ggplot(
    data = penguins,
    mapping = aes(x = species, y = bill_depth_mm, color = species)
) +
    geom_jitter(alpha = 0.3, height = 0, width = 0.1, na.rm = TRUE) +
    labs(
        title = "Penguine Bill Depth by Species",
        x = "Species",
        y = "Bill Depth (mm)",
        color = "Species"
    )

# %% 4d.

ggplot(
    data = penguins,
    mapping = aes(x = species, y = bill_depth_mm, color = species)
) +
    geom_bin_2d(na.rm = TRUE) +
    labs(
        title = "Penguine Bill Depth by Species",
        x = "Species",
        y = "Bill Depth (mm)",
        color = "Species"
    )

# %% 5. Why does the following give an error and how would you fix it?

ggplot(data = penguins) +
  geom_point()

# It doesn't set x or y axes. You gotta add a mapping in the aesthetics

# %% 6. What does the na.rm argument do in geom_point()? What is the default value of the argument? Create a scatterplot where you successfully use this argument set to TRUE.

# It removes unavailable values silently. Useful. Applied above.

# %% 7. Add the following caption to the plot you made in the previous exercise: “Data come from the palmerpenguins package.” Hint: Take a look at the documentation for labs().

ggplot(
    data = penguins,
    mapping = aes(x = species, y = bill_depth_mm, color = species)
) +
    geom_jitter(alpha = 0.3, height = 0, width = 0.1, na.rm = TRUE) +
    labs(
        title = "Penguine Bill Depth by Species",
        x = "Species",
        y = "Bill Depth (mm)",
        color = "Species",
        caption = "Data from the palmerpenguins package."
    )

# %% 8. Recreate the following visualization. What aesthetic should bill_depth_mm be mapped to? And should it be mapped at the global level or at the geom level?

ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
    geom_point(mapping = aes(color = bill_depth_mm), na.rm = TRUE) +
    geom_smooth(na.rm = TRUE)

## % 9. Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions.

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
    geom_point() +
    geom_smooth(se = FALSE)


# %% 10. Will these two graphs look different? Why/why not?

# I think they will be

# %% 10a.

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
    geom_point() +
    geom_smooth()

# %% 10b.

ggplot() +
    geom_point(
        data = penguins,
        mapping = aes(x = flipper_length_mm, y = body_mass_g)
    ) +
    geom_smooth(
        data = penguins,
        mapping = aes(x = flipper_length_mm, y = body_mass_g)
    )
