load("bryor_for_modeling.rda")
library(brms)
install.packages("cmdstanr")
library(cmdstanr)
library(tidybayes)
library(brms)
library(ggplot2)

head(sonnet_or_free_verse)

z <- numeric(150)
y <- rep(1, 150)
z <- factor(z)
y <- factor(y)

# sonnets is 0 
# free verse is 1
# human is 0
# machine is 1 
free_verse_or_sonnet <- c(y, y, z, z, y, y, z, z, y, y, z, z, y, y, z, z, y, y, z, z, y, y, z, z, y, y, z, z, y, y, z, z, y, y, z, z, y, y, z, z, y, y, z, z, y, y, z, z, y, y, z, z)

subset(poems.data, select = -sonnet_or_free_verse)

contrasts(poems.data$human_or_machine) <- contr.sum(2)
contrasts(poems.data$free_verse_or_sonnet) <- contr.sum(2)

models_1 <- list()
models_2 <- list()
loos <- list()

for(i in 1:13) {
  formula <- bf(ratings ~
                  human_or_machine * free_verse_or_sonnet +
                  (1 + human_or_machine * free_verse_or_sonnet | people) +
                  (1 | poem)) +
    lf(disc ~ 0 + human_or_machine * free_verse_or_sonnet +
         (1 + human_or_machine * free_verse_or_sonnet | people)
       + (1 | poem), cmc = F)

  models_1[[i]] <- brm(formula, data = poems.data[poems.data$question==i,], family = cumulative(), chains = 4, cores = 2, threads = threading(2), backend = "cmdstanr")

  formula <- bf(ratings ~ 
                  human_or_machine * free_verse_or_sonnet + 
                  (1 | people) + 
                  (1 | poem)) + 
    lf(disc ~ 0 + human_or_machine * free_verse_or_sonnet + 
         (1 | people) 
       + (1 | poem), cmc = F)
  
  models_2[[i]] <- brm(formula, data = poems.data[poems.data$question==i,], family = cumulative(), chains = 4, cores = 2, threads = threading(2), backend = "cmdstanr")
  
  loos[[i]] <- loo(models_1[[i]], models_2[[i]])
}

pdf(file = "human_or_machine.pdf")
plot(x=c(-3,3),y=c(1,13),type="n",bty="L", xlab = "coefficient", ylab = "Question", ylim = c(0,14),yaxt="n", main = "Human or Machine")
axis(2, at = 1:13,labels = 1:13)
for(i in 13:1) {
  m1 <- posterior_samples(models_2[[i]])
  d <- density(m1$b_human_or_machine0)
  polygon(d$x, d$y+i, col = "grey")
}
abline(v=0,lty=2)
dev.off()

pdf(file = "free_verse_or_sonnet.pdf")
plot(x=c(-3,3),y=c(1,13),type="n",bty="L", xlab = "coefficient", ylab = "Question", ylim = c(0,14),yaxt="n", main = "Sonnet or Free Verse")
axis(2, at = 1:13,labels = 1:13)
for(i in 13:1) {
  m1 <- posterior_samples(models_2[[i]])
  d <- density(m1$b_free_verse_or_sonnet1)
  polygon(d$x, d$y+i, col = "grey")
}
abline(v=0,lty=2)
dev.off()

pdf(file = "sonnet_or_free_verse_human_or_machine_interaction.pdf")
plot(x=c(-3,3),y=c(1,13),type="n",bty="L", xlab = "coefficient", ylab = "Question", ylim = c(0,14),yaxt="n", main = "Sonnet or Free Verse Human or Machine Interaction")
axis(2, at = 1:13,labels = 1:13)
for(i in 13:1) {
  m1 <- posterior_samples(models_2[[i]])
  d <- density(m1$`b_human_or_machine0:free_verse_or_sonnet1`)
  polygon(d$x, d$y+i, col = "grey")
}
abline(v=0,lty=2)
dev.off()

data.frame()

for(i in 1:13) {
  pl <- posterior_linpred(models_2[[4]], newdata = poems.data, re_formula = NA)
}

ranef(models_2[[4]])
