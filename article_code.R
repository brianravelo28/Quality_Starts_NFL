# libraries

library(tidyverse)
library(ggplot2)
library(caret)
library(leaps)
library(ggpubr)
library(useful)
library(colorspace)
library(corrr)
library(cowplot)
library(ggdark)
library(ggforce)
library(ggrepel)
library(ggridges)
library(ggsci)
library(ggtext)
library(ggthemes)
library(grid)
library(gridExtra)
library(patchwork)
library(rcartocolor)
library(scico)
library(showtext)
library(shiny)
library(plotly)
library(highcharter)
library(echarts4r)
library(teamcolors)
library(knitr)
library(dplyr)
library(ggimage)
library(scales)
library(nflfastR)
library(devtools)
library(ggradar)
library(fmsb)
library(ggthemr)
library(tvthemes)
library(hrbrthemes)
library(gcookbook)
library(DataCombine)
library(GGally)

# load datasets

`2020_team_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2020_Season_Datasets/function_practice/2020_team_defense.txt")

`2020_passing_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2020_Season_Datasets/function_practice/2020_passing_defense.txt")

`2020_scoring_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2020_Season_Datasets/function_practice/2020_scoring_defense.txt")

`2020_afc_standings` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2020_Season_Datasets/function_practice/2020_afc_standings.txt")

`2020_nfc_standings` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2020_Season_Datasets/function_practice/2020_nfc_standings.txt")

`2020_def_vs_QBs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2020_Season_Datasets/function_practice/2020_def_vs_QBs.txt")

team_abbreviations_2020.2021 <- c("ARI", "ATL", "BAL", "BUF", "CAR", "CHI", "CIN", "CLE", "DAL", "DEN", "DET", "GNB", "HOU", "IND", "JAX", "KAN", "LVR", "LAC", "LAR", "MIA", "MIN", "NWE", "NOR", "NYG", "NYJ", "PHI", "PIT", "SFO", "SEA", "TAM", "TEN", "WAS")

team_abbreviations_2017.2019 <- c("ARI", "ATL", "BAL", "BUF", "CAR", "CHI", "CIN", "CLE", "DAL", "DEN", "DET", "GNB", "HOU", "IND", "JAX", "KAN", "LAC", "LAR", "MIA", "MIN", "NWE", "NOR", "NYG", "NYJ", "OAK", "PHI", "PIT", "SFO", "SEA", "TAM", "TEN", "WAS")

team_abbreviations_2016 <- c("ARI", "ATL", "BAL", "BUF", "CAR", "CHI", "CIN", "CLE", "DAL", "DEN", "DET", "GNB", "HOU", "IND", "JAX", "KAN", "LAR", "MIA", "MIN", "NWE", "NOR", "NYG", "NYJ", "OAK", "PHI", "PIT", "SDG", "SFO", "SEA", "TAM", "TEN", "WAS")

team_abbreviations_2002.2015 <- c("ARI", "ATL", "BAL", "BUF", "CAR", "CHI", "CIN", "CLE", "DAL", "DEN", "DET", "GNB", "HOU", "IND", "JAX", "KAN", "MIA", "MIN", "NWE", "NOR", "NYG", "NYJ", "OAK", "PHI", "PIT", "SDG", "SFO", "SEA", "STL", "TAM", "TEN", "WAS")

`2018_def_vs_qbs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2018_def_vs_qbs.txt")

`2018_passing_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2018_passing_defense.txt")

`2018_scoring_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2018_scoring_defense.txt")

`2018_team_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2018_team_defense.txt")

`2019_def_vs_qbs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2019_def_vs_qbs.txt")

`2019_passing_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2019_passing_defense.txt")

`2019_scoring_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2019_scoring_defense.txt")

`2019_team_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2019_team_defense.txt")

`2021_def_vs_qbs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2021_def_vs_qbs.txt")

`2021_passing_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2021_passing_defense.txt")

`2021_scoring_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2021_scoring_defense.txt")

`2021_team_defense` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/Defensive Files/2021_team_defense.txt")

`2021_baker_mayfield_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2020_Season_Datasets/baker_mayfield/2021_baker_mayfield_gamelogs.txt")

