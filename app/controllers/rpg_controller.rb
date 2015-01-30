class RpgController < ApplicationController

    def index
        @activity_list = []
        if @gamble_amount.present?
            session[:current_score] += @gamble_amount;
        else session[:current_score]
        end
    end

    def farm
        @gamble_amount = rand(10..20)
        @date_time = Time.now
        session[:activity_msg] = '<p class="winning">Earned '+@gamble_amount.to_s+' golds from the farm! ('+@date_time.to_s+')</p>'
        redirect_to '/rpg/index'
    end

    def cave
        @gamble_amount = rand(5..10)
        @date_time = Time.now
        session[:activity_msg] = '<p class="winning">Earned '+@gamble_amount.to_s+' golds from the cave! ('+@date_time.to_s+')</p>'
        redirect_to '/rpg/index'
    end

    def house
        @gamble_amount = rand(2..5)
        @date_time = Time.now
        session[:activity_msg] = '<p class="winning">Earned '+@gamble_amount.to_s+' golds from the house! ('+@date_time.to_s+')</p>'
        redirect_to '/rpg/index'
    end

    def casino
        @gamble_amount = rand(-50..50)
        @date_time = Time.now
        if @gamble_amount > 0
            session[:activity_msg] = '<p class="winning">Earned '+@gamble_amount.to_s+' golds from the casino! ('+@date_time.to_s+')</p>'
            redirect_to '/rpg/index'
        else
            session[:activity_msg] = '<p class="losing">Entered the casino and lost '+@gamble_amount.to_s+' golds.. Ouch.. ('+@date_time.to_s+')'
            redirect_to '/rpg/index'
        end
    end
end
