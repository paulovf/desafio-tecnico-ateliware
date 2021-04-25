class Repositorio < ApplicationRecord
    validates_presence_of :nome    
    validates_presence_of :descricao
    validates_presence_of :score
    validates_presence_of :data_criacao
    validates_presence_of :curated, in: [true, false]
    validates_presence_of :featured, in: [true, false]
    validates_presence_of :private, in: [true, false]
    validates_presence_of :forks
    validates_presence_of :url
end