`2018_baker_mayfield_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/2020_starter_gamelogs/2018_baker_mayfield_gamelogs.txt")

# Defensive Tiers of Top Overall Defenses

# Tier 1 <- 1:5
# Tier 2 <- 6:10
# Tier 3 <- 11:15
# Tier 4 <- 16:20
# Tier 5 <- 21:26
# Tier 6 <- 27:32

# Passing Grades (according to points)

# A - 30:25
# B - 24:19
# C - 18:13
# D - 12:6
# F - 5:0

# Rushing Grades (according to points)

# A - > 5
# B - 3:4
# C - 1:2 
# D - 1 (> Mean QB Rushing Yards or 1 Rushing TD)
# F - 0

useless_points <- function(scoring_def, team_abbreviations){
  x <- scoring_def
  x[is.na(x)] <- 0
  x <- x %>%
    select(
      Rk, Tm, PR.TD:OthTD, XPM, Sfty, Pts
    ) %>%
    filter(
      Rk != is.na(Rk)
    ) %>%
    mutate(
      Rk = team_abbreviations
    ) %>%
    rename(
      "ABB" = Rk
    ) %>%
    group_by(
      Tm
    ) %>%
    summarise(
      ABB = ABB,
      Tm = Tm,
      TDs = sum(PR.TD, KR.TD, FblTD, IntTD, OthTD),
      TD.Points = (TDs * 6),
      XPM = XPM,
      Safeties = Sfty,
      Safety.Points = sum(Safeties * 2),
      Total.Unnecessary.Points = sum(TD.Points, XPM, Safety.Points)
    )
}

qb.rushing.stats <- function(def_vs_QBs, team_abbreviations){
  x <- def_vs_QBs %>%
    rename(
      "Team" = X,
      "QB.Rush.Attempts" = Rushing,
      "QB.Rush.Yards" = Rushing.1,
      "QB.Rush.TDs" = Rushing.2
    ) %>%
    filter(
      Team != "Tm"
    ) %>%
    mutate(
      ABB = team_abbreviations
    ) %>% 
    select(
      ABB, Team, QB.Rush.Attempts, QB.Rush.Yards, QB.Rush.TDs
    )
}

team.defense.cleaning <- function(team_defense, pass_def, scoring_defense, def_vs_QBs, team_abbreviations){
  
  x <- pass_def %>%
    filter(Rk != is.na(Rk))
  y <- useless_points(scoring_defense, team_abbreviations)
  z <- qb.rushing.stats(def_vs_QBs, team_abbreviations)
  
  a <- team_defense %>%
    select(
      X:Tot.Yds...TO.1, Passing:Passing.4, Rushing:Rushing.3, X.7:X.9
    ) %>%
    filter(
      X != "",
      X != "Rk"
    ) %>%
    rename(
      "ABB" = X,
      "Team" = X.1,
      "Games" = X.2,
      "Points.Allowed" = X.3,
      "Total.Yards" = X.4,
      "Total.Plays" = Tot.Yds...TO,
      "Yards.Per.Play" = Tot.Yds...TO.1,
      "Completions" = Passing,
      "Pass.Attempts" = Passing.1,
      "Pass.Yards" = Passing.2,
      "Pass.TDs" = Passing.3,
      "Interceptions" = Passing.4,
      "Ovr.Rush.Attempts" = Rushing,
      "Ovr.Rush.Yards" = Rushing.1,
      "Ovr.Rush.TDs" = Rushing.2,
      "Ovr.Rush.Avg" = Rushing.3,
      "Score.per.Drive" = X.7,
      "TO.per.Drive" = X.8,
      "EXP" = X.9
    ) %>%
    mutate(
      ABB = team_abbreviations,
      QB.Rate = x$Rate,
      Adj.Yards.per.Pass.Att = x$AY.A,
      Unqual.Points = y$Total.Unnecessary.Points,
      True.Points.Allowed = (as.numeric(Points.Allowed) - y$Total.Unnecessary.Points),
      QB.Rush.Attempts = z$QB.Rush.Attempts,
      QB.Rush.Yards = z$QB.Rush.Yards,
      QB.Rush.Avg = round((as.numeric(QB.Rush.Yards)/as.numeric(QB.Rush.Attempts)), 1),
      QB.Rush.TDs = z$QB.Rush.TDs
    ) %>%
    select(
      ABB:Games, Points.Allowed, Unqual.Points, True.Points.Allowed, Total.Yards, Yards.Per.Play, Completions:Pass.Yards, Adj.Yards.per.Pass.Att, Pass.TDs:Interceptions, QB.Rate, Ovr.Rush.Attempts:Ovr.Rush.TDs, QB.Rush.Attempts:QB.Rush.TDs, Score.per.Drive:EXP
    )
  
  return(type.convert(a))

}

clean_def.2020 <- team.defense.cleaning(`2020_team_defense`, `2020_passing_defense`, `2020_scoring_defense`, `2020_def_vs_QBs`, team_abbreviations_2020.2021)

clean_def.2021 <- team.defense.cleaning(`2021_team_defense`, `2021_passing_defense`, `2021_scoring_defense`, `2021_def_vs_qbs`, team_abbreviations_2020.2021)

# had to determine which pass yard average to include
# used stepwise AIC variable selection to measure the different pass yard averages as independent variables against True Points Allowed as the dependent variable

pass.yards.AVG.model <- lm(clean_def$True.Points.Allowed ~ pass$AY.A + pass$Y.A + pass$NY.A + pass$ANY.A)
avg.aic <- stepAIC(pass.yards.AVG.model, direction = "backward", trace = FALSE)

# selected Adjusted Yards per Attempt as it had lowest p-value
# updated gamelog cleaner

def.quant.tables <- function(clean_defense){
  
  a <- clean_defense %>%
    mutate(
      Top_Def_Rank = min_rank(clean_defense$True.Points.Allowed)
    ) %>%
    select(
      Top_Def_Rank, ABB:EXP
    ) %>%
    arrange(
      Top_Def_Rank
    )
  
  top5 <- a %>%
    filter(
      Top_Def_Rank %in% seq(1,5)
    )
  
  top6.10 <- a %>%
    filter(
      Top_Def_Rank %in% seq(6,10)
    )
  
  top11.15 <- a %>%
    filter(
      Top_Def_Rank %in% seq(11,15)
    )
  
  top16.20 <- a %>%
    filter(
      Top_Def_Rank %in% seq(16,20)
    )
  
  top21.26 <- a %>%
    filter(
      Top_Def_Rank %in% seq(21,26)
    )
  
  top27... <- a %>%
    filter(
      Top_Def_Rank %in% seq(27,32)
    )
  
  tops.list <- list(top5, top6.10, top11.15, top16.20, top21.26, top27...)
  return(tops.list)
}  

qs.tier.function <- function(top_x){
  
  qsp.matrix <- matrix(nrow = 6, ncol = 5)
  colnames(qsp.matrix) <- c('Min', 'Q1', 'Med', 'Q3', 'Max')
  row.names(qsp.matrix) <- c('Pass_Yards ', "Adj.Yds.per.Pass.Att", "Completion_Pct.", "TD_Pct.", "INT_Pct.", 'QB_Rate')
  
  
  qsp.matrix[1,] <- quantile((top_x$Pass.Yards)/16)
  qsp.matrix[2,] <- quantile((top_x$Adj.Yards.per.Pass.Att))
  qsp.matrix[3,] <- quantile((top_x$Completions/top_x$Pass.Attempts)*100)
  qsp.matrix[4,] <- quantile((top_x$Pass.TDs/top_x$Pass.Attempts)*100)
  qsp.matrix[5,] <- quantile((top_x$Interceptions/top_x$Pass.Attempts)*100)
  qsp.matrix[6,] <- quantile(top_x$QB.Rate)
  
  qsp.matrix <- round(qsp.matrix, digits = 1)
  
  tier1.matrix <- qs.tier.function(top5)
  tier2.matrix <- qs.tier.function(top6.10)
  tier3.matrix <- qs.tier.function(top11.15)
  tier4.matrix <- qs.tier.function(top16.20)
  tier5.matrix <- qs.tier.function(top21.26)
  tier6.matrix <- qs.tier.function(top27...)
  
  # quant.tables <- rbind(tier1.matrix, tier2.matrix, tier3.matrix, 
  #                      tier4.matrix, tier5.matrix, tier6.matrix,
  #                      deparse.level = 1)
  # return(quant.tables)
  
}

show.qs.tiers.function <- function(top_x){
  
  qsp.matrix <- matrix(nrow = 6, ncol = 5)
  colnames(qsp.matrix) <- c('Min', 'Q1', 'Med', 'Q3', 'Max')
  row.names(qsp.matrix) <- c('Pass_Yards ', "Adj.Yds.per.Pass.Att", "Completion_Pct.", "TD_Pct.", "INT_Pct.", 'QB_Rate')
  
  
  qsp.matrix[1,] <- quantile((top_x$Pass.Yards)/16)
  qsp.matrix[2,] <- quantile((top_x$Adj.Yards.per.Pass.Att))
  qsp.matrix[3,] <- quantile((top_x$Completions/top_x$Pass.Attempts)*100)
  qsp.matrix[4,] <- quantile((top_x$Pass.TDs/top_x$Pass.Attempts)*100)
  qsp.matrix[5,] <- quantile((top_x$Interceptions/top_x$Pass.Attempts)*100)
  qsp.matrix[6,] <- quantile(top_x$QB.Rate)
  
  qsp.matrix <- round(qsp.matrix, digits = 1)
  
  return(qsp.matrix)
}

# need to group opponents by their tiers - nested for loop??? separate matrix with abbreviations in tiers??? 

gamelog_cleaner_before_2021 <- function(gamelog, clean_defense){
  
  tops.list <- def.quant.tables(clean_defense)
  
  t.grades <- list(30:25, 24:19, 18:13, 12:6, 5:0)
  r.grades <- list(5:20, 3:4, 2, 1)
  
  a <- gamelog %>%
    separate(
      Pct, into = "Pct.", remove = T
    ) %>%
    mutate(
      Pct. = as.numeric(Pct.)
    ) %>%
    filter(
      GS == "*",
      Pct. > 50
    ) %>%
    select(
      Date, G., Opp, Result, Cmp:Rate, AY.A, Att.1, Yds.2, Y.A.1, TD.1
    ) %>%
    group_by(
      Date, G., Opp, Result, Cmp, Att, Cmp., Yds, AY.A, TD, Int, Rate, Att.1, Yds.2, Y.A.1, TD.1
    ) %>%
    summarise(
    Opp.Tier = 
    if (Opp %in% tops.list[[1]]$ABB){
      Opp.Tier = 1
    } else if (Opp %in% tops.list[[2]]$ABB){
      Opp.Tier = 2
    } else if (Opp %in% tops.list[[3]]$ABB){
      Opp.Tier = 3
    } else if (Opp %in% tops.list[[4]]$ABB){
      Opp.Tier = 4
    } else if (Opp %in% tops.list[[5]]$ABB){
      Opp.Tier = 5
    } else if (Opp %in% tops.list[[6]]$ABB){
      Opp.Tier = 6
    }) %>%
    select(
      Date:Opp, Opp.Tier, Result:TD.1
    ) %>%
    ungroup()
  
  a <- type.convert(a)
  
  a <- a %>%  
    mutate(
      TD.Pct = round((TD/Att)*100, digits = 1),
      Cmp.Pct = round(Cmp., digits = 1),
      Int.Pct = round((Int/Att)*100, digits = 1),
      Adj.Yds.per.Att = round(AY.A, digits = 1),
      Rush.Attempts = Att.1,
      Rush.Yards = Yds.2,
      Rush.Yards.Avg = round(Y.A.1, digits = 1),
      Rush.TDs = TD.1,
      QS.Div = ''
    ) %>%
    group_by(Date, G., Opp, Opp.Tier, Result, Cmp, Att, Cmp.Pct, Yds, Adj.Yds.per.Att, TD, TD.Pct, Int, Int.Pct, Rate, Rush.Attempts, Rush.Yards, Rush.Yards.Avg, Rush.TDs, QS.Div) %>%
    summarise(
      
      PY.P = 
        (if (Opp.Tier == 1){
          PY.P = sum(Yds > (quantile(tops.list[[1]]$Pass.Yards/16)))
        } else if (Opp.Tier == 2){
          PY.P = sum(Yds > (quantile(tops.list[[2]]$Pass.Yards/16)))
        } else if (Opp.Tier == 3){
          PY.P = sum(Yds > (quantile(tops.list[[3]]$Pass.Yards/16)))
        } else if (Opp.Tier == 4){
          PY.P = sum(Yds > (quantile(tops.list[[4]]$Pass.Yards/16)))
        } else if (Opp.Tier == 5){
          PY.P = sum(Yds > (quantile(tops.list[[5]]$Pass.Yards/16)))
        } else if (Opp.Tier == 6){
          PY.P = sum(Yds > (quantile(tops.list[[6]]$Pass.Yards/16)))
        }),
      
      AY_A.P = 
        (if (Opp.Tier == 1){
        AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[1]]$Adj.Yards.per.Pass.Att)))
      } else if (Opp.Tier == 2){
        AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[2]]$Adj.Yards.per.Pass.Att)))
      } else if (Opp.Tier == 3){
        AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[3]]$Adj.Yards.per.Pass.Att)))
      } else if (Opp.Tier == 4){
        AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[4]]$Adj.Yards.per.Pass.Att)))
      } else if (Opp.Tier == 5){
        AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[5]]$Adj.Yards.per.Pass.Att)))
      } else if (Opp.Tier == 6){
        AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[6]]$Adj.Yards.per.Pass.Att)))
      }),
      
      Comp_Pct.P = 
        (if (Opp.Tier == 1){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[1]]$Completions/tops.list[[1]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 2){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[2]]$Completions/tops.list[[2]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 3){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[3]]$Completions/tops.list[[3]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 4){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[4]]$Completions/tops.list[[4]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 5){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[5]]$Completions/tops.list[[5]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 6){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[6]]$Completions/tops.list[[6]]$Pass.Attempts)*100)))
        }),
      
      TD_Pct.P =
        (if (Opp.Tier == 1){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[1]]$Pass.TDs/tops.list[[1]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 2){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[2]]$Pass.TDs/tops.list[[2]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 3){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[3]]$Pass.TDs/tops.list[[3]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 4){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[4]]$Pass.TDs/tops.list[[4]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 5){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[5]]$Pass.TDs/tops.list[[5]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 6){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[6]]$Pass.TDs/tops.list[[6]]$Pass.Attempts)*100)))
        }),
      
      Int_Pct.P = 
        (if (Opp.Tier == 1){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[1]]$Interceptions/tops.list[[1]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 2){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[2]]$Interceptions/tops.list[[2]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 3){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[3]]$Interceptions/tops.list[[3]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 4){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[4]]$Interceptions/tops.list[[4]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 5){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[5]]$Interceptions/tops.list[[5]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 6){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[6]]$Interceptions/tops.list[[6]]$Pass.Attempts)*100)))
        }),
      
      QB_Rate.P = 
        (if (Opp.Tier == 1){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[1]]$QB.Rate)))
        } else if (Opp.Tier == 2){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[2]]$QB.Rate)))
        } else if (Opp.Tier == 3){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[3]]$QB.Rate)))
        } else if (Opp.Tier == 4){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[4]]$QB.Rate)))
        } else if (Opp.Tier == 5){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[5]]$QB.Rate)))
        } else if (Opp.Tier == 6){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[6]]$QB.Rate)))
        }),
  
      Rush_Yards.P = 
        (if (Rush.Yards >= (mean(clean_defense$QB.Rush.Yards)/16)*5){
        Rush_Yards.P = 5
      } else if (Rush.Yards >= (mean(clean_defense$QB.Rush.Yards)/16)*4){
        Rush_Yards.P = 4
      } else if (Rush.Yards >= (mean(clean_defense$QB.Rush.Yards)/16)*3){
        Rush_Yards.P = 3
      } else if (Rush.Yards >= (mean(clean_defense$QB.Rush.Yards)/16)*2){
        Rush_Yards.P = 2
      } else if (Rush.Yards >= (mean(clean_defense$QB.Rush.Yards)/16)){
        Rush_Yards.P = 1
      } else if (Rush.Yards < (mean(clean_defense$QB.Rush.Yards)/16)){
        Rush_Yards.P = 0
      }),
      
      Rush_Yards_Avg.P =
        (if (Rush.Attempts >= round(mean(clean_defense$QB.Rush.Attempts/16), digits = 0) & 
             Rush.Yards.Avg >= mean(clean_defense$QB.Rush.Avg)){
          Rush_Yards_Avg.P = 1
        } else {
          Rush_Yards_Avg.P = 0
        }),
      
      Rush_TDs.P = sum(Rush.TDs)
      
      
    ) %>%
    group_by_all(
    ) %>%
    summarise(
      Throw_Count = sum(PY.P, AY_A.P, Comp_Pct.P, 
                        TD_Pct.P, Int_Pct.P, 
                        QB_Rate.P),
      
      Rush_Count = sum(Rush_Yards.P + Rush_Yards_Avg.P + Rush_TDs.P),
      
      Throwing_Grades = 
        
        if (Throw_Count %in% t.grades[[1]]){
          Throwing_Grades = 'A'
        } else if (Throw_Count %in% t.grades[[2]]){
          Throwing_Grades = 'B'
        } else if (Throw_Count %in% t.grades[[3]]){
          Throwing_Grades = 'C'
        } else if (Throw_Count %in% t.grades[[4]]){
          Throwing_Grades = 'D'
        } else if (Throw_Count %in% t.grades[[5]]){
          Throwing_Grades = 'F'
        },
      
      Rushing_Grades =
      
      if (Rush_Count %in% r.grades[[1]]){
        Rushing_Grades = 'A'
      } else if (Rush_Count %in% r.grades[[2]]){
        Rushing_Grades = 'B'
      } else if (Rush_Count %in% r.grades[[3]]){
        Rushing_Grades = 'C'
      } else if (Rush_Count %in% r.grades[[4]]){
        Rushing_Grades = 'D'
      } else {
        Rushing_Grades = 'F'
      }
    ) %>%
    ungroup()
  
  a[is.na(a)] <- 0
  
  return(a)
  
  }

# extra_points.dataframe

extra_points.df <- `2021_scoring_defense` %>%
  filter(
    Rk != "NA"
  ) %>%
  mutate(
    ABB = team_abbreviations_2020.2021,
    XPM.Per = round((XPM/XPA)*100, digits = 1)
  ) %>%
  select(
    ABB, XPM, XPA, XPM.Per
  )

# team colors 2020

nfl_team_colors_2020.2021 <- teamcolors %>%
  filter(
    league == 'nfl'
  ) %>%
  select(
    name, primary:mascot, logo
  )

nfl_team_colors_2020.2021[25,1] <- "Las Vegas Raiders"
nfl_team_colors_2020.2021[25,7] <- "Las Vegas"
nfl_team_colors_2020.2021[32,1] <- "Washington Football Team"
nfl_team_colors_2020.2021[32,8] <- "Football Team"

nfl_team_colors_2020.2021 <- nfl_team_colors_2020.2021 %>%
  arrange(
    name
  ) %>%
  mutate(
    ABB = team_abbreviations_2020.2021
  ) %>%
  select(
    ABB, name:logo
  )

# combining colors and extra points

extra_points.df <- cbind(extra_points.df, nfl_team_colors_2020.2021)

extra_points.df <- extra_points.df %>%
  select(
    ABB:XPM.Per, primary:logo
  )

# better logos - *CREDIT NFLFASTR*

nflcolors <- nflfastR::teams_colors_logos

nflcolors <- nflcolors %>%
  filter(
    team_abbr != 'LA' & team_abbr != 'SD' & team_abbr != 'OAK' & team_abbr != 'STL'
  ) %>%
  arrange(
    team_name
  )

extra_points.df <- extra_points.df %>%
  mutate(
    logo = nflcolors$team_logo_wikipedia
  )

# Kicking datasets

`2015.kicking.stats` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/kicking stats/2015.kicking.stats.txt")
`2016.kicking.stats` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/kicking stats/2016.kicking.stats.txt")
`2017.kicking.stats` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/kicking stats/2017.kicking.stats.txt")
`2018.kicking.stats` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/kicking stats/2018.kicking.stats.txt")
`2019.kicking.stats` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/kicking stats/2019.kicking.stats.txt")
`2020.kicking.stats` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/kicking stats/2020.kicking.stats.txt")
`2021.kicking.stats` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/kicking stats/2021.kicking.stats.txt")

# function to clean the datasets before giving appropriate abbreviations and collecting into one

kick_cleaner <- function(k.stats){
  
  a <- k.stats %>%
    
    select(
      Tm, XP.
    ) 
}

# Cleaned 2015

kick_2015 <- kick_cleaner(`2015.kicking.stats`) %>%
  
  mutate(
    ABB = team_abbreviations_2002.2015
  )

kick_2015[23,3] <- "LVR"
kick_2015[26,3] <- "LAC"
kick_2015[29,3] <- "LAR"

kick_2015 <- kick_2015 %>%
  select(ABB, XP.) %>%
  arrange(ABB)

# Cleaned 2016

kick_2016 <- kick_cleaner(`2016.kicking.stats`) %>%
  
  mutate(
    ABB = team_abbreviations_2016
  )

kick_2016[24,3] <- "LVR"
kick_2016[27,3] <- "LAC"

kick_2016 <- kick_2016 %>%
  select(ABB, XP.) %>%
  arrange(ABB)

# Cleaned 2017-2019

kick_2017 <- kick_cleaner(`2017.kicking.stats`) %>%
  mutate(ABB = team_abbreviations_2017.2019) 

kick_2018 <- kick_cleaner(`2018.kicking.stats`) %>%
  mutate(ABB = team_abbreviations_2017.2019)

kick_2019 <- kick_cleaner(`2019.kicking.stats`) %>%
  mutate(ABB = team_abbreviations_2017.2019)

kick_2017[25,3] <- "LVR"
kick_2018[25,3] <- "LVR"
kick_2019[25,3] <- "LVR"

kick_2017 <- kick_2017 %>%
  select(ABB, XP.) %>%
  arrange(ABB)

kick_2018 <- kick_2018 %>%
  select(ABB, XP.) %>%
  arrange(ABB)

kick_2019 <- kick_2019 %>%
  select(ABB, XP.) %>%
  arrange(ABB)

# Cleaned 2020 & 2021

kick_2020 <- kick_cleaner(`2020.kicking.stats`) %>%
  mutate(ABB = team_abbreviations_2020.2021) %>%
  select(ABB, XP.) %>%
  arrange(ABB)

kick_2021 <- kick_cleaner(`2021.kicking.stats`) %>%
  mutate(ABB = team_abbreviations_2020.2021) %>%
  select(ABB, XP.) %>%
  arrange(ABB)

# Combined kicking dataset

kick_2015.2021 <- cbind(kick_2015, kick_2016, kick_2017, kick_2018, kick_2019, kick_2020, kick_2021)

colnames(kick_2015.2021) <- c("ABB", "2015", 'a', "2016", "b", "2017", "c", "2018", "d", "2019", "e", "2020", "f", "2021")

kick_2015.2021 <- kick_2015.2021 %>%
  select(
    ABB, '2015', '2016', '2017', '2018', '2019', '2020', '2021'
    )

kick_2015.2021 <- separate(kick_2015.2021, col = '2015', into = '2015', sep = "%")
kick_2015.2021 <- separate(kick_2015.2021, col = '2016', into = '2016', sep = "%")
kick_2015.2021 <- separate(kick_2015.2021, col = '2017', into = '2017', sep = "%")
kick_2015.2021 <- separate(kick_2015.2021, col = '2018', into = '2018', sep = "%")
kick_2015.2021 <- separate(kick_2015.2021, col = '2019', into = '2019', sep = "%")
kick_2015.2021 <- separate(kick_2015.2021, col = '2020', into = '2020', sep = "%")
kick_2015.2021 <- separate(kick_2015.2021, col = '2021', into = '2021', sep = "%")

kick_2015.2021$`2015` <- as.numeric(kick_2015.2021$`2015`)
kick_2015.2021$`2016` <- as.numeric(kick_2015.2021$`2016`)
kick_2015.2021$`2017` <- as.numeric(kick_2015.2021$`2017`)
kick_2015.2021$`2018` <- as.numeric(kick_2015.2021$`2018`)
kick_2015.2021$`2019` <- as.numeric(kick_2015.2021$`2019`)
kick_2015.2021$`2020` <- as.numeric(kick_2015.2021$`2020`)
kick_2015.2021$`2021` <- as.numeric(kick_2015.2021$`2021`)

kick_2015.2021 <- kick_2015.2021 %>%
  group_by_all() %>%
  summarise(
    'Average' = (round(sum(`2015`, `2016`, `2017`, `2018`, `2019`, `2020`, `2021`)/7, digits = 1))
  ) %>%
  ungroup() %>%
  mutate(
    logo = nflcolors$team_logo_wikipedia
  )

# Total Extra Point Graph

ggthemr('grass')

w <- ggplot(data = kick_2015.2021, mapping = aes(x = ABB, y = Average))

w +
  labs(
    title = "Extra Point %",
    subtitle = "2015-2021 NFL Regular Seasons",
    caption = "Data: Pro Football Reference"
  ) +
  geom_image(aes(image = logo), size = 0.1) +
  expand_limits(x = c(-1, 34)) +
  scale_y_continuous(limits = c(85,100), breaks = c(85, 90, 95, 100)) +
  theme(
    axis.title = element_blank(),
    axis.text.x = element_blank(),
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 10, face = "italic"),
    plot.caption = element_text(hjust = 1, size = 10, face = "italic")
  )

# extra point graph

d <- ggplot(data = extra_points.df, mapping = aes(y = (XPM/XPA), x = ABB))

theme_new <- function(base_size = 11,
                      base_family = "",
                      base_line_size = base_size / 170,
                      base_rect_size = base_size / 170){
  theme_minimal(base_size = base_size, 
                base_family = base_family,
                base_line_size = base_line_size) %+replace%
    theme(
      plot.title = element_text(
        color = rgb(25, 43, 65, maxColorValue = 255), 
        face = "bold",
        hjust = 0),
      axis.title = element_text(
        color = rgb(105, 105, 105, maxColorValue = 255),
        size = rel(1)),
      axis.text = element_text(
        color = rgb(105, 105, 105, maxColorValue = 255),
        size = rel(0.75)),
      panel.grid.major = element_line(
        rgb(105, 105, 105, maxColorValue = 255),
        linetype = "dotted"),   
      panel.grid.minor = element_line(
        rgb(105, 105, 105, maxColorValue = 255),
        linetype = "dotted", 
        size = rel(4)),   
      
      axis.title.x = element_blank(),
      axis.text.x = element_blank(),
      axis.ticks.x = element_blank(),
      
      axis.title.y = element_blank(),
      
      complete = TRUE
    )
}

d +
  labs(
    title = "Extra Point %",
    subtitle = "2021-2022 NFL Regular Season",
    caption = "Data: Pro Football Reference"
  ) +
  geom_image(aes(image = logo), size = 0.1) +
  expand_limits(x = c(-1, 34)) +
  scale_y_continuous(limits = c(0.8,1), breaks = c(0.8, 0.9, 1), labels = percent) +
  theme(
    axis.title = element_blank(),
    axis.text.x = element_blank(),
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 10, face = "italic"),
    plot.caption = element_text(hjust = 1, size = 10, face = "italic")
  ) 

ggthemr_reset()

# defensive ranking comparisons

rank_compare <- clean_def.2021 %>%
  mutate(
    Unaltered_Rank = min_rank(Points.Allowed),
    True.Points_Rank = min_rank(True.Points.Allowed)
  ) %>%
  select(
    Unaltered_Rank, True.Points_Rank, ABB:EXP
  )

# rank coordinates dataset

rank_coord <- rank_compare %>%
  select(
    ABB, Unaltered_Rank, True.Points_Rank
  ) %>%
  arrange(
    Unaltered_Rank
  )

# use compare.list() to find instances where ranks are the same among teams (TRUE = same, FALSE = different)

sum(compare.list(rank_coord$Unaltered_Rank, rank_coord$True.Points_Rank))

# sum = 12, so 20 teams have different rankings between original and true points allowed

# we can use the rank_compare dataframe to make the defensive ranking changes graph to visualize the differences

Original <- rank_compare$Unaltered_Rank
True.Pts <- rank_compare$True.Points_Rank
Teams <- factor(rank_compare$ABB)

df1 <- data.frame(Original, True.Pts, Teams)
df2 <- tidyr::pivot_longer(df1, cols=c('Original', 'True.Pts'), names_to= "System", 
                           values_to="Ranks")

ggthemr('lilac')

Original <- rank_compare$Unaltered_Rank
True.Pts <- rank_compare$True.Points_Rank
Teams <- factor(rank_compare$ABB)

df1 <- data.frame(Original, True.Pts, Teams)
df2 <- tidyr::pivot_longer(df1, cols=c('Original', 'True Points'), names_to= "System", 
                           values_to="Ranks")

ggthemr('earth')

ggplot(df2, aes(x=Teams, y=Ranks, fill=System)) +
  geom_bar(stat='identity', position='dodge', width = 0.62) +
  coord_flip() +
  guides(fill = guide_legend(reverse = TRUE)) +
  scale_x_discrete(limits = rev(levels(df2$Teams))) +
  scale_y_continuous(breaks = seq(0,32,2)) +
  labs(
    title = "Ranking Changes between Scoring Systems",
    subtitle = "2021-2022 Regular Season",
    caption = "Data: Pro Football Reference"
  ) +
  scale_fill_discrete(
    labels = c("Original", "True Points")
  ) +
  theme(
    axis.text.y = element_text(size = 9, face = "italic", color = "black"),
    axis.text.x = element_text(size = 8),
    axis.title.x = element_text(size = 12, face = "italic"), 
    axis.title.y = element_blank(),
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 10, face = "italic"),
    plot.caption = element_text(hjust = 1, size = 10, face = "italic"),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.82),
    legend.background = element_rect(fill = "transparent", linetype = 0),
    legend.text = element_text(size = 12, face = "bold", color = "white"),
    legend.key = element_rect(linetype = 0)
  )

ggthemr_reset()

# let's take a look at some of the defensive tiers via charts
# first, use def.quant.tables function to separate the clean_defense a list with tiers as elements

tiers <- def.quant.tables(clean_def.2021)

# now, we can just use the show.qs.tiers.function by selecting individual elements to display as charts with view()
# here are Tiers 1-6

tier1 <- show.qs.tiers.function(tiers[[1]])
tier2 <- show.qs.tiers.function(tiers[[2]])
tier3 <- show.qs.tiers.function(tiers[[3]])
tier4 <- show.qs.tiers.function(tiers[[4]])
tier5 <- show.qs.tiers.function(tiers[[5]])
tier6 <- show.qs.tiers.function(tiers[[6]])

view(tier1)
view(tier2)
view(tier3)
view(tier4)
view(tier5)
view(tier6)


# Let's visualize why I separated passing and throwing stats into separate grades
# QB Rushing Yards had no correlation with true points allowed in 2021-2022; so, I don't want to discount the efforts of scrambling QBs

ggthemr('grass')

ggplot(data = clean_def.2021, mapping = aes(QB.Rush.Yards, True.Points.Allowed)) +
  geom_smooth(method = lm) +
  geom_point(shape = 4, size = 5, color = "white", fill = "white", stroke = 2) +
  labs(x = "Rushing Yards (QB)", y = "True Points Allowed",
       title = "Rushing Yards to True Points Correlation",
       subtitle = "2021-2022 Regular Season",
       caption = "Data: Pro Football Reference") +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"), 
    plot.subtitle = element_text(hjust = 0.5, size = 12, face = "italic"),
    plot.caption = element_text(hjust = 1, size = 10, face = "italic"),
    axis.title = element_text(size = 10),
    axis.text = element_text(size = 8),
    plot.background = element_rect(fill = "bisque",
                                   color = "black",
                                   size = 0.5)
  )

ggthemr_reset()

# Let's take a look at a balanced QB, Josh Allen of the Buffalo Bills

`2021_josh_allen_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2021_josh_allen_gamelogs.txt")

