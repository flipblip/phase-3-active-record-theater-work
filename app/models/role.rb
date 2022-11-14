class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.collect{|audition|audition.actor}
    end
    def locations
        self.auditions.collect{|audition|audition.location}
    end
    def lead
        self.auditions.any? {|audition|audition.hired} ? self.auditions.find{|audition|audition.hired} : "no actor has been hired for this role"
    end
    def understudy
        self.auditions.filter {|audition|audition.hired}.length > 1 ? self.auditions.filter {|audition|audition.hired}[1] : "'no actor has been hired for understudy for this role"
    end
end