class MovieController < ApplicationController
  AllMoviesQuery = IIC3103SwapiGraphql::Client.parse <<-'GRAPHQL'
    query {
      allFilms {
        films {
          title
          episodeID
          openingCrawl
          director
          producers
          releaseDate
        }
      }
    }
    GRAPHQL

  def index
    data = query AllMoviesQuery

    @movies = data.all_films.films
  end

  def show
  end
end