# There's a mistake with the input, so we have to use the gamelog cleaner filter before 2021

ja.gamelogs.2021 <- gamelog_cleaner_before_2021(`2021_josh_allen_gamelogs`, clean_def.2021)

# We should condense the QS numbers so we only have the totals and rename headers to fit better with our snapshot

ja.gamelogs.2021.snapshot <- ja.gamelogs.2021 %>%
  select(
    G.:Opp.Tier,Cmp:Rush.TDs, Throwing_Grades, Rushing_Grades
  ) %>%
  rename(
    'Tier' = Opp.Tier,
    'Cmp%' = Cmp.Pct,
    'AY.A' = Adj.Yds.per.Att,
    'TD%' = TD.Pct,
    'Int%' = Int.Pct,
    'R.Atts' = Rush.Attempts,
    'R.Yds' = Rush.Yards,
    'R.Avg' = Rush.Yards.Avg,
    'R.TDs' = Rush.TDs,
    'Throwing' = Throwing_Grades,
    'Rushing' = Rushing_Grades
  )

ja.gamelogs.2021.snapshot <- season_condenser(ja.gamelogs.2021)

ja.2021.opportunities <- season_opportunities(ja.gamelogs.2021)

# Let's look at presumptive MVP Aaron Rodgers

`2021_aaron_rodgers_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2021_aaron_rodgers_gamelogs.txt")

# Clean and condense for snapshot

ar.gamelogs.2021 <- gamelog_cleaner_before_2021(`2021_aaron_rodgers_gamelogs`, clean_def.2021)

ar.gamelogs.2021.snapshot <- ar.gamelogs.2021 %>%
  select(
    G.:Opp.Tier,Cmp:Rush.TDs, Throwing_Grades, Rushing_Grades
  ) %>%
  rename(
    'Tier' = Opp.Tier,
    'Cmp%' = Cmp.Pct,
    'AY.A' = Adj.Yds.per.Att,
    'TD%' = TD.Pct,
    'Int%' = Int.Pct,
    'R.Atts' = Rush.Attempts,
    'R.Yds' = Rush.Yards,
    'R.Avg' = Rush.Yards.Avg,
    'R.TDs' = Rush.TDs,
    'Throwing' = Throwing_Grades,
    'Rushing' = Rushing_Grades
  )

ar.gamelogs.2021.snapshot <- season_condenser(ar.gamelogs.2021)

ar.2021.opportunities <- season_opportunities(ar.gamelogs.2021)

# Let's take a look at a rookie starter - Trevor Lawrence

`2021_trevor_lawrence_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2021_trevor_lawrence_gamelogs.txt")

