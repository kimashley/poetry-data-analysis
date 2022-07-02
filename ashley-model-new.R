# make dataset for each category 
df1 <- poetry_eval_data1
df2 <- poetry_eval_data2

install.packages("brms")
library(brms)

# creative use (1)

# gpt2 sonnets, creative use 
creative_use_gpt2_sonnets_1 <-data.frame(df1$Q10, df1$Q19, df1$Q26)
creative_use_gpt2_sonnets_2 <-data.frame(df2$Q10, df2$Q19, df2$Q26)

colnames(creative_use_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(creative_use_gpt2_sonnets_2) <- c('a', 'b', 'c')

creative_use_gpt2_sonnets <- rbind(creative_use_gpt2_sonnets_1, creative_use_gpt2_sonnets_2)

creative_use_gpt2_sonnets = creative_use_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
creative_use_gpt2_sonnets <- data.frame(x=unlist(creative_use_gpt2_sonnets))
creative_use_gpt2_sonnets <- as.numeric(creative_use_gpt2_sonnets$x)

# human sonnets, creative use  
creative_use_human_sonnets_1 <-data.frame(df1$Q33, df1$Q40, df1$Q47)
creative_use_human_sonnets_2 <-data.frame(df2$Q33, df2$Q40, df2$Q47)

colnames(creative_use_human_sonnets_1) <- c('a', 'b', 'c')
colnames(creative_use_human_sonnets_2) <- c('a', 'b', 'c')

creative_use_human_sonnets <- rbind(creative_use_human_sonnets_1, creative_use_human_sonnets_2)

creative_use_human_sonnets = creative_use_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
creative_use_human_sonnets <- data.frame(x=unlist(creative_use_human_sonnets))
creative_use_human_sonnets <- as.numeric(creative_use_human_sonnets$x)

# gpt2 free verse, creative use
creative_use_gpt2_freeverse_1 <-data.frame(df1$Q75, df1$Q82, df1$Q89)
creative_use_gpt2_freeverse_2 <-data.frame(df2$Q75, df2$Q82, df2$Q89)

colnames(creative_use_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(creative_use_gpt2_freeverse_2) <- c('a', 'b', 'c')

creative_use_gpt2_freeverse <- rbind(creative_use_gpt2_freeverse_1, creative_use_gpt2_freeverse_2)

creative_use_gpt2_freeverse = creative_use_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
creative_use_gpt2_freeverse <- data.frame(x=unlist(creative_use_gpt2_freeverse))
creative_use_gpt2_freeverse <- as.numeric(creative_use_gpt2_freeverse$x)

# human free verse, creative use 
creative_use_human_freeverse_1 <-data.frame(df1$Q54, df1$Q61, df1$Q68)
creative_use_human_freeverse_2 <-data.frame(df2$Q54, df2$Q61, df2$Q68)

colnames(creative_use_human_freeverse_1) <- c('a', 'b', 'c')
colnames(creative_use_human_freeverse_2) <- c('a', 'b', 'c')

creative_use_human_freeverse <- rbind(creative_use_human_freeverse_1, creative_use_human_freeverse_2)

creative_use_human_freeverse = creative_use_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
creative_use_human_freeverse <- data.frame(x=unlist(creative_use_human_freeverse))
creative_use_human_freeverse <- as.numeric(creative_use_human_freeverse$x)

creative_use_ratings <- c(creative_use_gpt2_sonnets, creative_use_human_sonnets, creative_use_gpt2_freeverse, creative_use_human_freeverse)

z <- numeric(150)
y <- rep(1, 150)
z <- factor(z)
y <- factor(y)

# sonnets is 1 
# free verse is 0
# human is 0
# machine is 1 

sonnet_or_free_verse <- c(y, y, z, z)
human_or_machine <- c(y, z, y, z)

one <- rep(1, 25)
two <- rep(2, 25)
three <- rep(3, 25)
four <- rep(4, 25)
five <- rep(5, 25)
six <- rep(6, 25)
seven <- rep(7, 25)
eight <- rep(8, 25)
nine <- rep(9, 25)
ten <- rep(10, 25)
eleven <- rep(11, 25)
twelve <- rep(12, 25)
thirteen <- rep(13, 25)
fourteen <- rep(14, 25)
fifteen <- rep(15, 25)
sixteen <- rep(16, 25)
seventeen <- rep(17, 25)
eighteen <- rep(18, 25)
nineteen <- rep(19, 25)
twenty <- rep(20, 25)
twentyone <- rep(21, 25)
twentytwo <- rep(22, 25)
twentythree <- rep(23, 25)
twentyfour <- rep(24, 25)

poem <- c(one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twentyone, twentytwo, twentythree, twentyfour)
poem <- factor(poem)

people <- rep(1:50, 12)
people <- as.numeric(people)
people <- factor(people)

creative.use.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, creative_use_ratings)
head(creative.use.poems.data)

creative.use.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = creative_use_ratings)

# concrete imagery (2)

# gpt2 sonnets, concrete imagery 
concrete_imagery_gpt2_sonnets_1 <-data.frame(df1$Q11, df1$Q20, df1$Q27)
concrete_imagery_gpt2_sonnets_2 <-data.frame(df2$Q11, df2$Q20, df2$Q27)

