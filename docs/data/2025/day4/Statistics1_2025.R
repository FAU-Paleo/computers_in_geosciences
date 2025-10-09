# Statistics script
setwd("D:/arbeit/presentations/Vorlesungen/ComputerGeowissenschaften/")

library(readxl)

size <- read_excel("Sizes2024.xlsx", 1)

# all cohorts
m <- size$size[size$gender=="male"]
f <- size$size[size$gender=="female"]

t.test(m,f)

# only 2025 cohort
m <- size$size[size$gender=="male" & size$year==2025]
f <- size$size[size$gender=="female" & size$year==2025]

t.test(m,f)
wilcox.test(m,f)
t.test(m, f, alternative="greater")

# boxplot by gender
boxplot(size$size ~ size$gender)
# Histogram of all data
hist(size$size)
# test normality
shapiro.test(size$size) 



############################
# Simulations to test the effect of sample size
 s1 <- rnorm(100, 177)
 s2 <- rnorm(100, 178)
  t.test(s1, s2)

  s1 <- rnorm(5, 177)
  s2 <- rnorm(5, 178)
  t.test(s1, s2)
 

  
  wilcox.test(m, f, alternative="greater")
  
  
  
  hist(size$`size (cm)`)
 
 hist(m, breaks=5)
 hist(f, breaks=5)

 hist(size$size)
 
 boxplot(m,f)
 boxplot(m, f, names=c("male", "female"), ylab="Size (cm)")
 
 windows()
 
 summary(size)
  
 x <- rnorm(100000, 5, 1)
 hist(x)
 
 
 
 
 #### random stuff ----
 x <- NA
 for (i in -10:10) x[i+11] <- exp(i)
    
