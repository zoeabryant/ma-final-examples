require 'geo-distance'

  lon1 = -0.088002
  lat1 = 51.525724

  lon2 = -0.089590
  lat2 = 51.527640

def get_distance_from_coordinates lat1, lon1, lat2, lon2
  # dist = GeoDistance.distance( lat1, lon1, lat2, lon2 ) # in radians
  # dist = GeoDistance::Haversine.geo_distance( lon1, lat1, lon2, lat2)
  # dist = GeoDistance::Haversine.geo_distance( p1, p2).to_miles


  GeoPoint.coord_mode = :lng_lat
  p1, p2 = [[lon1, lat1].geo_point, [lon2, lat2].geo_point]
  dist = GeoDistance::Haversine.geo_distance( p1, p2)

  # dist = GeoDistance::Haversine.geo_distance( lat1, lon1, lat2, lon2 )

  puts "the distance from  #{lat1}, #{lon1} to #{lat2}, #{lon2} is: #{dist.meters} meters"

  # dist.feet
  # dist.meters
  # dist.kms
  # dist.miles
end

get_distance_from_coordinates lat1, lon1, lat2, lon2