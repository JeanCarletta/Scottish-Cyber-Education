read_all_table_11_csv <- 
  function (f) {
    year_char_index <- regexpr("\\(20",f) +3
    year <- as.integer(substr(f,year_char_index,year_char_index+1))
    skip_row_number <- case_when(year > 18 ~ 14, .default = 15)
    df <- read.csv(f,skip=skip_row_number) %>% 
      #filter(Country.of.HE.provider=="Scotland") %>% 
      #filter(Region.of.HE.provider=="All") %>% 
      filter(Category.Marker=="Cost centre") %>% 
      filter(grepl("Total", Category) | grepl("121", Category))
  }


temp = list.files(path="../data-sources/table-11", pattern="*.csv", full.names=TRUE)
myfiles = lapply(temp, read_all_table_11_csv) 

df <- do.call("rbind", myfiles)

UK_computing_academics_df <- df %>%
  filter(grepl("121", Category)) %>%
  filter(Country.of.HE.provider=="All") %>%
  filter(Region.of.HE.provider=="All") %>%
  filter(Contract.marker != "Academic (including atypical)") %>%
  filter(Contract.marker != "Non-academic") %>%
  filter(!grepl("All",Contract.marker)) %>%
  filter(HE.Provider == "Total")

Scottish_academics_df <- df %>%
  filter(Category == "Total academic cost centres") %>% 
  filter(Country.of.HE.provider=="Scotland") %>%
  filter(Region.of.HE.provider=="All") %>%
  filter(Contract.marker != "Academic (including atypical)") %>%
  filter(Contract.marker != "Non-academic") %>%
  filter(!grepl("All",Contract.marker)) %>%
  filter(HE.Provider == "Total")

Scottish_computing_academics_df <- df %>%
  filter(grepl("121", Category)) %>%
  filter(Country.of.HE.provider=="Scotland") %>% 
  filter(Region.of.HE.provider=="All")  %>%
  filter(Contract.marker != "Academic (including atypical)") %>%
  filter(Contract.marker != "Non-academic") %>%
  filter(!grepl("All",Contract.marker)) 

total_Scottish_computing_academics_df <- Scottish_computing_academics_df %>%
  filter(HE.Provider == "Total") 

staff_longitudinal_plot <-ggplot(total_Scottish_computing_academics_df, aes(x=Academic.Year,y=Number)) + 
  theme(plot.title=element_text(size=14,face="bold"),axis.text=element_text(size=12,angle=90), 
        axis.title=element_text(size=14),strip.text.x = element_text(size = 14)) + 
  geom_col(aes(fill=Contract.marker)) + 
  labs(x = "Academic year",y= "Number of full-time equivalent staff", fill="Contract type") + 
  scale_fill_manual(values=cbPalette)

get_staff_longitudinal_plot <- function () {
  return(staff_longitudinal_plot)
}

#ggplotly(staff_longitudinal_plot)
