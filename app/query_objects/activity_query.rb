# frozen_string_literal: true

class ActivityQuery
  class << self
    USD = 72
    EUR = 84
    UAH = 2
    def call(params, relation = Activity.all)
      relation = filter(relation, params[:city_id]) if params[:city_id].present?
      relation = sort(relation, params[:order]) if params[:order].present?
      relation
    end

    private

    def sort(scoped, order = nil)
      scoped.order(sql_order(order))
    end

    def filter(scoped, city = nil)
      scoped.where(city_id: city)
    end

    def sql_order(order)
      case order
      when 'price_asc'
        long_order('ASC')
      when 'price_desc'
        long_order('DESC')
      else
        'weight'
      end
    end

    def long_order(sql_order)
      Arel.sql("CASE currency when 'USD' THEN price * #{USD} when 'EUR' THEN price * #{EUR}
    when 'RUB' then price when 'UAH' then price * #{UAH} END " + sql_order)
    end
  end
end
