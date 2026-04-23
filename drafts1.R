Dead <- c(80, 89, 169)
Alive <- c(630, 2186, 2816)
Total <- c(710, 2275, 2985)

dmacm <- data.frame(rbind(Dead, Alive, Total))
names(dmacm) <- c("DM", "No DM", "Total")
tinytable::tt(dmacm, rownames = TRUE) |> 
  tinytable::style_tt(j = 2:4, align = "r") |> 
  tinytable::style_tt(j = 1, i = 0, color = "white")
