class StarshipController < ApplicationController
  StarShipQuery = IIC3103SwapiGraphql::Client.parse <<-'GRAPHQL'
    query ($id: ID, $starshipID: ID){
      starship(id: $id, starshipID: $starshipID) {
        id
        name
        model
        starshipClass
        manufacturers
        costInCredits
        length
        crew
        passengers
        maxAtmospheringSpeed
        hyperdriveRating
        MGLT	
        cargoCapacity
        consumables
        pilotConnection{
          pilots{
            id
            name
          }
        }
        filmConnection {
          films {
            id
            title
          }
        }
      }
    }
    GRAPHQL

  def show
    data = query StarShipQuery, id: params[:starship_id]
    @starship = data.starship
  end
end
