Dead <- c(80, 89, 169)
Alive <- c(630, 2186, 2816)
Total <- c(710, 2275, 2985)

dmacm <- data.frame(rbind(Dead, Alive, Total))
names(dmacm) <- c("DM", "No DM", "Total")
tinytable::tt(dmacm, rownames = TRUE) |> 
  tinytable::style_tt(j = 2:4, align = "r") |> 
  tinytable::style_tt(j = 1, i = 0, color = "white")

Cases <- c("A1", "A0", "M")
PersonTime <- c("T1", "T0", "T")

t141 <- data.frame(rbind(Cases, PersonTime))
names(t141) <- c("Exposed", "Unexposed", "Total")
tinytable::tt(t141, rownames = TRUE) |> 
  tinytable::style_tt(j = 2:4, align = "r") |> 
  tinytable::style_tt(j = 1, i = 0, color = "white")

Cases <- c(41, 15, 56)
PersonTime <- c(28010, 19017, 47027)

t142 <- data.frame(rbind(Cases, PersonTime))
names(t142) <- c("Exposed", "Unexposed", "Total")
tinytable::tt(t142, rownames = TRUE) |> 
  tinytable::style_tt(j = 2:4, align = "r") |> 
  tinytable::style_tt(j = 1, i = 0, color = "white") |> 
  tinytable::format_tt(j= 2:4, digits = 3, num_mark_big =  " ")


Cases <- c("A1", "A0", "M1")
Noncases <- c("B1", "B0", "M0")
Total <- c("N1", "N0", "N")

t143 <- data.frame(rbind(Cases, Noncases, Total))
names(t143) <- c("Exposed", "Unexposed", "Total")
tinytable::tt(t143, rownames = TRUE) |> 
  tinytable::style_tt(j = 2:4, align = "r") |> 
  tinytable::style_tt(j = 1, i = 0, color = "white")

Diarrhea <- c(12, 7, 19)
NoDiarrhea <- c(2, 9, 11)
Total <- c(14, 16, 30)

t144 <- data.frame(rbind(Diarrhea, NoDiarrhea, Total))
names(t144) <- c("AB_low", "AB_high", "Total")
tinytable::tt(t144, rownames = TRUE) |> 
  tinytable::style_tt(j = 2:4, align = "r") |> 
  tinytable::style_tt(j = 1, i = 0, color = "white")

# hiv <- c(975, 9, 1399, 86)
# hivm <- matrix(hiv, nrow = 2)