# Clean and condense

tl.gamelogs.2021 <- gamelog_cleaner_before_2021(`2021_trevor_lawrence_gamelogs`, clean_def.2021)

tl.gamelogs.2021.snapshot <- tl.gamelogs.2021 %>%
  select(
    G.:Opp.Tier,Cmp:Rush.TDs, Throwing_Grades, Rushing_Grades
  ) %>%
  rename(
    'Tier' = Opp.Tier,
    'Cmp%' = Cmp.Pct,
    'AY.A' = Adj.Yds.per.Att,
    'TD%' = TD.Pct,
    'Int%' = Int.Pct,
    'R.Atts' = Rush.Attempts,
    'R.Yds' = Rush.Yards,
    'R.Avg' = Rush.Yards.Avg,
    'R.TDs' = Rush.TDs,
    'Throwing' = Throwing_Grades,
    'Rushing' = Rushing_Grades
  )

tl.gamelogs.2021.snapshot <- season_condenser(tl.gamelogs.2021)

tl.2021.opportunities <- season_opportunities(tl.gamelogs.2021)

# Let's display the gamelogs alongside the QS grades
# PFR changed the formats for 2021 gamelogs, so some minor tweaks have to be made for newer gamelogs to fit the gamelog cleaner function

gamelog_cleaner_2021 <- function(gamelog_2021, clean_defense_2021){
  
  tops.list <- def.quant.tables(clean_defense_2021)
  
  t.grades <- list(30:25, 24:19, 18:13, 12:6, 5:0)
  r.grades <- list(5:20, 3:4, 2, 1)
  
  a <- gamelog_2021 %>%
    separate(
      Pct, into = "Pct.", remove = T
    ) %>%
    mutate(
      Pct. = as.numeric(Pct.)
    ) %>%
    filter(
      GS == "" & Opp != "",
      Pct. > 50
    ) %>%
    select(
      Date, G., Opp, Result, Cmp:Rate, AYA, Att.1, Yds.2, YA.1, TD.1
    ) %>%
    group_by(
      Date, G., Opp, Result, Cmp, Att, Cmp., Yds, AYA, TD, Int, Rate, Att.1, Yds.2, YA.1, TD.1
    ) %>%
    summarise(
      Opp.Tier = 
        if (Opp %in% tops.list[[1]]$ABB){
          Opp.Tier = 1
        } else if (Opp %in% tops.list[[2]]$ABB){
          Opp.Tier = 2
        } else if (Opp %in% tops.list[[3]]$ABB){
          Opp.Tier = 3
        } else if (Opp %in% tops.list[[4]]$ABB){
          Opp.Tier = 4
        } else if (Opp %in% tops.list[[5]]$ABB){
          Opp.Tier = 5
        } else if (Opp %in% tops.list[[6]]$ABB){
          Opp.Tier = 6
        }) %>%
    select(
      Date:Opp, Opp.Tier, Result:TD.1
    ) %>%
    ungroup()
  
  a <- type.convert(a)
  
  a <- a %>%  
    mutate(
      TD.Pct = round((TD/Att)*100, digits = 1),
      Cmp.Pct = round(Cmp., digits = 1),
      Int.Pct = round((Int/Att)*100, digits = 1),
      Adj.Yds.per.Att = round(AYA, digits = 1),
      Rush.Attempts = Att.1,
      Rush.Yards = Yds.2,
      Rush.Yards.Avg = round(YA.1, digits = 1),
      Rush.TDs = TD.1,
      QS.Div = ''
    ) %>%
    group_by(Date, G., Opp, Opp.Tier, Result, Cmp, Att, Cmp.Pct, Yds, Adj.Yds.per.Att, TD, TD.Pct, Int, Int.Pct, Rate, Rush.Attempts, Rush.Yards, Rush.Yards.Avg, Rush.TDs, QS.Div) %>%
    summarise(
      
      PY.P = 
        (if (Opp.Tier == 1){
          PY.P = sum(Yds > (quantile(tops.list[[1]]$Pass.Yards/16)))
        } else if (Opp.Tier == 2){
          PY.P = sum(Yds > (quantile(tops.list[[2]]$Pass.Yards/16)))
        } else if (Opp.Tier == 3){
          PY.P = sum(Yds > (quantile(tops.list[[3]]$Pass.Yards/16)))
        } else if (Opp.Tier == 4){
          PY.P = sum(Yds > (quantile(tops.list[[4]]$Pass.Yards/16)))
        } else if (Opp.Tier == 5){
          PY.P = sum(Yds > (quantile(tops.list[[5]]$Pass.Yards/16)))
        } else if (Opp.Tier == 6){
          PY.P = sum(Yds > (quantile(tops.list[[6]]$Pass.Yards/16)))
        }),
      
      AY_A.P = 
        (if (Opp.Tier == 1){
          AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[1]]$Adj.Yards.per.Pass.Att)))
        } else if (Opp.Tier == 2){
          AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[2]]$Adj.Yards.per.Pass.Att)))
        } else if (Opp.Tier == 3){
          AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[3]]$Adj.Yards.per.Pass.Att)))
        } else if (Opp.Tier == 4){
          AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[4]]$Adj.Yards.per.Pass.Att)))
        } else if (Opp.Tier == 5){
          AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[5]]$Adj.Yards.per.Pass.Att)))
        } else if (Opp.Tier == 6){
          AY_A.P = sum(Adj.Yds.per.Att > (quantile(tops.list[[6]]$Adj.Yards.per.Pass.Att)))
        }),
      
      Comp_Pct.P = 
        (if (Opp.Tier == 1){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[1]]$Completions/tops.list[[1]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 2){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[2]]$Completions/tops.list[[2]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 3){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[3]]$Completions/tops.list[[3]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 4){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[4]]$Completions/tops.list[[4]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 5){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[5]]$Completions/tops.list[[5]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 6){
          Comp_Pct.P = sum(Cmp.Pct > (quantile((tops.list[[6]]$Completions/tops.list[[6]]$Pass.Attempts)*100)))
        }),
      
      TD_Pct.P =
        (if (Opp.Tier == 1){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[1]]$Pass.TDs/tops.list[[1]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 2){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[2]]$Pass.TDs/tops.list[[2]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 3){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[3]]$Pass.TDs/tops.list[[3]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 4){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[4]]$Pass.TDs/tops.list[[4]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 5){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[5]]$Pass.TDs/tops.list[[5]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 6){
          TD_Pct.P = sum(TD.Pct > (quantile((tops.list[[6]]$Pass.TDs/tops.list[[6]]$Pass.Attempts)*100)))
        }),
      
      Int_Pct.P = 
        (if (Opp.Tier == 1){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[1]]$Interceptions/tops.list[[1]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 2){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[2]]$Interceptions/tops.list[[2]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 3){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[3]]$Interceptions/tops.list[[3]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 4){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[4]]$Interceptions/tops.list[[4]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 5){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[5]]$Interceptions/tops.list[[5]]$Pass.Attempts)*100)))
        } else if (Opp.Tier == 6){
          Int_Pct.P = sum(Int.Pct < (quantile((tops.list[[6]]$Interceptions/tops.list[[6]]$Pass.Attempts)*100)))
        }),
      
      QB_Rate.P = 
        (if (Opp.Tier == 1){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[1]]$QB.Rate)))
        } else if (Opp.Tier == 2){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[2]]$QB.Rate)))
        } else if (Opp.Tier == 3){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[3]]$QB.Rate)))
        } else if (Opp.Tier == 4){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[4]]$QB.Rate)))
        } else if (Opp.Tier == 5){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[5]]$QB.Rate)))
        } else if (Opp.Tier == 6){
          QB_Rate.P = sum(Rate > (quantile(tops.list[[6]]$QB.Rate)))
        }),
      
      Rush_Yards.P = 
        (if (Rush.Yards >= (mean(clean_defense_2021$QB.Rush.Yards)/16)*5){
          Rush_Yards.P = 5
        } else if (Rush.Yards >= (mean(clean_defense_2021$QB.Rush.Yards)/16)*4){
          Rush_Yards.P = 4
        } else if (Rush.Yards >= (mean(clean_defense_2021$QB.Rush.Yards)/16)*3){
          Rush_Yards.P = 3
        } else if (Rush.Yards >= (mean(clean_defense_2021$QB.Rush.Yards)/16)*2){
          Rush_Yards.P = 2
        } else if (Rush.Yards >= (mean(clean_defense_2021$QB.Rush.Yards)/16)){
          Rush_Yards.P = 1
        } else if (Rush.Yards < (mean(clean_defense_2021$QB.Rush.Yards)/16)){
          Rush_Yards.P = 0
        }),
      
      Rush_Yards_Avg.P =
        (if (Rush.Attempts >= round(mean(clean_defense_2021$QB.Rush.Attempts/16), digits = 0) & 
             Rush.Yards.Avg >= mean(clean_defense_2021$QB.Rush.Avg)){
          Rush_Yards_Avg.P = 1
        } else {
          Rush_Yards_Avg.P = 0
        }),
      
      Rush_TDs.P = sum(Rush.TDs)
      
      
    ) %>%
    group_by_all(
    ) %>%
    summarise(
      Throw_Count = sum(PY.P, AY_A.P, Comp_Pct.P, 
                        TD_Pct.P, Int_Pct.P, 
                        QB_Rate.P),
      
      Rush_Count = sum(Rush_Yards.P + Rush_Yards_Avg.P + Rush_TDs.P),
      
      Throwing_Grades = 
        
        if (Throw_Count %in% t.grades[[1]]){
          Throwing_Grades = 'A'
        } else if (Throw_Count %in% t.grades[[2]]){
          Throwing_Grades = 'B'
        } else if (Throw_Count %in% t.grades[[3]]){
          Throwing_Grades = 'C'
        } else if (Throw_Count %in% t.grades[[4]]){
          Throwing_Grades = 'D'
        } else if (Throw_Count %in% t.grades[[5]]){
          Throwing_Grades = 'F'
        },
      
      Rushing_Grades =
        
        if (Rush_Count %in% r.grades[[1]]){
          Rushing_Grades = 'A'
        } else if (Rush_Count %in% r.grades[[2]]){
          Rushing_Grades = 'B'
        } else if (Rush_Count %in% r.grades[[3]]){
          Rushing_Grades = 'C'
        } else if (Rush_Count %in% r.grades[[4]]){
          Rushing_Grades = 'D'
        } else {
          Rushing_Grades = 'F'
        }
    ) %>%
    ungroup()
  
  a[is.na(a)] <- 0
  
  return(a)
  
}

