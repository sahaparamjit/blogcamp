class Post < ActiveRecord::Base
    belongs_to :user
    def self.search(search)
        #where("title LIKE ? OR content LIKE ? OR tags LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
        where("title LIKE ? and status = ?", "%#{search}%", "Published") 
        where("content.html_safe LIKE ? and status = ?", "%#{search}%", "Published")
        where("tags LIKE ? and status = ?", "%#{search}%", "Published")
    end
end