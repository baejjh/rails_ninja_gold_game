class RpgController < ApplicationController
    def index
        @activity_list = []
        session[:current_score] = 0;
    end

    def farm
        @gamble_amount = rand(10..20)
        session[:random] = @gamble_amount
        redirect_to '/rpg/index'
    end

    def cave
        @gamble_amount = rand(5..10)
        session[:random] = @gamble_amount
        redirect_to '/rpg/index'
    end

    def house
        @gamble_amount = rand(2..5)
        session[:random] = @gamble_amount
        redirect_to '/rpg/index'
    end

    def casino
        @gamble_amount = rand(-50..50)
        session[:random] = @gamble_amount
        redirect_to '/rpg/index'
    end
end