baker_mayfield_2021_QS_logs <- gamelog_cleaner_2021(`2021_baker_mayfield_gamelogs`, clean_def.2021)

# Now let's make a combined chart to show overall opportunities and QS results

clean_def.2018 <- team.defense.cleaning(`2018_team_defense`, `2018_passing_defense`, `2018_scoring_defense`, `2018_def_vs_qbs`, team_abbreviations_2017.2019)

clean_def.2019 <- team.defense.cleaning(`2019_team_defense`, `2019_passing_defense`, `2019_scoring_defense`, `2019_def_vs_qbs`, team_abbreviations_2017.2019)

`2018_baker_mayfield_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/2020_starter_gamelogs/2018_baker_mayfield_gamelogs.txt")

`2019_baker_mayfield_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/2020_starter_gamelogs/2019_baker_mayfield_gamelogs.txt")

`2020_baker_mayfield_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/2020_starter_gamelogs/2020_baker_mayfield_gamelogs.txt")

`2021_baker_mayfield_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2020_Season_Datasets/baker_mayfield/2021_baker_mayfield_gamelogs.txt")

baker_mayfield_2018_QS_logs <- gamelog_cleaner_before_2021(`2018_baker_mayfield_gamelogs`, clean_def.2018)
baker_mayfield_2019_QS_logs <- gamelog_cleaner_before_2021(`2019_baker_mayfield_gamelogs`, clean_def.2019)
baker_mayfield_2020_QS_logs <- gamelog_cleaner_before_2021(`2020_baker_mayfield_gamelogs`, clean_def.2020)