# dat <- read.csv("https://www.cnidaria.nat.fau.de/tersane/public/course/Data/datasaurus.csv")
 
 
  s1 <- rnorm(100, 177)
  s2 <- rnorm(100, 178)

  t.test(s1, s2)  

  ks.test(s1, "rnorm")
    
  s1 <- rnorm(10, 177)
  s2 <- rnorm(10, 178)
  
  t.test(s1, s2) 
  
  s1 <- rnorm(5, 177)
  s2 <- rnorm(5, 178)
  
  t <- t.test(s1, s2) 

  
  
   y <- 2
  for(i in 1:10) {
    print(y)
    y <- y*4 
  }
  
  
  # Loop to identify critical sample size
  p <- numeric()
  sample_size <- numeric()
  for (i in 2:100) {
    for (j in 1:100) {
      s1 <- rnorm(i, 177)
      s2 <- rnorm(i, 178)
      t <- t.test(s1, s2) 
      p <- append(p, t$p.value)
      sample_size <- append(sample_size, i)
    }
  }
  
  plot(p ~ sample_size, xlab="n", ylab="p-value")
   abline(h= 0.05, col="red")
  
  sig <- which(p<0.05) 
    points(sig, p[sig], pch=19) 
  
    
    
    
    
    
    
    
   p.vals <- numeric()
   # Loop to identify critical sample size (advanced)  
   for (i in 2:100) {
     p.temp <- numeric()
     for (j in 1:500) {
     s1 <- rnorm(i, 177)
     s2 <- rnorm(i, 178)
     t <- t.test(s1, s2) 
     p.temp[j] <- t$p.value
     }
     p.vals[i] <- mean(p.temp)
   }
   
   n <- seq(1,100)
   
   plot(1:100, p.vals, xlab="n", ylab="p-value")
    points(n[p.vals<0.05], p.vals[p.vals<0.05], pch=19)
   abline(h= 0.05)
   
   which(p.vals < 0.05)[1]
   
   
   ################
   # Nominal data
   binom.test(7, 10, p=0.5)
   
     p <- numeric()
   for(i in 10:100) {
    bt <- binom.test(round(0.7*i), i)      
     # p <- append(p, bt$p.value)
     p[i] <- bt$p.value
   }
     
     which(p < 0.05)[1]
     
   res <-  cbind(round(0.7*1:100), 1:100, p)
     
     
     
     
   binom.test(70, 100)
   
   binom.test(6, 10)
   
   ###############
   # Bryozoan test
   s1 <- c(214, 41, 6)
   n1 <- sum(s1)
   b1 <- 41/n1
   e1 <- sqrt(b1 * (1-b1)/n1)
     
   s2 <- c(69, 28, 48, 25, 7, 6, 2)
   n2 <- sum(s2) 
   b2 <- 28/n2
   e2 <- sqrt(b2 * (1-b2)/n2)
   
   cat(paste0("Proportion of bryozoans in sample S1 = ", 
               round(b1, 2), "±", round(e1,2), 
               "\nand in sample S2 = ",
               round(b2,2), "±", round(e2, 2)))
   
   plot(c(0.5, 2.5), c(0.1, 0.2), type="n")
   points(c(1,2), c(b1, b2))
    segments(c(1,2), c(b1-e1, b2-e2), c(1,2), c(b1+e1, b2+e2)) 
   
    
    
   summary(sizes)
   boxplot(sizes)
   
   t.sizes <- c(sizes, 120)
   boxplot(t.sizes)
   
   shapiro.test(sizes)
   
   
   p.norm <- numeric()
   for(i in 1:100) p.norm[i] <- shapiro.test(rnorm(100))$p.value
   which(p.norm < 0.05)
   
   ###############
   
   # Binomial error ----
   p <- seq(0.01, 0.99, by=0.01)
   n = 100
    SE <- sqrt(p * (1-p)/n)   
      
    plot(p, SE, type="l")
    
    ## Correlations and regression
    # get abiotic earth system data
    dat <- read.csv("abio.csv", header=T)
  plot(dat)
 
  
     plot(dat$age, dat$T.bin, type="l")
      t <-  cor.test(dat$age, dat$T.bin)
       R <- t$estimate
       p <- t$p.value
      text(200, 35, labels=paste0("R=", round(R,2), ", p=", round(p,3)))
       
     rl <- lm(dat$T.bin ~ dat$age)
     summary(rl)
     abline(rl)
   
     cor.test(dat$age, dat$Sr.bin, method="spearman")
     rl <- lm(dat$Sr.bin ~ dat$age)
   
     shapiro.test(dat$Sr.bin) # not normal
     shapiro.test(dat$T.bin) # normal
     shapiro.test(dat$d34S) # not normal
     shapiro.test(dat$C.bin) # normal
     shapiro.test(dat$mg.ca) # not normal
     shapiro.test(dat$zaf.bin) # not normal
     
     cor(dat)
   
     
     require(corrplot)
      source("rquery_function.R")
       rquery.cormat(as.matrix(dat))
     
  
     hist(dat$d34S)
     
     cor(dat)

    require(Hmisc)   
      rcorr(as.matrix(dat))   
   rcorr(as.matrix(dat), type="spearman")  

   
   ### linear models
   mod <- lm(dat$d34S ~ dat$age)
    summary(mod)
    
    plot(dat$age, dat$d34S)
     abline(mod)
    
     
  # explain d34S
     # dat <- dat[3:49,]
     
     mod <- lm(dat$d34S ~ dat$age + dat$Sr.bin)
     mod <- lm(d34S ~ age + Sr.bin, data=dat)
     
     summary(mod)
     
     summary(lm(d34S ~ age, data=dat))
     
     
     
     
     mod <- lm(d34S ~ age + Sr.bin + T.bin + C.bin + zaf.bin + mg.ca + sea.lev, data=dat)
     summary(mod)

     final.mod <-  step(mod, k =log(n))     
       final.mod
      summary(final.mod)    
      
      
      
    mod1 <- lm(d34S ~ age + Sr.bin*sea.lev, data=dat)
     summary(mod1)
     
     mod2 <- lm(d34S ~ age + Sr.bin + sea.lev, data=dat)
     summary(mod2)    
     
     
     mod <- lm(d34S ~ age * T.bin * C.bin * zaf.bin * sea.lev, data=dat)   
    summary(mod)     
     step(mod)    
     