colnames(concrete_imagery_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(concrete_imagery_gpt2_sonnets_2) <- c('a', 'b', 'c')

concrete_imagery_gpt2_sonnets <- rbind(concrete_imagery_gpt2_sonnets_1, concrete_imagery_gpt2_sonnets_2)

concrete_imagery_gpt2_sonnets = concrete_imagery_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
concrete_imagery_gpt2_sonnets <- data.frame(x=unlist(concrete_imagery_gpt2_sonnets))
concrete_imagery_gpt2_sonnets <- as.numeric(concrete_imagery_gpt2_sonnets$x)

# human sonnets, concrete imagery   
concrete_imagery_human_sonnets_1 <-data.frame(df1$Q34, df1$Q41, df1$Q48)
concrete_imagery_human_sonnets_2 <-data.frame(df2$Q34, df2$Q41, df2$Q48)

colnames(concrete_imagery_human_sonnets_1) <- c('a', 'b', 'c')
colnames(concrete_imagery_human_sonnets_2) <- c('a', 'b', 'c')

concrete_imagery_human_sonnets <- rbind(concrete_imagery_human_sonnets_1, concrete_imagery_human_sonnets_2)

concrete_imagery_human_sonnets = concrete_imagery_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
concrete_imagery_human_sonnets <- data.frame(x=unlist(concrete_imagery_human_sonnets))
concrete_imagery_human_sonnets <- as.numeric(concrete_imagery_human_sonnets$x)

# gpt2 free verse, concrete imagery 
concrete_imagery_gpt2_freeverse_1 <-data.frame(df1$Q76, df1$Q83, df1$Q90)
concrete_imagery_gpt2_freeverse_2 <-data.frame(df2$Q76, df2$Q83, df2$Q90)

colnames(concrete_imagery_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(concrete_imagery_gpt2_freeverse_2) <- c('a', 'b', 'c')

concrete_imagery_gpt2_freeverse <- rbind(concrete_imagery_gpt2_freeverse_1, concrete_imagery_gpt2_freeverse_2)

concrete_imagery_gpt2_freeverse = concrete_imagery_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
concrete_imagery_gpt2_freeverse <- data.frame(x=unlist(concrete_imagery_gpt2_freeverse))
concrete_imagery_gpt2_freeverse <- as.numeric(concrete_imagery_gpt2_freeverse$x)

# human free verse, concrete imagery 
concrete_imagery_human_freeverse_1 <-data.frame(df1$Q55, df1$Q62, df1$Q69)
concrete_imagery_human_freeverse_2 <-data.frame(df2$Q55, df2$Q62, df2$Q69)

colnames(concrete_imagery_human_freeverse_1) <- c('a', 'b', 'c')
colnames(concrete_imagery_human_freeverse_2) <- c('a', 'b', 'c')

concrete_imagery_human_freeverse <- rbind(concrete_imagery_human_freeverse_1, concrete_imagery_human_freeverse_2)

concrete_imagery_human_freeverse = concrete_imagery_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
concrete_imagery_human_freeverse <- data.frame(x=unlist(concrete_imagery_human_freeverse))
concrete_imagery_human_freeverse <- as.numeric(concrete_imagery_human_freeverse$x)

concrete_imagery_ratings <- c(concrete_imagery_gpt2_sonnets, concrete_imagery_human_sonnets, concrete_imagery_gpt2_freeverse, concrete_imagery_human_freeverse)

concrete.imagery.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, concrete_imagery_ratings)
head(concrete.imagery.poems.data)

concrete.imagery.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = concrete_imagery_ratings)

# sounds (3)

# gpt2 sonnets, sounds 
sounds_gpt2_sonnets_1 <-data.frame(df1$Q12, df1$Q21, df1$Q28)
sounds_gpt2_sonnets_2 <-data.frame(df2$Q12, df2$Q21, df2$Q28)

colnames(sounds_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(sounds_gpt2_sonnets_2) <- c('a', 'b', 'c')

sounds_gpt2_sonnets <- rbind(sounds_gpt2_sonnets_1, sounds_gpt2_sonnets_2)

sounds_gpt2_sonnets = sounds_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
sounds_gpt2_sonnets <- data.frame(x=unlist(sounds_gpt2_sonnets))
sounds_gpt2_sonnets <- as.numeric(sounds_gpt2_sonnets$x)

# human sonnets, sounds  
sounds_human_sonnets_1 <-data.frame(df1$Q35, df1$Q42, df1$Q49)
sounds_human_sonnets_2 <-data.frame(df2$Q35, df2$Q42, df2$Q49)

colnames(sounds_human_sonnets_1) <- c('a', 'b', 'c')
colnames(sounds_human_sonnets_2) <- c('a', 'b', 'c')

sounds_human_sonnets <- rbind(sounds_human_sonnets_1, sounds_human_sonnets_2)

sounds_human_sonnets = sounds_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
sounds_human_sonnets <- data.frame(x=unlist(sounds_human_sonnets))
sounds_human_sonnets <- as.numeric(sounds_human_sonnets$x)

# gpt2 free verse, sounds 
sounds_gpt2_freeverse_1 <-data.frame(df1$Q77, df1$Q84, df1$Q91)
sounds_gpt2_freeverse_2 <-data.frame(df2$Q77, df2$Q84, df2$Q91)

colnames(sounds_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(sounds_gpt2_freeverse_2) <- c('a', 'b', 'c')

sounds_gpt2_freeverse <- rbind(sounds_gpt2_freeverse_1, sounds_gpt2_freeverse_2)

sounds_gpt2_freeverse = sounds_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
sounds_gpt2_freeverse <- data.frame(x=unlist(sounds_gpt2_freeverse))
sounds_gpt2_freeverse <- as.numeric(sounds_gpt2_freeverse$x)

# human free verse, sounds 
sounds_human_freeverse_1 <-data.frame(df1$Q56, df1$Q63, df1$Q70)
sounds_human_freeverse_2 <-data.frame(df2$Q56, df2$Q63, df2$Q70)

colnames(sounds_human_freeverse_1) <- c('a', 'b', 'c')
colnames(sounds_human_freeverse_2) <- c('a', 'b', 'c')

sounds_human_freeverse <- rbind(sounds_human_freeverse_1, sounds_human_freeverse_2)

sounds_human_freeverse = sounds_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
sounds_human_freeverse <- data.frame(x=unlist(sounds_human_freeverse))
sounds_human_freeverse <- as.numeric(sounds_human_freeverse$x)

sounds_ratings <- c(sounds_gpt2_sonnets, sounds_human_sonnets, sounds_gpt2_freeverse, sounds_human_freeverse)

sounds.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, sounds_ratings)
head(sounds.poems.data)

sounds.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = sounds_ratings)