# use rbind() to combine the tibbles

baker_mayfield_career_QS_logs <- rbind(baker_mayfield_2018_QS_logs, baker_mayfield_2019_QS_logs, baker_mayfield_2020_QS_logs, baker_mayfield_2021_QS_logs)

# Opportunities Functions

career_opportunities <- function(career_bound_gamelogs){
  
  matrix <- matrix(data = NA, nrow = 7, ncol = 6)
  rownames(matrix) <- c("Tier 1", "Tier 2", "Tier 3", "Tier 4", "Tier 5", "Tier 6", "Total")
  colnames(matrix) <- c("A", "B", "C", "D", "F", "Opportunities")
  
  a <-  career_bound_gamelogs %>%
    select(
      Opp.Tier, Throwing_Grades
    ) %>%
    group_by(Opp.Tier, Throwing_Grades) %>%
    count(
      Throwing_Grades
    ) %>%
    pivot_wider(
      names_from = Throwing_Grades, values_from = n
    ) %>%
    select(
      Opp.Tier, sort(names(.))
    )
  
  b <- left_join(x = a, y = matrix, copy = TRUE) %>%
    select(
      Opp.Tier, sort(names(.)), Opportunities
    )
  
  b[is.na(b)] <- 0
  
  b <- missing_tiers(b)
  
  b[is.na(b)] <- 0
  
  b[7,] <- 0
  
  b[7,2] <- colSums(b[,2])
  b[7,3] <- colSums(b[,3])
  b[7,4] <- colSums(b[,4])
  b[7,5] <- colSums(b[,5])
  b[7,6] <- colSums(b[,6])
  b[7,7] <- colSums(b[,7])
  
  b <- b[,2:7]
  
  b[1,6] <- rowSums(b[1,])
  b[2,6] <- rowSums(b[2,])
  b[3,6] <- rowSums(b[3,])
  b[4,6] <- rowSums(b[4,])
  b[5,6] <- rowSums(b[5,])
  b[6,6] <- rowSums(b[6,])
  b[7,6] <- rowSums(b[7,])
  
  rownames(b) <- c("Tier 1", "Tier 2", "Tier 3", "Tier 4", "Tier 5", "Tier 6", "Total")
  
  return(b)
}

