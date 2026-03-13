---
  title: "Danske Konger"
author: "Luna lund"
date: "2026-03-13"
output: html_document
---
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
kings <- read_csv("data/kings.csv", show_col_types = FALSE)
glimpse(kings)

kings <- kings %>%
  mutate(
    Start_year = as.numeric(Start_year),
    End_year = as.numeric(End_year)
  ) %>%
  filter(!is.na(Start_year), !is.na(End_year)) %>%
  mutate(duration = End_year - Start_year)

glimpse(kings)

avg_duration <- mean(kings$duration, na.rm = TRUE)
avg_duration

kings %>%
  filter(duration > avg_duration) %>%
  select(Name, Start_year, End_year, duration)

kings %>%
  filter(duration > avg_duration) %>%
  count()
top_three <- kings %>%
  arrange(desc(duration)) %>%
  slice(1:3)
top_three %>%
  mutate(Days = duration * 365) %>%
  select(Name, duration, Days)

kings <- kings %>%
  mutate(midyear = Start_year + (End_year - Start_year) / 2)
ggplot(kings, aes(x = midyear, y = duration)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  labs(
    title = "Danske kongers regeringstid gennem historien",
    x = "Midtpunkt af regeringstid",
    y = "Regeringstid (år)"
  ) +
  theme_bw(base_size = 14)
