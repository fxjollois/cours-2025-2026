library(tidyverse)
library(DT)
tips = read_csv("https://fxjollois.github.io/cours-2024-2025/intechmer-3a-add-tests/tips.csv")
datatable(tips)

# tip suit-elle une loi normale ?
ggplot(tips, aes(tip)) +
  geom_histogram(aes(y = after_stat(density)), bins = 15, fill = "lightgray") +
  geom_density() +
  theme_minimal() +
  labs(x = "", y = "")
ggplot(tips, aes(sample = tip)) +
  stat_qq() + 
  stat_qq_line() +
  theme_minimal()
shapiro.test(tips$tip)

# sexe et pourboire ?
ggplot(tips, aes(x = tip, fill = sex)) +
  geom_boxplot()
t.test(data = tips, tip ~ sex)
wilcox.test(data = tips, tip ~ sex)

# et pourcentage du pourboire
tips2 = tips %>% mutate(pct = tip / total_bill)
ggplot(tips2, aes(x = pct, fill = sex)) +
  geom_boxplot()
t.test(data = tips2, pct ~ sex)
wilcox.test(data = tips2, pct ~ sex)

# jour semaine et qui paie ?
ggplot(tips, aes(day, fill = sex)) +
  geom_bar(position = "fill")
t = table(tips$day, tips$sex)
t
chisq.test(t)


# Nombre de personnes à table et montant total
ggplot(tips, aes(size, total_bill)) +
  geom_point()
cor.test(tips$total_bill, tips$size)