season_opportunities <- function(season_gamelogs){
  
  matrix <- matrix(data = NA, nrow = 7, ncol = 6)
  rownames(matrix) <- c("Tier 1", "Tier 2", "Tier 3", "Tier 4", "Tier 5", "Tier 6", "Total")
  colnames(matrix) <- c("A", "B", "C", "D", "F", "Opportunities")
  
  a <- season_gamelogs %>%
    select(
      Opp.Tier, Throwing_Grades
    ) %>%
    group_by(Opp.Tier, Throwing_Grades) %>%
    count(
      Throwing_Grades
    ) %>%
    pivot_wider(
      names_from = Throwing_Grades, values_from = n
    ) %>%
    select(
      Opp.Tier, sort(names(.))
    )
  
  b <- left_join(x = a, y = matrix, copy = TRUE) %>%
    select(
      Opp.Tier, sort(names(.)), Opportunities
    )
  
  b[is.na(b)] <- 0
  
  b <- missing_tiers(b)
  
  b[is.na(b)] <- 0
  
  b[7,] <- 0
  
  b[7,2] <- colSums(b[,2])
  b[7,3] <- colSums(b[,3])
  b[7,4] <- colSums(b[,4])
  b[7,5] <- colSums(b[,5])
  b[7,6] <- colSums(b[,6])
  b[7,7] <- colSums(b[,7])
  
  b <- b[,2:7]
  
  b[1,6] <- rowSums(b[1,])
  b[2,6] <- rowSums(b[2,])
  b[3,6] <- rowSums(b[3,])
  b[4,6] <- rowSums(b[4,])
  b[5,6] <- rowSums(b[5,])
  b[6,6] <- rowSums(b[6,])
  b[7,6] <- rowSums(b[7,])
  
  rownames(b) <- c("Tier 1", "Tier 2", "Tier 3", "Tier 4", "Tier 5", "Tier 6", "Total")
  
  return(b)
}

