boys <- rep(as.factor(c("never", "once", "sometimes", "weekly")), times = 6)
parents <- rep(as.factor(c("P0", "P1", "P2")), each = 4, times = 2)
cough <- rep(c(1, 0), each = 12)
cb <- c(11, 6, 3, 4, 16, 13, 6, 11, 14, 9, 7, 18,
        468, 250, 87, 18, 415, 381, 141, 48, 377, 316, 152, 73)
t17 <- as.data.frame(cbind(boys, parents, cough, cb))

t17$boys <- factor(t17$boys, 
                   labels = c(
                     "never", "once", "sometimes", "weekly"))
t17$parents <- factor(t17$parents, labels = c("P0", "P1", "P2"))
t17$cough <- factor(t17$cough, labels = c("No", "Yes"))                    
t17l <- t17 |> tidyr::uncount(cb)

t17l$cough <- factor(t17l$cough, levels = c("Yes", "No"))
t17l$cough |> relevel("No", "Yes")