# rhythm and meter (4)

# gpt2 sonnets, rhythm
rhythm_gpt2_sonnets_1 <-data.frame(df1$Q13, df1$Q22, df1$Q29)
rhythm_gpt2_sonnets_2 <-data.frame(df2$Q13, df2$Q22, df2$Q29)

colnames(rhythm_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(rhythm_gpt2_sonnets_2) <- c('a', 'b', 'c')

rhythm_gpt2_sonnets <- rbind(rhythm_gpt2_sonnets_1, rhythm_gpt2_sonnets_2)

rhythm_gpt2_sonnets = rhythm_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
rhythm_gpt2_sonnets <- data.frame(x=unlist(rhythm_gpt2_sonnets))
rhythm_gpt2_sonnets <- as.numeric(rhythm_gpt2_sonnets$x)

# human sonnets, rhythm  
rhythm_human_sonnets_1 <-data.frame(df1$Q36, df1$Q43, df1$Q50)
rhythm_human_sonnets_2 <-data.frame(df2$Q36, df2$Q43, df2$Q50)

colnames(rhythm_human_sonnets_1) <- c('a', 'b', 'c')
colnames(rhythm_human_sonnets_2) <- c('a', 'b', 'c')

rhythm_human_sonnets <- rbind(rhythm_human_sonnets_1, rhythm_human_sonnets_2)

rhythm_human_sonnets = rhythm_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
rhythm_human_sonnets <- data.frame(x=unlist(rhythm_human_sonnets))
rhythm_human_sonnets <- as.numeric(rhythm_human_sonnets$x)

# gpt2 free verse, rhythm 
rhythm_gpt2_freeverse_1 <-data.frame(df1$Q78, df1$Q85, df1$Q92)
rhythm_gpt2_freeverse_2 <-data.frame(df2$Q78, df2$Q85, df2$Q92)

colnames(rhythm_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(rhythm_gpt2_freeverse_2) <- c('a', 'b', 'c')

rhythm_gpt2_freeverse <- rbind(rhythm_gpt2_freeverse_1, rhythm_gpt2_freeverse_2)

rhythm_gpt2_freeverse = rhythm_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
rhythm_gpt2_freeverse <- data.frame(x=unlist(rhythm_gpt2_freeverse))
rhythm_gpt2_freeverse <- as.numeric(rhythm_gpt2_freeverse$x)

# human free verse, rhythm
rhythm_human_freeverse_1 <-data.frame(df1$Q57, df1$Q64, df1$Q71)
rhythm_human_freeverse_2 <-data.frame(df2$Q57, df2$Q64, df2$Q71)

colnames(rhythm_human_freeverse_1) <- c('a', 'b', 'c')
colnames(rhythm_human_freeverse_2) <- c('a', 'b', 'c')

rhythm_human_freeverse <- rbind(rhythm_human_freeverse_1, rhythm_human_freeverse_2)

rhythm_human_freeverse = rhythm_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
rhythm_human_freeverse <- data.frame(x=unlist(rhythm_human_freeverse))
rhythm_human_freeverse <- as.numeric(rhythm_human_freeverse$x)

rhythm_ratings <- c(rhythm_gpt2_sonnets, rhythm_human_sonnets, rhythm_gpt2_freeverse, rhythm_human_freeverse)

rhythm.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, rhythm_ratings)

rhythm.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = rhythm_ratings)

# open interpretation (5)

# gpt2 sonnets, open
open_gpt2_sonnets_1 <-data.frame(df1$Q14, df1$Q23, df1$Q30)
open_gpt2_sonnets_2 <-data.frame(df2$Q14, df2$Q23, df2$Q30)

colnames(open_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(open_gpt2_sonnets_2) <- c('a', 'b', 'c')

open_gpt2_sonnets <- rbind(open_gpt2_sonnets_1, open_gpt2_sonnets_2)

open_gpt2_sonnets = open_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
open_gpt2_sonnets <- data.frame(x=unlist(open_gpt2_sonnets))
open_gpt2_sonnets <- as.numeric(open_gpt2_sonnets$x)

# human sonnets, open 
open_human_sonnets_1 <-data.frame(df1$Q37, df1$Q44, df1$Q51)
open_human_sonnets_2 <-data.frame(df2$Q37, df2$Q44, df2$Q51)

colnames(open_human_sonnets_1) <- c('a', 'b', 'c')
colnames(open_human_sonnets_2) <- c('a', 'b', 'c')

open_human_sonnets <- rbind(open_human_sonnets_1, open_human_sonnets_2)

open_human_sonnets = open_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
open_human_sonnets <- data.frame(x=unlist(open_human_sonnets))
open_human_sonnets <- as.numeric(open_human_sonnets$x)

# gpt2 free verse, open 
open_gpt2_freeverse_1 <-data.frame(df1$Q79, df1$Q86, df1$Q93)
open_gpt2_freeverse_2 <-data.frame(df2$Q79, df2$Q86, df2$Q93)

colnames(open_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(open_gpt2_freeverse_2) <- c('a', 'b', 'c')

open_gpt2_freeverse <- rbind(open_gpt2_freeverse_1, open_gpt2_freeverse_2)

open_gpt2_freeverse = open_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
open_gpt2_freeverse <- data.frame(x=unlist(open_gpt2_freeverse))
open_gpt2_freeverse <- as.numeric(open_gpt2_freeverse$x)

# human free verse, open
open_human_freeverse_1 <-data.frame(df1$Q58, df1$Q65, df1$Q72)
open_human_freeverse_2 <-data.frame(df2$Q58, df2$Q65, df2$Q72)

colnames(open_human_freeverse_1) <- c('a', 'b', 'c')
colnames(open_human_freeverse_2) <- c('a', 'b', 'c')

open_human_freeverse <- rbind(open_human_freeverse_1, open_human_freeverse_2)

open_human_freeverse = open_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
open_human_freeverse <- data.frame(x=unlist(open_human_freeverse))
open_human_freeverse <- as.numeric(open_human_freeverse$x)

open_ratings <- c(open_gpt2_sonnets, open_human_sonnets, open_gpt2_freeverse, open_human_freeverse)

open.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, open_ratings)

open.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = open_ratings)

