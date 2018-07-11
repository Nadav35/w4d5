
class Cat < ApplicationRecord
  COLORS = ['orange', 'white', 'tabby', 'grey', 'purple', 'naked', 'tuxedo', 'calico'] 
  SEX = ['M', 'F']
  
  validates :birth_date, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, message: "must enter a valid color"}
  validates :sex, inclusion: {in: SEX, message: "Must enter a capital M or F"}
  
  def age
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)  
  end
  
  # def validate_sex
  #   if sex.upcase == 'M' || sex.upcase == 'F'
  #     sex.upcase
  #   else
  #     Cat.errors[sex] << 'Please enter M or F'
  #   end
  # end

end