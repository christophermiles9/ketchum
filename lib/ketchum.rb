require 'ketchum/version'

require 'rest-client'
require 'json'

module Ketchum
  class << self
    BASE_URL = 'http://pokeapi.co/api/v2/'

    RESOURCES = [
      'ability', 'berry', 'berry_firmness', 'berry_flavor', 'characteristic',
      'contest_effect', 'contest_type', 'egg_group', 'encounter_condition',
      'encounter_condition_value', 'encounter_method', 'evolution_chain',
      'evolution_trigger', 'gender', 'generation', 'growth_rate', 'item',
      'item_attribute', 'item_category', 'item_fling_effect', 'item_pocket',
      'language', 'location', 'location_area', 'move', 'move_ailment',
      'move_battle_style', 'move_category', 'move_damage_class',
      'move_learn_method', 'move_target', 'nature', 'pal_park_area',
      'pokeathlon_stat', 'pokedex', 'pokemon', 'pokemon_color', 'pokemon_form',
      'pokemon_shape', 'pokemon_species', 'region', 'stat',
      'super_contest_effect', 'type', 'version', 'version_group'
    ]

    def initialize(format = :json)
      @format = format
    end

    def method_missing(method, *args)
      if RESOURCES.include? method.to_s
        method = hyphenate(method.to_s)
        get(method.to_s, args[0], args[1])
      end
    end

    private

    def get(resource, id = '', format = @format)
      url = "#{BASE_URL}#{resource}/#{id}"
      response = RestClient.get(url)
      if format == :hash
        response = JSON.parse(response)
      elsif format == :ostruct
        response = OpenStruct.new(JSON.parse(response))
      end
      response
    end

    def hyphenate(resource)
      resource.gsub('_', '-')
    end
  end
end