# pleasant (6, 1)

# gpt2 sonnets, pleasant
pleasant_gpt2_sonnets_1 <-data.frame(df1$Q17_1, df1$Q24_1, df1$Q31_1)
pleasant_gpt2_sonnets_2 <-data.frame(df2$Q17_1, df2$Q24_1, df2$Q31_1)

colnames(pleasant_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(pleasant_gpt2_sonnets_2) <- c('a', 'b', 'c')

pleasant_gpt2_sonnets <- rbind(pleasant_gpt2_sonnets_1, pleasant_gpt2_sonnets_2)

pleasant_gpt2_sonnets = pleasant_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
pleasant_gpt2_sonnets <- data.frame(x=unlist(pleasant_gpt2_sonnets))
pleasant_gpt2_sonnets <- as.numeric(pleasant_gpt2_sonnets$x)

# human sonnets, pleasant 
pleasant_human_sonnets_1 <-data.frame(df1$Q38_1, df1$Q45_1, df1$Q52_1)
pleasant_human_sonnets_2 <-data.frame(df2$Q38_1, df2$Q45_1, df2$Q52_1)

colnames(pleasant_human_sonnets_1) <- c('a', 'b', 'c')
colnames(pleasant_human_sonnets_2) <- c('a', 'b', 'c')

pleasant_human_sonnets <- rbind(pleasant_human_sonnets_1, pleasant_human_sonnets_2)

pleasant_human_sonnets = pleasant_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
pleasant_human_sonnets <- data.frame(x=unlist(pleasant_human_sonnets))
pleasant_human_sonnets <- as.numeric(pleasant_human_sonnets$x)

# gpt2 free verse, pleasant 
pleasant_gpt2_freeverse_1 <-data.frame(df1$Q80_1, df1$Q87_1, df1$Q94_1)
pleasant_gpt2_freeverse_2 <-data.frame(df2$Q80_1, df2$Q87_1, df2$Q94_1)

colnames(pleasant_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(pleasant_gpt2_freeverse_2) <- c('a', 'b', 'c')

pleasant_gpt2_freeverse <- rbind(pleasant_gpt2_freeverse_1, pleasant_gpt2_freeverse_2)

pleasant_gpt2_freeverse = pleasant_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
pleasant_gpt2_freeverse <- data.frame(x=unlist(pleasant_gpt2_freeverse))
pleasant_gpt2_freeverse <- as.numeric(pleasant_gpt2_freeverse$x)

# human free verse, pleasant
pleasant_human_freeverse_1 <-data.frame(df1$Q59_1, df1$Q66_1, df1$Q73_1)
pleasant_human_freeverse_2 <-data.frame(df2$Q59_1, df2$Q66_1, df2$Q73_1)

colnames(pleasant_human_freeverse_1) <- c('a', 'b', 'c')
colnames(pleasant_human_freeverse_2) <- c('a', 'b', 'c')

pleasant_human_freeverse <- rbind(pleasant_human_freeverse_1, pleasant_human_freeverse_2)

pleasant_human_freeverse = pleasant_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
pleasant_human_freeverse <- data.frame(x=unlist(pleasant_human_freeverse))
pleasant_human_freeverse <- as.numeric(pleasant_human_freeverse$x)

pleasant_ratings <- c(pleasant_gpt2_sonnets, pleasant_human_sonnets, pleasant_gpt2_freeverse, pleasant_human_freeverse)

pleasant.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, pleasant_ratings)

pleasant.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = pleasant_ratings)

# symbolic (7, 2)

# gpt2 sonnets, symbolic
symbolic_gpt2_sonnets_1 <-data.frame(df1$Q17_2, df1$Q24_2, df1$Q31_2)
symbolic_gpt2_sonnets_2 <-data.frame(df2$Q17_2, df2$Q24_2, df2$Q31_2)

colnames(symbolic_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(symbolic_gpt2_sonnets_2) <- c('a', 'b', 'c')

symbolic_gpt2_sonnets <- rbind(symbolic_gpt2_sonnets_1, symbolic_gpt2_sonnets_2)

symbolic_gpt2_sonnets = symbolic_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
symbolic_gpt2_sonnets <- data.frame(x=unlist(symbolic_gpt2_sonnets))
symbolic_gpt2_sonnets <- as.numeric(symbolic_gpt2_sonnets$x)

# human sonnets, symbolic
symbolic_human_sonnets_1 <-data.frame(df1$Q38_2, df1$Q45_2, df1$Q52_2)
symbolic_human_sonnets_2 <-data.frame(df2$Q38_2, df2$Q45_2, df2$Q52_2)

colnames(symbolic_human_sonnets_1) <- c('a', 'b', 'c')
colnames(symbolic_human_sonnets_2) <- c('a', 'b', 'c')

symbolic_human_sonnets <- rbind(symbolic_human_sonnets_1, symbolic_human_sonnets_2)

symbolic_human_sonnets = symbolic_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
symbolic_human_sonnets <- data.frame(x=unlist(symbolic_human_sonnets))
symbolic_human_sonnets <- as.numeric(symbolic_human_sonnets$x)

# gpt2 free verse, symbolic 
symbolic_gpt2_freeverse_1 <-data.frame(df1$Q80_2, df1$Q87_2, df1$Q94_2)
symbolic_gpt2_freeverse_2 <-data.frame(df2$Q80_2, df2$Q87_2, df2$Q94_2)

colnames(symbolic_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(symbolic_gpt2_freeverse_2) <- c('a', 'b', 'c')

symbolic_gpt2_freeverse <- rbind(symbolic_gpt2_freeverse_1, symbolic_gpt2_freeverse_2)

symbolic_gpt2_freeverse = symbolic_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
symbolic_gpt2_freeverse <- data.frame(x=unlist(symbolic_gpt2_freeverse))
symbolic_gpt2_freeverse <- as.numeric(symbolic_gpt2_freeverse$x)

# human free verse, symbolic
symbolic_human_freeverse_1 <-data.frame(df1$Q59_2, df1$Q66_2, df1$Q73_2)
symbolic_human_freeverse_2 <-data.frame(df2$Q59_2, df2$Q66_2, df2$Q73_2)

colnames(symbolic_human_freeverse_1) <- c('a', 'b', 'c')
colnames(symbolic_human_freeverse_2) <- c('a', 'b', 'c')

symbolic_human_freeverse <- rbind(symbolic_human_freeverse_1, symbolic_human_freeverse_2)

symbolic_human_freeverse = symbolic_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
symbolic_human_freeverse <- data.frame(x=unlist(symbolic_human_freeverse))
symbolic_human_freeverse <- as.numeric(symbolic_human_freeverse$x)

symbolic_ratings <- c(symbolic_gpt2_sonnets, symbolic_human_sonnets, symbolic_gpt2_freeverse, symbolic_human_freeverse)

symbolic.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, symbolic_ratings)

symbolic.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = symbolic_ratings)

