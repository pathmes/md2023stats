pdfpath <- here::here("data", "clot.pdf")
library(pdftools)
library(tidyverse)

PDFInfo <- pdftools::pdf_info(pdfpath)
txt <- pdftools::pdf_text(pdfpath)

page1 <- txt[[1]]
page1split <- str_split(page1, "\\n", simplify = TRUE) %>% as.vector()


clots <- tibble(RawText=page1split) %>%
  filter(row_number()>=9) %>%
  filter(row_number()<=16) %>% 
  mutate(TextSquish=str_replace_all(RawText, "(\\.\\s)+", "\\.")) %>% 
  mutate(TextSquish=str_squish(TextSquish),
         TextSquish=str_replace_all(TextSquish, "\\(X\\)", "NA")) %>% 
  separate(TextSquish,
           into=c("subject", "Rx1", "Rx2", "Rx3", "Rx4", "Total", "Mean"),
           sep="\\s", convert=TRUE) 


c2 <- clots[1:8, 2:6]
c2$Rx1 <- as.numeric(str_replace(c2$Rx1, "\001", "."))
c2$Rx2 <- as.numeric(str_replace(c2$Rx2, "\001", "."))
c2$Rx3 <- as.numeric(str_replace(c2$Rx3, "\001", "."))
c2$Rx4 <- as.numeric(str_replace(c2$Rx4, "\001", "."))


c2l <- c2 %>% pivot_longer(
  cols = starts_with("Rx"),
  names_to = "treatment",
  names_prefix = "Rx",
  values_to = "time"
)
