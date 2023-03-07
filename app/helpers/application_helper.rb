module ApplicationHelper
    def profile_image(user)
        
        if user.profile_image.attached?
            image_tag user.profile_image, {style:"height: 40px; width: 40px; object-fit: cover; border-radius: 50%;"}
        else
            image_tag 'https://hips.hearstapps.com/digitalspyuk.cdnds.net/17/13/1490989105-twitter1.jpg?resize=768:*', {style:"height: 40px; width: 40px; object-fit: cover; border-radius: 50%;"}
        end
    end
end