# formal (8, 3)

# gpt2 sonnets, formal
formal_gpt2_sonnets_1 <-data.frame(df1$Q17_3, df1$Q24_3, df1$Q31_3)
formal_gpt2_sonnets_2 <-data.frame(df2$Q17_3, df2$Q24_3, df2$Q31_3)

colnames(formal_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(formal_gpt2_sonnets_2) <- c('a', 'b', 'c')

formal_gpt2_sonnets <- rbind(formal_gpt2_sonnets_1, formal_gpt2_sonnets_2)

formal_gpt2_sonnets = formal_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
formal_gpt2_sonnets <- data.frame(x=unlist(formal_gpt2_sonnets))
formal_gpt2_sonnets <- as.numeric(formal_gpt2_sonnets$x)


# human sonnets, formal
formal_human_sonnets_1 <-data.frame(df1$Q38_3, df1$Q45_3, df1$Q52_3)
formal_human_sonnets_2 <-data.frame(df2$Q38_3, df2$Q45_3, df2$Q52_3)

colnames(formal_human_sonnets_1) <- c('a', 'b', 'c')
colnames(formal_human_sonnets_2) <- c('a', 'b', 'c')

formal_human_sonnets <- rbind(formal_human_sonnets_1, formal_human_sonnets_2)

formal_human_sonnets = formal_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
formal_human_sonnets <- data.frame(x=unlist(formal_human_sonnets))
formal_human_sonnets <- as.numeric(formal_human_sonnets$x)

# gpt2 free verse, formal
formal_gpt2_freeverse_1 <-data.frame(df1$Q80_3, df1$Q87_3, df1$Q94_3)
formal_gpt2_freeverse_2 <-data.frame(df2$Q80_3, df2$Q87_3, df2$Q94_3)

colnames(formal_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(formal_gpt2_freeverse_2) <- c('a', 'b', 'c')

formal_gpt2_freeverse <- rbind(formal_gpt2_freeverse_1, formal_gpt2_freeverse_2)

formal_gpt2_freeverse = formal_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
formal_gpt2_freeverse <- data.frame(x=unlist(formal_gpt2_freeverse))
formal_gpt2_freeverse <- as.numeric(formal_gpt2_freeverse$x)

# human free verse, formal
formal_human_freeverse_1 <-data.frame(df1$Q59_3, df1$Q66_3, df1$Q73_3)
formal_human_freeverse_2 <-data.frame(df2$Q59_3, df2$Q66_3, df2$Q73_3)

colnames(formal_human_freeverse_1) <- c('a', 'b', 'c')
colnames(formal_human_freeverse_2) <- c('a', 'b', 'c')

formal_human_freeverse <- rbind(formal_human_freeverse_1, formal_human_freeverse_2)

formal_human_freeverse = formal_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
formal_human_freeverse <- data.frame(x=unlist(formal_human_freeverse))
formal_human_freeverse <- as.numeric(formal_human_freeverse$x)

formal_ratings <- c(formal_gpt2_sonnets, formal_human_sonnets, formal_gpt2_freeverse, formal_human_freeverse)

formal.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, formal_ratings)

formal.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = formal_ratings)

# descriptive (9, 4)

# gpt2 sonnets, descriptive
descriptive_gpt2_sonnets_1 <-data.frame(df1$Q17_4, df1$Q24_4, df1$Q31_4)
descriptive_gpt2_sonnets_2 <-data.frame(df2$Q17_4, df2$Q24_4, df2$Q31_4)

