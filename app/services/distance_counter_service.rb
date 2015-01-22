class DistanceCounterService

    def self.count_distance(a, b)
    rad_per_deg = Math::PI/180
    rkm = 6371
    rm = rkm * 1000

    dlon_rad = (b[1]-a[1]) * rad_per_deg
    dlat_rad = (b[0]-a[0]) * rad_per_deg

    lat1_rad, lon1_rad = a.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = b.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c
  end
end