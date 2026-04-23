bwtr <- readRDS("C:/AP/MyR/lectures/PGIM2/MD_CM_2023/md2023stats/bwtr.Rds")
Variables <- names(bwtr)
Description <- c(
  "ID number", 
  "Parity", 
  "Number of childeren", 
  "Period of amenorrhoea", 
  "Height in meters", 
  "Pre-delivery Weight in kg", 
  "Mid arm circumference in cm", 
  "Fundal Height in cm", "Mode of delivery", 
  "Birth weight in grams", 
  "Birth weight < 2500", 
  "Height in cm", 
  "Height in dm", 
  "Education (three levels)", 
  "Mode of delivery")

data_dictionary <- cbind(Variables, Description)
