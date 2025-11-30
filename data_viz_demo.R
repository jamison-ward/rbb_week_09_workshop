# setup

pacman::p_load(tidyverse, here, scales)

gss_cat <- gss_cat

# 1: scatter plot

ggplot(data = gss_cat,
       mapping = aes(x = age, y = tvhours)) +
  # geom_point() +
  geom_smooth() +
  theme_classic()

# 2: histogram

ggplot(data = gss_cat,
       mapping = aes(x = age)) +
  geom_histogram(binwidth = 1,
                 color = "blue",
                 fill = "lightblue") +
  theme_light()

# 3: histogram OR line plot

# histogram

ggplot(data = gss_cat,
       mapping = aes(x = year)) +
  geom_histogram(aes(fill = race),
                 position = "fill") +  # Use position = "fill" to visualize proportion of each race
  scale_x_continuous(breaks = c(2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014)) +
  scale_y_continuous(labels = label_percent())


# line plot

gss_cat %>% 
  count(year, race) %>% 
  ggplot(mapping = aes(x = year, y = n)) +
  geom_line(aes(color = race),
            show.legend = FALSE) +
  scale_x_continuous(breaks = c(2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014)) +
  facet_wrap(~race) +
  labs(x = "",
       y = "",
       title = "Number of Individuals of Each Race Surveyed per Year") +
  theme_light()

