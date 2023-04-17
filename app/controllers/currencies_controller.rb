class CurrenciesController < ApplicationController
  def first_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    render ({ :template => "currency_templates/step_one.html.erb" })
  end

  def second_currency
    @currency = params.fetch("code")
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    render ({ :template => "currency_templates/step_two.html.erb" })
  end

  def convert_currency
    @currency_one = params.fetch("code")
    @currency_two = params.fetch("code_two")
    @raw_data = open("https://api.exchangerate.host/convert?from=USD&to=EUR").read
    @parsed_data = JSON.parse(@raw_data)
    @queries_hash = @parsed_data.fetch("query")
    @info_hash = @parsed_data.fetch("info")
    @rate = @info_hash.fetch("rate")

    render ({ :template => "currency_templates/step_three.html.erb" })
  end
end
