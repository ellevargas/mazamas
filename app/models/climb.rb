class Climb < ActiveRecord::Base
  has_many                  :registrations
  has_and_belongs_to_many   :educations
  belongs_to                :climb_tag
  belongs_to                :climb_schedule
  has_one                   :specific_date
  has_one                   :general_date
  belongs_to                :route
  belongs_to                :leader_1,    class_name: 'User'
  belongs_to                :leader_2,    class_name: 'User'
  belongs_to                :assistant_2, class_name: 'User'
  belongs_to                :assistant_1, class_name: 'User'

  has_one       :mountain,      through: :route
  has_one       :climb_class,   through: :route
  has_one       :climb_class,   through: :route

  #
  # def spots_available
  #   occupied = registrations.where(registration_status: 'accepted').length
  #   occupied += registrations.where(registration_status: 'leader').length
  #   occupied += registrations.where(registration_status: 'assistant').length
  #
  #   available = party_size - occupied
  # end

end
