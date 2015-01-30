class RpgController < ApplicationController

    def index
        session[:activity_list] ||= []
        if @gamble_amount.present?
            session[:current_score] += @gamble_amount;
        else session[:current_score] = 0
        end
    end

    def farm
        @gamble_amount = rand(10..20)
        @date_time = Time.now
        @activity_msg = '<p class="winning">Earned '+@gamble_amount.to_s+' golds from the farm! ('+@date_time.to_s+')</p>'
        session[:current_score] += @gamble_amount
        session[:activity_list].push @activity_msg
        redirect_to '/rpg/index'
    end

    def cave
        @gamble_amount = rand(5..10)
        @date_time = Time.now
        @activity_msg = '<p class="winning">Earned '+@gamble_amount.to_s+' golds from the cave! ('+@date_time.to_s+')</p>'
        session[:current_score] += @gamble_amount
        session[:activity_list].push @activity_msg
        redirect_to '/rpg/index'
    end

    def house
        @gamble_amount = rand(2..5)
        @date_time = Time.now
        @activity_msg = '<p class="winning">Earned '+@gamble_amount.to_s+' golds from the house! ('+@date_time.to_s+')</p>'
        session[:current_score] += @gamble_amount
        session[:activity_list].push @activity_msg
        redirect_to '/rpg/index'
    end

    def casino
        @gamble_amount = rand(-50..50)
        @date_time = Time.now
        if @gamble_amount > 0
            @activity_msg = '<p class="winning">Earned '+@gamble_amount.to_s+' golds from the casino! ('+@date_time.to_s+')</p>'
            session[:current_score] += @gamble_amount
            session[:activity_list].push @activity_msg
            redirect_to '/rpg/index'
        else
            @activity_msg = '<p class="losing">Entered the casino and lost '+@gamble_amount.to_s+' golds.. Ouch.. ('+@date_time.to_s+')'
            session[:current_score] += @gamble_amount
            session[:activity_list].push @activity_msg
            redirect_to '/rpg/index'
        end
    end

    def destroy
        reset_session
        redirect_to '/rpg/index'
    end
end
