# Data types

typeof(3.14)
typeof(1L)
typeof(1+1i)
typeof(TRUE)
typeof("banana")

# Dates - the luvbricate package makes working with dates and times easier

library(lubridate)

today()
now()
ymd("2020-04-20") # year month day
mdy ("April 20th, 2020")# month day year
dmy("20-April-2020")# day month year

#date-time can be created

ymd_hms("2020-04-20 4:50:30") # year month day hour minute second

mdy_hm("04-20-2020 4:52") # month, day, year hour minute

#Vectors

my_vector <- vector(length=3)
my_vector # If we do not choose the datatype it will default to logical

another_vector <- vector(mode='character', length = 3)
another_vector

combine_vector <- c(2,6,3)
combine_vector

quiz_vector <- c(2,6,'3')
quiz_vector # the answer will be all characters 
#as the values of the vector should be of the same type

# type coercion

coercion_vector <- c('a', TRUE)
coercion_vector
another_coercion_vector <- c(0,TRUE)
another_coercion_vector

# character vector
character_vector_example <-c('0','2','4')
character_vector_example

character_coerced_to_numeric <- as.numeric(character_vector_example)
character_coerced_to_numeric

numeric_coerced_to_logical <- as.logical(character_coerced_to_numeric)
numeric_coerced_to_logical

# the combine function, c(), will also append things to an existing vector

ab_vector <- c('a','b')
ab_vector

combine_example <- c(ab_vector, 'SWC')
combine_example

# series of numbers


my_series <- 1:10
my_series

seq(10)
seq(1,10, by=0.1)


#questions about the sequence

sequence_example <- seq(10)
head(sequence_example, n=2) # the first two of the sequence)
tail(sequence_example, n=4)
length(sequence_example)
class(sequence_example)
typeof(sequence_example)

# elements in the vector can be named
my_example <- 5:8
my_example

my_example <- 5:8
names(my_example) <- c("a","b","c","d")
my_example

names(my_example)

# Challenge 1
sequence <- 1:26
sequence
doubled_sequence <- sequence*2
doubled_sequence
names(doubled_sequence) <- LETTERS
names(doubled_sequence)

#Lists
list_example <- list(1,"a",TRUE, 1+4i)
list_example

another_list <- list(title="Numbers", numbers = 1:10, data=TRUE)
another_list

# Lists can even contain other lists:

nested_lists <- list(list_example,another_list)
nested_lists 

# challenge 2 

library(lubridate)
to_day <-today()
to_day
my_list <- list(to_day, c("Geetha", "green"), list(5))
my_list          
                