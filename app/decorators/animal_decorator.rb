class AnimalDecorator < Draper::Decorator
  delegate_all

  def formatted_birthday
    object.birthday.to_date.strftime('%B %d, %Y')
  end

  def animal_image
    if object.species == "Chicken"
      ActionController::Base.helpers.image_tag("chicken.jpeg", alt: "Chicken", size: "50x50")
    elsif object.species == "Bee"
      ActionController::Base.helpers.image_tag("bee.jpeg", alt: "Bee", size: "50x50")
    else
    end
  end
end