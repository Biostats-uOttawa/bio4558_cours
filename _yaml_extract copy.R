library(yaml)
library(stringr)
library(tibble)
library(dplyr)
library(purrr)
library(glue)
library(knitr)
library(kableExtra)

make_rectangular <- function(.data) {
  map_dfr(.data, ~ tibble(!!!.x))
}


ui_list <- function(vec) {
  for (x in vec) {
    cat("-", x, "\n")
  }
}

dat <- read_yaml("_course.yml")
team_df <- make_rectangular(dat$team)
schedule_df <- make_rectangular(dat$schedule)
timetable_df <- make_rectangular(dat$timetable)
nlecturer <- sum(team_df$role == "lecturer")
ntutor <- sum(team_df$role == "TA")


