class Mission < ApplicationRecord
    belongs_to :planet
    belongs_to :scientist


   # must have a name, a scientist and a planet
#a scientist cannot join the same mission twice
validates :name, :scientist_id, :planet_id, presence: true
validates :scientist, uniqueness: { scope: :name }

end
