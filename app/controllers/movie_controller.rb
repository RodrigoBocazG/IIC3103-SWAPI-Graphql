class MovieController < ApplicationController
  AllMoviesQuery = IIC3103SwapiGraphql::Client.parse <<-'GRAPHQL'
    query {
      allFilms {
        films {
          id
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

  FilmQuery = IIC3103SwapiGraphql::Client.parse <<-'GRAPHQL'
    query ($id: ID, $filmID: ID){
      film(id: $id, filmID: $filmID) {
        id
        title
        episodeID
        openingCrawl
        director
        producers
        releaseDate
        starshipConnection {
          starships {
            id
            name
          }
        }
        characterConnection {
          characters {
            id
            name
          }
        }
        planetConnection {
          planets {
            id
            name
          }
        }
      }
    }
    GRAPHQL

  def show
    data = query FilmQuery, id: params[:film_id]
    @movie = data.film
  end
end
