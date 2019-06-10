class PeopleController < ApplicationController
  PersonQuery = IIC3103SwapiGraphql::Client.parse <<-'GRAPHQL'
    query ($id: ID, $personID: ID){
      person(id: $id, personID: $personID) {
        id
        name
        birthYear
        eyeColor
        gender
        hairColor
        height
        mass
        skinColor
        homeworld {
          id
          name
        }
        filmConnection {
          films {
            id
            title
          }
        }
        starshipConnection {
          starships {
            id
            name
          }
        }
      }
    }
    GRAPHQL

  def show
    data = query PersonQuery, id: params[:people_id]
    @person = data.film
  end
end
