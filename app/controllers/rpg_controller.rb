class RpgController < ApplicationController
    def index
    end

    def farm
        @gamble_amount = rand(10..20)
    end

    def cave
        @gamble_amount = rand(5..10)
    end

    def house
        @gamble_amount = rand(2..5)
    end

    def casino
        @gamble_amount = rand(-50..50)
    end
end
