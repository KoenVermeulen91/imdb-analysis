#Reading data (reading tabular data)
imdb <- read.csv("Source_files/ratings.csv")
imdb$Const <- as.character(imdb$Const)

summary(imdb)

classes <- sapply(imdb, class)
classes

plot(imdb$IMDb.Rating, ordered(imdb$IMDb.Rating))
plot(imdb$Year, ordered(imdb$Year))
plot(imdb$Your.Rating, ordered(imdb$Your.Rating))

#TV-shows, etc. filtered - movies left
imdb.movies <- imdb[imdb$Title.Type == "movie", ]
imdb.movies$Date.Rated <- as.Date(imdb.movies$Date.Rated)
imdb.movies$Release.Date <- as.Date(imdb.movies$Release.Date)
imdb.movies$Dif.rate.release.date <- imdb.movies$Date.Rated - imdb.movies$Release.Date

#Add directors and genres
imdb.genres <- read.table("Source_files/genres.csv", header = TRUE, sep = ";")
imdb.directors <- read.table("Source_files/directors.csv", header = TRUE, sep = ";")

#Test missing value delete
##imdbcomplete <- complete.cases(imdb)
##imdbcomplete

#Dummy genres
imdb.movies$Action <- as.logical(ifelse(grepl("Action", imdb.movies$Genres), 1, 0))
imdb.movies$Adventure <- as.logical(ifelse(grepl("Adventure", imdb.movies$Genres), 1, 0))
imdb.movies$Animation <- as.logical(ifelse(grepl("Animation", imdb.movies$Genres), 1, 0))
imdb.movies$Biography <- as.logical(ifelse(grepl("Biography", imdb.movies$Genres), 1, 0))
imdb.movies$Comedy <- as.logical(ifelse(grepl("Comedy", imdb.movies$Genres), 1, 0))
imdb.movies$Crime <- as.logical(ifelse(grepl("Crime", imdb.movies$Genres), 1, 0))
imdb.movies$Documentary <- as.logical(ifelse(grepl("Documentary", imdb.movies$Genres), 1, 0))
imdb.movies$Drama <- as.logical(ifelse(grepl("Drama", imdb.movies$Genres), 1, 0))
imdb.movies$Family <- as.logical(ifelse(grepl("Family", imdb.movies$Genres), 1, 0))
imdb.movies$Fantasy <- as.logical(ifelse(grepl("Fantasy", imdb.movies$Genres), 1, 0))
imdb.movies$Film_Noir <- as.logical(ifelse(grepl("Film-Noir", imdb.movies$Genres), 1, 0))
imdb.movies$History <- as.logical(ifelse(grepl("History", imdb.movies$Genres), 1, 0))
imdb.movies$Horror <- as.logical(ifelse(grepl("Horror", imdb.movies$Genres), 1, 0))
imdb.movies$Music <- as.logical(ifelse(grepl("Music", imdb.movies$Genres), 1, 0))
imdb.movies$Musical <- as.logical(ifelse(grepl("Musical", imdb.movies$Genres), 1, 0))
imdb.movies$Mystery <- as.logical(ifelse(grepl("Mystery", imdb.movies$Genres), 1, 0))
imdb.movies$Romance <- as.logical(ifelse(grepl("Romance", imdb.movies$Genres), 1, 0))
imdb.movies$Sci_Fi <- as.logical(ifelse(grepl("Sci-Fi", imdb.movies$Genres), 1, 0))
imdb.movies$Short <- as.logical(ifelse(grepl("Short", imdb.movies$Genres), 1, 0))
imdb.movies$Sport <- as.logical(ifelse(grepl("Sport", imdb.movies$Genres), 1, 0))
imdb.movies$Thriller <- as.logical(ifelse(grepl("Thriller", imdb.movies$Genres), 1, 0))
imdb.movies$War <- as.logical(ifelse(grepl("War", imdb.movies$Genres), 1, 0))
imdb.movies$Western <- as.logical(ifelse(grepl("Western", imdb.movies$Genres), 1, 0))

summary(imdb.movies)

#create new columns in imdb.movies from imdb.directors$Director
#look for the column name of the director is imdb.movies$Directors