colnames(descriptive_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(descriptive_gpt2_sonnets_2) <- c('a', 'b', 'c')

descriptive_gpt2_sonnets <- rbind(descriptive_gpt2_sonnets_1, descriptive_gpt2_sonnets_2)

descriptive_gpt2_sonnets = descriptive_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
descriptive_gpt2_sonnets <- data.frame(x=unlist(descriptive_gpt2_sonnets))
descriptive_gpt2_sonnets <- as.numeric(descriptive_gpt2_sonnets$x)


# human sonnets, descriptive
descriptive_human_sonnets_1 <-data.frame(df1$Q38_4, df1$Q45_4, df1$Q52_4)
descriptive_human_sonnets_2 <-data.frame(df2$Q38_4, df2$Q45_4, df2$Q52_4)

colnames(descriptive_human_sonnets_1) <- c('a', 'b', 'c')
colnames(descriptive_human_sonnets_2) <- c('a', 'b', 'c')

descriptive_human_sonnets <- rbind(descriptive_human_sonnets_1, descriptive_human_sonnets_2)

descriptive_human_sonnets = descriptive_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
descriptive_human_sonnets <- data.frame(x=unlist(descriptive_human_sonnets))
descriptive_human_sonnets <- as.numeric(descriptive_human_sonnets$x)

# gpt2 free verse, descriptive
descriptive_gpt2_freeverse_1 <-data.frame(df1$Q80_4, df1$Q87_4, df1$Q94_4)
descriptive_gpt2_freeverse_2 <-data.frame(df2$Q80_4, df2$Q87_4, df2$Q94_4)

colnames(descriptive_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(descriptive_gpt2_freeverse_2) <- c('a', 'b', 'c')

descriptive_gpt2_freeverse <- rbind(descriptive_gpt2_freeverse_1, descriptive_gpt2_freeverse_2)

descriptive_gpt2_freeverse = descriptive_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
descriptive_gpt2_freeverse <- data.frame(x=unlist(descriptive_gpt2_freeverse))
descriptive_gpt2_freeverse <- as.numeric(descriptive_gpt2_freeverse$x)

# human free verse, descriptive
descriptive_human_freeverse_1 <-data.frame(df1$Q59_4, df1$Q66_4, df1$Q73_4)
descriptive_human_freeverse_2 <-data.frame(df2$Q59_4, df2$Q66_4, df2$Q73_4)

colnames(descriptive_human_freeverse_1) <- c('a', 'b', 'c')
colnames(descriptive_human_freeverse_2) <- c('a', 'b', 'c')

descriptive_human_freeverse <- rbind(descriptive_human_freeverse_1, descriptive_human_freeverse_2)

descriptive_human_freeverse = descriptive_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
descriptive_human_freeverse <- data.frame(x=unlist(descriptive_human_freeverse))
descriptive_human_freeverse <- as.numeric(descriptive_human_freeverse$x)

descriptive_ratings <- c(descriptive_gpt2_sonnets, descriptive_human_sonnets, descriptive_gpt2_freeverse, descriptive_human_freeverse)

descriptive.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, descriptive_ratings)

descriptive.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = descriptive_ratings)

# expressive (10, 5)

# gpt2 sonnets, expressive
expressive_gpt2_sonnets_1 <-data.frame(df1$Q17_5, df1$Q24_5, df1$Q31_5)
expressive_gpt2_sonnets_2 <-data.frame(df2$Q17_5, df2$Q24_5, df2$Q31_5)

colnames(expressive_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(expressive_gpt2_sonnets_2) <- c('a', 'b', 'c')

expressive_gpt2_sonnets <- rbind(expressive_gpt2_sonnets_1, expressive_gpt2_sonnets_2)

expressive_gpt2_sonnets = expressive_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
expressive_gpt2_sonnets <- data.frame(x=unlist(expressive_gpt2_sonnets))
expressive_gpt2_sonnets <- as.numeric(expressive_gpt2_sonnets$x)


# human sonnets, expressive
expressive_human_sonnets_1 <-data.frame(df1$Q38_5, df1$Q45_5, df1$Q52_5)
expressive_human_sonnets_2 <-data.frame(df2$Q38_5, df2$Q45_5, df2$Q52_5)

colnames(expressive_human_sonnets_1) <- c('a', 'b', 'c')
colnames(expressive_human_sonnets_2) <- c('a', 'b', 'c')

expressive_human_sonnets <- rbind(expressive_human_sonnets_1, expressive_human_sonnets_2)

expressive_human_sonnets = expressive_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
expressive_human_sonnets <- data.frame(x=unlist(expressive_human_sonnets))
expressive_human_sonnets <- as.numeric(expressive_human_sonnets$x)

# gpt2 free verse, expressive
expressive_gpt2_freeverse_1 <-data.frame(df1$Q80_5, df1$Q87_5, df1$Q94_5)
expressive_gpt2_freeverse_2 <-data.frame(df2$Q80_5, df2$Q87_5, df2$Q94_5)

colnames(expressive_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(expressive_gpt2_freeverse_2) <- c('a', 'b', 'c')

expressive_gpt2_freeverse <- rbind(expressive_gpt2_freeverse_1, expressive_gpt2_freeverse_2)

expressive_gpt2_freeverse = expressive_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
expressive_gpt2_freeverse <- data.frame(x=unlist(expressive_gpt2_freeverse))
expressive_gpt2_freeverse <- as.numeric(expressive_gpt2_freeverse$x)

# human free verse, expressive
expressive_human_freeverse_1 <-data.frame(df1$Q59_5, df1$Q66_5, df1$Q73_5)
expressive_human_freeverse_2 <-data.frame(df2$Q59_5, df2$Q66_5, df2$Q73_5)

colnames(expressive_human_freeverse_1) <- c('a', 'b', 'c')
colnames(expressive_human_freeverse_2) <- c('a', 'b', 'c')

expressive_human_freeverse <- rbind(expressive_human_freeverse_1, expressive_human_freeverse_2)

expressive_human_freeverse = expressive_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
expressive_human_freeverse <- data.frame(x=unlist(expressive_human_freeverse))
expressive_human_freeverse <- as.numeric(expressive_human_freeverse$x)

expressive_ratings <- c(expressive_gpt2_sonnets, expressive_human_sonnets, expressive_gpt2_freeverse, expressive_human_freeverse)

expressive.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, expressive_ratings)

expressive.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = expressive_ratings)

# thoughtful (11, 6)

# gpt2 sonnets, thoughtful
thoughtful_gpt2_sonnets_1 <-data.frame(df1$Q17_6, df1$Q24_6, df1$Q31_6)
thoughtful_gpt2_sonnets_2 <-data.frame(df2$Q17_6, df2$Q24_6, df2$Q31_6)