# missing_tiers function to ensure that the opportunities functions work properly if a player hasn't faced all 6 tiers

missing_tiers <- function(a){
  
  yup <- matrix(data = NA, nrow = 1, ncol = ncol(a))
  
  a <-
    if (a[1,1] != 1){
      InsertRow(data = a, NewRow = yup, RowNum = 1)
    } else if (a[2,1] != 2){
      InsertRow(data = a, NewRow = yup, RowNum = 2)
    } else if (a[3,1] != 3){
      InsertRow(data = a, NewRow = yup, RowNum = 3)
    } else if (a[4,1] != 4){
      InsertRow(data = a, NewRow = yup, RowNum = 4)
    } else if (a[5,1] != 5){
      InsertRow(data = a, NewRow = yup, RowNum = 5)
    } else if (a[6,1] != 6){
      InsertRow(data = a, NewRow = yup, RowNum = 6)
    } else {
      a
    }
  
  return(a)
}

# Now let's look at Baker Mayfield's career so far
# First, I want a function to condense season gamelogs to present on medium more easily

season_condenser <- function(season_gamelog){
  
  a <- season_gamelog %>%
    
    select(
      G.:Opp.Tier,Cmp:Rush.TDs, Throwing_Grades, Rushing_Grades
    ) %>%
    rename(
      'Tier' = Opp.Tier,
      'Cmp%' = Cmp.Pct,
      'AY.A' = Adj.Yds.per.Att,
      'TD%' = TD.Pct,
      'Int%' = Int.Pct,
      'R.Atts' = Rush.Attempts,
      'R.Yds' = Rush.Yards,
      'R.Avg' = Rush.Yards.Avg,
      'R.TDs' = Rush.TDs,
      'Throwing' = Throwing_Grades,
      'Rushing' = Rushing_Grades
    )
  
  total_row <- (nrow(a)+1)
  
  a <- as.data.frame(a)
  
  a[is.na(a)] <- 0
  
  a[total_row,] <- NA
  
  a[total_row, 2] <- "Total/Avg"
  
  a[total_row, 3:17] <- 0
  
  a[total_row, 3] <- round(mean(a[1:(total_row)-1, 3]), digits = 1)
  
  a[total_row, 4] <- sum(a[1:(total_row)-1, 4])
  
  a[total_row, 5] <- sum(a[1:(total_row)-1, 5])
  
  a[total_row, 6] <- round(mean(a[1:(total_row)-1, 6]), digits = 1)
  
  a[total_row, 7] <- sum(a[1:(total_row)-1, 7])
  
  a[total_row, 8] <- round(mean(a[1:(total_row)-1, 8]), digits = 1)
  
  a[total_row, 9] <- sum(a[1:(total_row)-1, 9])
  
  a[total_row, 10] <- round(mean(a[1:(total_row)-1, 10]), digits = 1)
  
  a[total_row, 11] <- sum(a[1:(total_row)-1, 11])
  
  a[total_row, 12] <- round(mean(a[1:(total_row)-1, 12]), digits = 1)

  a[total_row, 13] <- round(mean(a[1:(total_row)-1, 13]), digits = 1)
  
  a[total_row, 14] <- sum(a[1:(total_row)-1, 14])
  
  a[total_row, 15] <- sum(a[1:(total_row)-1, 15])
  
  a[total_row, 16] <- round(mean(a[1:(total_row)-1, 16]), digits = 1)
  
  a[total_row, 17] <- sum(a[1:(total_row)-1, 17])
  
  return(a)
  
}

# Baker Mayfield 2018-2019 Season

`2018_baker_mayfield_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/2020_starter_gamelogs/2018_baker_mayfield_gamelogs.txt")

baker_mayfield_2018_QS_logs <- gamelog_cleaner_before_2021(`2018_baker_mayfield_gamelogs`, clean_def.2018)

bm_2018_gamelog_snapshot <- season_condenser(baker_mayfield_2018_QS_logs)

bm_2018_opportunities <- season_opportunities(baker_mayfield_2018_QS_logs)


# Baker Mayfield 2019-2020 Season

`2019_baker_mayfield_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/2020_starter_gamelogs/2019_baker_mayfield_gamelogs.txt")

baker_mayfield_2019_QS_logs <- gamelog_cleaner_before_2021(`2019_baker_mayfield_gamelogs`, clean_def.2019)

bm_2019_gamelog_snapshot <- season_condenser(baker_mayfield_2019_QS_logs)

bm_2019_opportunities <- season_opportunities(baker_mayfield_2019_QS_logs)

# Baker Mayfield 2020-2021 Season

`2020_baker_mayfield_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/2020_starter_gamelogs/2020_baker_mayfield_gamelogs.txt")

baker_mayfield_2020_QS_logs <- gamelog_cleaner_before_2021(`2020_baker_mayfield_gamelogs`, clean_def.2020)

bm_2020_gamelog_snapshot <- season_condenser(baker_mayfield_2020_QS_logs)

bm_2020_opportunities <- season_opportunities(baker_mayfield_2020_QS_logs)

# Baker Mayfield 2021-2022 Season

`2021_baker_mayfield_gamelogs` <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/2020_Season_Datasets/baker_mayfield/2021_baker_mayfield_gamelogs.txt")

baker_mayfield_2021_QS_logs <- gamelog_cleaner_2021(`2021_baker_mayfield_gamelogs`, clean_def.2021)

bm_2021_gamelog_snapshot <- season_condenser(baker_mayfield_2021_QS_logs)

bm_2021_opportunities <- season_opportunities(baker_mayfield_2021_QS_logs)

# Baker Mayfield Career Statistics

baker_mayfield_passing_career <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/baker_mayfield_passing_career.txt")

baker_mayfield_rushing_career <- read.csv("C:/Users/Brian/Desktop/DS Projects/football project/football_idea/data/baker_mayfield_rushing_career.txt")

bm_rush_career <- baker_mayfield_rushing_career

bm_career_stats <- baker_mayfield_passing_career %>%
  select(
    Year:Tm, G:Int., AY.A, Y.G, Rate
  ) %>% 
  mutate(
    R.Atts = bm_rush_career$Rush,
    R.Yds = bm_rush_career$Yds,
    R.TDs = bm_rush_career$TD,
    R.Avg = round((R.Yds/R.Atts), digits = 1)
  ) %>%
  rename(
    'Cmp%' = Cmp.,
    'TD%' = TD.,
    'Int%' = Int.,
    'Yds.Game' = Y.G
  ) %>%
  select(
    Year:Yds, AY.A, TD, 'TD%', Int, 'Int%', Rate, R.Atts, R.Yds, R.Avg, R.TDs
  )

bm_career_stats[5,2] <- ""

write.csv(bm_career_stats, file = "bm_career_snapshot.csv")

bm_career_opportunities <- career_opportunities(baker_mayfield_career_QS_logs)
