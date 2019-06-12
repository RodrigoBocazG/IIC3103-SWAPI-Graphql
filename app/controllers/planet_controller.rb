class PlanetController < ApplicationController
  PlanetQuery = IIC3103SwapiGraphql::Client.parse <<-'GRAPHQL'
    query ($id: ID, $planetID: ID){
      planet(id: $id, planetID: $planetID) {
        id
        name
        diameter
        rotationPeriod
        orbitalPeriod
        gravity
        population
        climates
        terrains
        surfaceWater
        residentConnection {
          residents {
            id
            name
          }
        }
        filmConnection{
          films{
            id
            title
          }
        }
      }
    }
    GRAPHQL

  def show
    data = query PlanetQuery, id: params[:planet_id]
    @planet = data.planet
  end
end