colnames(thoughtful_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(thoughtful_gpt2_sonnets_2) <- c('a', 'b', 'c')

thoughtful_gpt2_sonnets <- rbind(thoughtful_gpt2_sonnets_1, thoughtful_gpt2_sonnets_2)

thoughtful_gpt2_sonnets = thoughtful_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
thoughtful_gpt2_sonnets <- data.frame(x=unlist(thoughtful_gpt2_sonnets))
thoughtful_gpt2_sonnets <- as.numeric(thoughtful_gpt2_sonnets$x)


# human sonnets, thoughtful
thoughtful_human_sonnets_1 <-data.frame(df1$Q38_6, df1$Q45_6, df1$Q52_6)
thoughtful_human_sonnets_2 <-data.frame(df2$Q38_6, df2$Q45_6, df2$Q52_6)

colnames(thoughtful_human_sonnets_1) <- c('a', 'b', 'c')
colnames(thoughtful_human_sonnets_2) <- c('a', 'b', 'c')

thoughtful_human_sonnets <- rbind(thoughtful_human_sonnets_1, thoughtful_human_sonnets_2)

thoughtful_human_sonnets = thoughtful_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
thoughtful_human_sonnets <- data.frame(x=unlist(thoughtful_human_sonnets))
thoughtful_human_sonnets <- as.numeric(thoughtful_human_sonnets$x)

# gpt2 free verse, thoughtful
thoughtful_gpt2_freeverse_1 <-data.frame(df1$Q80_6, df1$Q87_6, df1$Q94_6)
thoughtful_gpt2_freeverse_2 <-data.frame(df2$Q80_6, df2$Q87_6, df2$Q94_6)

colnames(thoughtful_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(thoughtful_gpt2_freeverse_2) <- c('a', 'b', 'c')

thoughtful_gpt2_freeverse <- rbind(thoughtful_gpt2_freeverse_1, thoughtful_gpt2_freeverse_2)

thoughtful_gpt2_freeverse = thoughtful_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
thoughtful_gpt2_freeverse <- data.frame(x=unlist(thoughtful_gpt2_freeverse))
thoughtful_gpt2_freeverse <- as.numeric(thoughtful_gpt2_freeverse$x)

# human free verse, thoughtful
thoughtful_human_freeverse_1 <-data.frame(df1$Q59_6, df1$Q66_6, df1$Q73_6)
thoughtful_human_freeverse_2 <-data.frame(df2$Q59_6, df2$Q66_6, df2$Q73_6)

colnames(thoughtful_human_freeverse_1) <- c('a', 'b', 'c')
colnames(thoughtful_human_freeverse_2) <- c('a', 'b', 'c')

thoughtful_human_freeverse <- rbind(thoughtful_human_freeverse_1, thoughtful_human_freeverse_2)

thoughtful_human_freeverse = thoughtful_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
thoughtful_human_freeverse <- data.frame(x=unlist(thoughtful_human_freeverse))
thoughtful_human_freeverse <- as.numeric(thoughtful_human_freeverse$x)

thoughtful_ratings <- c(thoughtful_gpt2_sonnets, thoughtful_human_sonnets, thoughtful_gpt2_freeverse, thoughtful_human_freeverse)

thoughtful.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, thoughtful_ratings)

thoughtful.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = thoughtful_ratings)

# imaginative (12, 7)

# gpt2 sonnets, imaginative
imaginative_gpt2_sonnets_1 <-data.frame(df1$Q17_7, df1$Q24_7, df1$Q31_7)
imaginative_gpt2_sonnets_2 <-data.frame(df2$Q17_7, df2$Q24_7, df2$Q31_7)

colnames(imaginative_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(imaginative_gpt2_sonnets_2) <- c('a', 'b', 'c')

imaginative_gpt2_sonnets <- rbind(imaginative_gpt2_sonnets_1, imaginative_gpt2_sonnets_2)

imaginative_gpt2_sonnets = imaginative_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
imaginative_gpt2_sonnets <- data.frame(x=unlist(imaginative_gpt2_sonnets))
imaginative_gpt2_sonnets <- as.numeric(imaginative_gpt2_sonnets$x)


# human sonnets, imaginative
imaginative_human_sonnets_1 <-data.frame(df1$Q38_7, df1$Q45_7, df1$Q52_7)
imaginative_human_sonnets_2 <-data.frame(df2$Q38_7, df2$Q45_7, df2$Q52_7)

colnames(imaginative_human_sonnets_1) <- c('a', 'b', 'c')
colnames(imaginative_human_sonnets_2) <- c('a', 'b', 'c')

imaginative_human_sonnets <- rbind(imaginative_human_sonnets_1, imaginative_human_sonnets_2)

imaginative_human_sonnets = imaginative_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
imaginative_human_sonnets <- data.frame(x=unlist(imaginative_human_sonnets))
imaginative_human_sonnets <- as.numeric(imaginative_human_sonnets$x)

# gpt2 free verse, imaginative
imaginative_gpt2_freeverse_1 <-data.frame(df1$Q80_7, df1$Q87_7, df1$Q94_7)
imaginative_gpt2_freeverse_2 <-data.frame(df2$Q80_7, df2$Q87_7, df2$Q94_7)

colnames(imaginative_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(imaginative_gpt2_freeverse_2) <- c('a', 'b', 'c')

imaginative_gpt2_freeverse <- rbind(imaginative_gpt2_freeverse_1, imaginative_gpt2_freeverse_2)

imaginative_gpt2_freeverse = imaginative_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
imaginative_gpt2_freeverse <- data.frame(x=unlist(imaginative_gpt2_freeverse))
imaginative_gpt2_freeverse <- as.numeric(imaginative_gpt2_freeverse$x)

# human free verse, imaginative
imaginative_human_freeverse_1 <-data.frame(df1$Q59_7, df1$Q66_7, df1$Q73_7)
imaginative_human_freeverse_2 <-data.frame(df2$Q59_7, df2$Q66_7, df2$Q73_7)

colnames(imaginative_human_freeverse_1) <- c('a', 'b', 'c')
colnames(imaginative_human_freeverse_2) <- c('a', 'b', 'c')

imaginative_human_freeverse <- rbind(imaginative_human_freeverse_1, imaginative_human_freeverse_2)

imaginative_human_freeverse = imaginative_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
imaginative_human_freeverse <- data.frame(x=unlist(imaginative_human_freeverse))
imaginative_human_freeverse <- as.numeric(imaginative_human_freeverse$x)

imaginative_ratings <- c(imaginative_gpt2_sonnets, imaginative_human_sonnets, imaginative_gpt2_freeverse, imaginative_human_freeverse)

imaginative.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, imaginative_ratings)

imaginative.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = imaginative_ratings)

