#packages
  library(dplyr)
  library(tidyverse)
  library(data.table)
  library(ggplot2)
  library(RColorBrewer)
  library(cowplot)
  library(ggpubr)
  library(rstatix)


#read in the count table from STAR (or DESEq2)<-ask Giles
#note: in BBEdit I replaced the "Type" information: replaced "protein-coding" with "mito" for the first 13 genes 
#which are the mitochondrial genes

counts<-fread("~/Downloads/manila_clam-deseq2_results_2/count_data_mitoedit.csv")
head(counts)

#get the total counts for each sample
counts.total <- colSums(counts[,2:31])
head(counts.total)

#sum the counts for each sample by "Type"
counts.agg <- aggregate(counts[,2:31], by=list(counts$Type), FUN=sum)
head(counts.agg)

counts.agg_per <- t(t(counts.agg[,2:31])/counts.total)
row.names(counts.agg_per) <- counts.agg[,1]

#You can check this by doing the following

x <- counts.agg[,2]
y <- counts.total[1]
x/y

head(counts.agg_per)

#transpose the table

t.counts.agg_per<-t(counts.agg_per)
t.counts.agg_per<-as.data.frame(t.counts.agg_per)
head(t.counts.agg_per)
nrow(t.counts.agg_per)

#slice the ID column to get treatment in a separate column
#1. make sample ID a new column
t.counts.agg_per <- tibble::rownames_to_column(t.counts.agg_per, "sampleID")
#2. split into multiple columns using hyphen as delimiter
t.counts.agg_per<-t.counts.agg_per %>% separate_wider_delim(sampleID, "-", names = c("species", "Tx","ID"))
head(t.counts.agg_per)

#get a mean or median per treatment for each category
t.counts.agg_per %>% 
  group_by(Tx) %>%
  summarise(lncRNA=median(lncRNA),mito=median(mito),ncRNA=median(ncRNA),
            protein_coding=median(protein_coding),rRNA=median(rRNA),
            snoRNA=median(snoRNA),snRNA=median(snRNA),
            transcribed_pseudogene=median(transcribed_pseudogene), tRNA=median(tRNA))

t.counts.agg_per_conting<-t.counts.agg_per %>% 
  group_by(Tx) %>%
  summarise(lncRNA=mean(lncRNA),mito=mean(mito),ncRNA=mean(ncRNA),
            protein_coding=mean(protein_coding),rRNA=mean(rRNA),
            snoRNA=mean(snoRNA),snRNA=mean(snRNA),
            transcribed_pseudogene=mean(transcribed_pseudogene), tRNA=mean(tRNA))
head(t.counts.agg_per_conting)
#visualize
#do a ttest for mito, protein coding and ribosomal category - protein coding and rRNA sig.
#rRNA
head(t.counts.agg_per)
ggplot(t.counts.agg_per, aes(fill=Tx, y=rRNA, x=Tx)) + 
  geom_boxplot()
#outliers?
t.counts.agg_per %>%
  group_by(Tx) %>%
  identify_outliers(rRNA)
#normality?
t.counts.agg_per %>%
  group_by(Tx) %>%
  shapiro_test(rRNA)
#qqplot
ggqqplot(t.counts.agg_per, x = "rRNA", facet.by = "Tx")
#equal variances
t.counts.agg_per %>% levene_test(rRNA ~ Tx)
#Welch
stat.test <- t.counts.agg_per %>% 
  t_test(rRNA ~ Tx) %>%
  add_significance()
stat.test
#Students
stat.test2 <- t.counts.agg_per %>%
  t_test(rRNA ~ Tx, var.equal = TRUE) %>%
  add_significance()
stat.test2

#mito

head(t.counts.agg_per)
ggplot(t.counts.agg_per, aes(fill=Tx, y=mito, x=Tx)) + 
  geom_boxplot()
#outliers?
t.counts.agg_per %>%
  group_by(Tx) %>%
  identify_outliers(mito)
#normality?
t.counts.agg_per %>%
  group_by(Tx) %>%
  shapiro_test(mito)
#qqplot
ggqqplot(t.counts.agg_per, x = "mito", facet.by = "Tx")
#equal variances
t.counts.agg_per %>% levene_test(mito ~ Tx)
#Welch
stat.test <- t.counts.agg_per %>% 
  t_test(mito ~ Tx) %>%
  add_significance()
stat.test
#Students
stat.test2 <- t.counts.agg_per %>%
  t_test(mito ~ Tx, var.equal = TRUE) %>%
  add_significance()
stat.test2

#protein_coding

head(t.counts.agg_per)
ggplot(t.counts.agg_per, aes(fill=Tx, y=protein_coding, x=Tx)) + 
  geom_boxplot()
#outliers? -----------------------2 outliers for protein coding
t.counts.agg_per %>%
  group_by(Tx) %>%
  identify_outliers(protein_coding)
#normality?
t.counts.agg_per %>%
  group_by(Tx) %>%
  shapiro_test(protein_coding)
#qqplot
ggqqplot(t.counts.agg_per, x = "protein_coding", facet.by = "Tx")
#equal variances
t.counts.agg_per %>% levene_test(protein_coding ~ Tx)
#Welch
stat.test <- t.counts.agg_per %>% 
  t_test(protein_coding ~ Tx) %>%
  add_significance()
stat.test
#Students
stat.test2 <- t.counts.agg_per %>%
  t_test(protein_coding ~ Tx, var.equal = TRUE) %>%
  add_significance()
stat.test2
#make a stacked bar
head(t.counts.agg_per)

# do a chi-square test for the distribution - contingency table
head(t.counts.agg_per_conting)
flip <- setNames(data.frame(t(t.counts.agg_per_conting[,-1])), t.counts.agg_per_conting[,1])
head(flip)
colnames(flip)<-c("Treatment 1","Treatment 2")
head(flip)
flip <- tibble::rownames_to_column(flip, "Category")
head(flip)
tibble::rownames_to_column(flip, "Category")

head(flip)

flip_mini<-flip[c(2,4,5),]
head(flip_mini)
flip_long <- flip %>%
  pivot_longer(cols = starts_with("Treatment"), 
               names_to = "Treatment", 
               values_to = "Proportion")
head(flip_long)
ggplot(flip_long, aes(x = Treatment, y = Proportion, fill = Category)) +
  geom_bar(stat = "identity") +
  labs(x = "Category", y = "Proportion", title = "Stacked Bar Plot of Treatments") +
  theme_minimal()

#need to get Col 1 back to row names
head(flip_mini)
contingency_table <- flip_mini[, -1]
contingency_table
chi_result <- chisq.test(contingency_table)
chi_result
##I need to convert the proportions to counts.  I guess I need to find a "common median of counts" to convert props to counts
##can just multiply by 100 I guess
fwrite(counts.agg_per,"~/Downloads/manila_clam-deseq2_results_2/aggregate_counts.txt",sep = "\t")




# Example data
data <- data.frame(
  Category = c("A", "B", "C"),
  Treatment1 = c(0.3, 0.6, 0.2),
  Treatment2 = c(0.7, 0.4, 0.8)
)
head(data)