# playful (13, 8)

# gpt2 sonnets, playful
playful_gpt2_sonnets_1 <-data.frame(df1$Q17_8, df1$Q24_8, df1$Q31_8)
playful_gpt2_sonnets_2 <-data.frame(df2$Q17_8, df2$Q24_8, df2$Q31_8)

colnames(playful_gpt2_sonnets_1) <- c('a', 'b', 'c')
colnames(playful_gpt2_sonnets_2) <- c('a', 'b', 'c')

playful_gpt2_sonnets <- rbind(playful_gpt2_sonnets_1, playful_gpt2_sonnets_2)

playful_gpt2_sonnets = playful_gpt2_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
playful_gpt2_sonnets <- data.frame(x=unlist(playful_gpt2_sonnets))
playful_gpt2_sonnets <- as.numeric(playful_gpt2_sonnets$x)


# human sonnets, playful
playful_human_sonnets_1 <-data.frame(df1$Q38_8, df1$Q45_8, df1$Q52_8)
playful_human_sonnets_2 <-data.frame(df2$Q38_7, df2$Q45_8, df2$Q52_8)

colnames(playful_human_sonnets_1) <- c('a', 'b', 'c')
colnames(playful_human_sonnets_2) <- c('a', 'b', 'c')

playful_human_sonnets <- rbind(playful_human_sonnets_1, playful_human_sonnets_2)

playful_human_sonnets = playful_human_sonnets[-c(1, 2, 28, 29, 30, 31, 40, 48),]
playful_human_sonnets <- data.frame(x=unlist(playful_human_sonnets))
playful_human_sonnets <- as.numeric(playful_human_sonnets$x)

# gpt2 free verse, playful
playful_gpt2_freeverse_1 <-data.frame(df1$Q80_8, df1$Q87_8, df1$Q94_8)
playful_gpt2_freeverse_2 <-data.frame(df2$Q80_8, df2$Q87_8, df2$Q94_8)

colnames(playful_gpt2_freeverse_1) <- c('a', 'b', 'c')
colnames(playful_gpt2_freeverse_2) <- c('a', 'b', 'c')

playful_gpt2_freeverse <- rbind(playful_gpt2_freeverse_1, playful_gpt2_freeverse_2)

playful_gpt2_freeverse = playful_gpt2_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
playful_gpt2_freeverse <- data.frame(x=unlist(playful_gpt2_freeverse))
playful_gpt2_freeverse <- as.numeric(playful_gpt2_freeverse$x)

# human free verse, playful
playful_human_freeverse_1 <-data.frame(df1$Q59_8, df1$Q66_8, df1$Q73_8)
playful_human_freeverse_2 <-data.frame(df2$Q59_8, df2$Q66_8, df2$Q73_8)

colnames(playful_human_freeverse_1) <- c('a', 'b', 'c')
colnames(playful_human_freeverse_2) <- c('a', 'b', 'c')

playful_human_freeverse <- rbind(playful_human_freeverse_1, playful_human_freeverse_2)

playful_human_freeverse = playful_human_freeverse[-c(1, 2, 28, 29, 30, 31, 40, 48),]
playful_human_freeverse <- data.frame(x=unlist(playful_human_freeverse))
playful_human_freeverse <- as.numeric(playful_human_freeverse$x)

playful_ratings <- c(playful_gpt2_sonnets, playful_human_sonnets, playful_gpt2_freeverse, playful_human_freeverse)

playful.poems.data <- data.frame(poem, people, human_or_machine, sonnet_or_free_verse, playful_ratings)

playful.poems.data <- data.frame(poem = poem, people = people, human_or_machine = human_or_machine, sonnet_or_free_verse = sonnet_or_free_verse, ratings = playful_ratings)

# question factor (1-13, repeated 600 times each)

q1 <- rep(1, 600)
q2 <- rep(2, 600)
q3 <- rep(3, 600)
q4 <- rep(4, 600)
q5 <- rep(5, 600)
q6 <- rep(6, 600)
q7 <- rep(7, 600)
q8 <- rep(8, 600)
q9 <- rep(9, 600)
q10 <- rep(10, 600)
q11 <- rep(11, 600)
q12 <- rep(12, 600)
q13 <- rep(13, 600)

question <- c(q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13)
question <- factor(question)

poems.data <- rbind(creative.use.poems.data, concrete.imagery.poems.data, sounds.poems.data, rhythm.poems.data, open.poems.data,
                    pleasant.poems.data, symbolic.poems.data, formal.poems.data, descriptive.poems.data,
                    expressive.poems.data, thoughtful.poems.data, imaginative.poems.data, playful.poems.data)

poems.data <- data.frame(question, poems.data)

as.factor(poems.data$question)
as.factor(poems.data$poem)
as.factor(poems.data$people)
as.factor(poems.data$human_or_machine)
as.factor(poems.data$sonnet_or_free_verse)
as.factor(poems.data$ratings)

save(poems.data, file='ashley.rda')

poems.data <- poems.data[!is.na(poems.data$ratings),]
poems.data$ratings <- as.ordered(as.factor(poems.data$ratings))